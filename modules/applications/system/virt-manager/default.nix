{ pkgs, ... }:
{
  os.virtualisation.libvirtd.enable = true;
  os.virtualisation.spiceUSBRedirection.enable = true;
  os.environment.systemPackages = [
    (pkgs.spice-gtk.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [ ./usb.patch ];
    }))
  ];
  os.programs.virt-manager.enable = true;
}
