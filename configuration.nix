{
  pkgs,
  # lib,
  ...
}:
let
  user = "polnio";
in
/*
  haumea = nixpkgs.pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = "haumea";
    rev = "main";
  }
*/
# https://nix-community.github.io/haumea/api/loaders.html
{
  imports = [
    ./hardware-configuration.nix
  ]; # ++ modules.nixos;

  # Setting overlays
  # os.nixpkgs.overlays = [ (_final: prev: { customCat = prev.bat; }) ];
  nixpkgs.config.allowUnfree = true;

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.systemd-boot = {
    enable = true;
    editor = false;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  services.asusd.enable = true;
  services.udisks2.enable = true;
  services.upower.enable = true;
  security.polkit.enable = true;
  programs.dconf.enable = true;

  # Configure network proxy if necessary
  # os.networking.proxy.default = "http://user:password@proxy:port/";
  # os.networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  networking.networkmanager.enable = true;
  networking.hostName = "PocoMachine";
  settings.os-config = rec {
    path = "/etc/nixos";
    flake = "${path}?submodules=1";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libvdpau-va-gl
    ];
  };
  environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";

  users.users.${user} = {
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

  nix = {
    settings = {
      extra-substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
      ];
      extra-trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        user
      ];
    };

    # Optimise the Nix store
    settings.auto-optimise-store = true;
  };
  # hm.home.stateVersion = "23.11";
  system.stateVersion = "23.11";
}
