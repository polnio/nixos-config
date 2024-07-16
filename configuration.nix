{
  lib,
  pkgs,
  osConfig,
  hmConfig,
  inputs,
  combinedManager,
  ...
}:
let
  user = "polnio";
in
{
  # inputs = { combined-manager.url = "github:flafydev/combined-manager"; };

  osModules = [ ./hardware-configuration.nix ];
  hmModules = [ ];

  # Setting overlays
  # os.nixpkgs.overlays = [ (_final: prev: { customCat = prev.bat; }) ];
  os.nixpkgs.config.allowUnfree = true;

  os.boot.kernelPackages = pkgs.linuxPackages_zen;
  os.boot.loader.systemd-boot.enable = true;
  os.boot.loader.efi.canTouchEfiVariables = true;
  os.services.asusd.enable = true;
  os.services.udisks2.enable = true;
  os.services.upower.enable = true;
  os.security.polkit.enable = true;
  os.programs.dconf.enable = true;

  # Configure network proxy if necessary
  # os.networking.proxy.default = "http://user:password@proxy:port/";
  # os.networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  os.networking.networkmanager.enable = true;
  os.networking.hostName = "PocoMachine";

  os.hardware.graphics.enable = true;

  hmUsername = user;
  os.users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "video"
      "adbusers"
      "libvirtd"
      "incus-admin"
    ];
    packages = [ ];
  };

  /*
    os.environment.systemPackages = with pkgs;
    lib.mkIf (!osConfig.programs.vim.defaultEditor) [ customCat ];
  */

  os.nix = {
    package = pkgs.nix.overrideAttrs (old: {
      patches =
        (old.patches or [ ])
        ++ (map (file: "${combinedManager}/nix-patches/${file}") (
          lib.attrNames (
            lib.filterAttrs (_: type: type == "regular") (builtins.readDir "${combinedManager}/nix-patches")
          )
        ));
    });
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "${user}"
      ];
    };
  };
  hm.home.stateVersion = "23.11";
  os.system.stateVersion = "23.11";
}
