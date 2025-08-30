{
  pkgs,
  ...
}:
pkgs.stdenv.mkDerivation {
  name = "poco-machine-ags";
  src = ./config;
  nativeBuildInputs = with pkgs; [
    wrapGAppsHook
    gobject-introspection
    ags
  ];

  buildInputs = with pkgs; [
    glib
    gjs
    networkmanager

    astal.io
    astal.astal4
    astal.hyprland
    astal.wireplumber
    astal.bluetooth
    astal.network
    astal.battery
    astal.tray
    astal.apps
  ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share

    cp -r assets $out/share
    ${pkgs.ags}/bin/ags bundle app.ts $out/share/poco-machine-ags -d "SRC='$out/share'"
    cat > $out/bin/poco-machine-ags <<EOF
    #!${pkgs.bash}/bin/bash -e
    exec ${pkgs.ags}/bin/ags run $out/share/poco-machine-ags
    EOF
    chmod +x $out/bin/poco-machine-ags
  '';
}
