{
  pkgs,
  ...
}:
let
  forEachWorkspace =
    fn: builtins.concatLists (builtins.genList (x: fn (builtins.toString (x + 1))) 9);
in
{
  wayland.windowManager.hyprland = {
    plugins = [ pkgs.hyprlandPlugins.hyprsplit ];
    settings = {
      binde =
        [
          "SUPER, mouse_down, split:workspace, e+1"
          "SUPER, mouse_up, split:workspace, e-1"
          "SUPER, comma, split:workspace, e-1"
          "SUPER, period, split:workspace, e+1"
        ]
        ++ forEachWorkspace (workspace: [
          "SUPER, ${workspace}, split:workspace, ${workspace}"
          "SUPER SHIFT, ${workspace}, split:movetoworkspacesilent, ${workspace}"
        ]);
    };
  };
}
