{ pkgs, ... }:
{
  nixpkgs.overlays = [
    (self: super: {
      libinput = super.libinput.override {
        eventGUISupport = true;
      };
    })
  ];
  services.libinput.enable = true;
  environment.systemPackages = with pkgs; [
    libinput
  ];
}
