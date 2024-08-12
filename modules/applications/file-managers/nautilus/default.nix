{ pkgs, lib, ... }:
{
  os.services.gvfs.enable = true;
  os.environment.systemPackages = [ pkgs.nautilus ];
  os.environment.sessionVariables.GST_PLUGIN_SYSTEM_PATH_1_0 =
    lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0"
      (
        with pkgs.gst_all_1;
        [
          gst-plugins-good
          gst-plugins-bad
          gst-plugins-ugly
          gst-libav
        ]
      );
  settings = {
    commands.fileExplorer = "${pkgs.nautilus}/bin/nautilus";
    windows.no-bar = [ "org.gnome.Nautilus" ];
  };
}
