{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.xwiimote ];
  boot.kernelModules = [ "uinput" ];
  services.udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", MODE="0660"
  '';
  hardware.bluetooth = {
    settings.General.Enable = "Source,Sink,Media,Socket,Input";
    input.General.ClassicBondedOnly = false;
  };
}
