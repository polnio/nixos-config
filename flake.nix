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
      url = "https://github.com/catppuccin/swaync/releases/latest/download/mocha.css";
      flake = false;
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
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    nvim-spell-fr = {
      # url = "http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl";
      url = "http://mirrors.standaloneinstaller.com/vim/runtime/spell/fr.utf-8.spl";
      flake = false;
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
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    {
      nixosConfigurations.PocoMachine = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
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
                  inherit settings;
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
                inherit inputs;
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
