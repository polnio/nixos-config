{ pkgs, ... }:
{
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  environment.systemPackages = [
    (pkgs.spice-gtk.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [ ./usb.patch ];
    }))
  ];
  programs.virt-manager.enable = true;
}
