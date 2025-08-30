{
  description = "My NixOS configuration";

  inputs = {
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    blackbox-catppuccin = {
      url = "github:catppuccin/blackbox";
      flake = false;
    };
    catppuccin-discord = {
      url = "https://catppuccin.github.io/discord/dist/catppuccin-mocha-blue.theme.css";
      flake = false;
    };
    catppuccin-swaync = {
      url = "https://github.com/catppuccin/swaync/releases/latest/download/catppuccin-mocha.css";
      flake = false;
    };
    cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    doom-emacs = {
      url = "github:doomemacs/doomemacs";
      flake = false;
    };
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim-spell-fr = {
      # url = "http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl";
      url = "http://mirrors.standaloneinstaller.com/vim/runtime/spell/fr.utf-8.spl";
      flake = false;
    };
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nw = {
      # url = "flake:nw";
      url = "github:polnio/nw";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    prismlauncher-catppuccin = {
      url = "https://github.com/PrismLauncher/Themes/releases/latest/download/Catppuccin-Mocha-theme.zip";
      flake = false;
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nur.follows = "nur";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser-catppuccin = {
      url = "github:catppuccin/zen-browser";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = pkgs.lib;
    in
    {
      packages.${system} = builtins.listToAttrs (
        map (
          path:
          lib.nameValuePair (builtins.unsafeDiscardStringContext (
            lib.pipe path [
              (lib.splitString "/")
              (lib.init)
              (lib.last)
            ]
          )) (import path { inherit inputs pkgs lib; })
        ) ((import ./utils/importModules.nix { inherit lib; }).recursiveModules ./src).package
      );
      nixosConfigurations.PocoMachine = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs self;
        };
        modules = [
          home-manager.nixosModules.home-manager
          (
            args@{ config, lib, ... }:
            let
              # test = import ./test.nix { lib = nixpkgs.lib; };
              settings = config.settings;
              utils = import ./utils (
                args
                // {
                  inherit settings pkgs;
                }
              );
              modules = utils.recursiveModules ./src;
            in
            {
              _module.args = {
                inherit settings;
                myUtils = utils;
                osConfig = config;
                hmConfig = config.home-manager.users.polnio;
              };

              imports = modules.nixos ++ modules.settings;

              home-manager.useUserPackages = true;
              home-manager.useGlobalPkgs = true;
              home-manager.extraSpecialArgs = {
                inherit inputs self;
              };
              home-manager.users.polnio =
                { config, osConfig, ... }:
                {
                  _module.args = {
                    inherit settings;
                    myUtils = utils;
                    hmConfig = config;
                  };
                  imports = modules.home;
                  home.stateVersion = "23.11";
                };
            }
          )
          ./hardware-configuration.nix
          ./configuration.nix
        ];
      };
    };
}
