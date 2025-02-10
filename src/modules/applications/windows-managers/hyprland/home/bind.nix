{
  settings,
  pkgs,
  lib,
  myUtils,
  hmConfig,
  config,
  ...
}:
let
  mvts = [
    {
      left = "left";
      right = "right";
      up = "up";
      down = "down";
    }
    {
      left = "H";
      right = "L";
      up = "K";
      down = "J";
    }
  ];

  # layout = config.wayland.windowManager.hyprland.settings.general.layout;
  layout = (import ./plugins/_settings.nix).layout;
  layoutPrefix =
    if layout == "hy3" then
      "hy3:"
    else if layout == "scroller" then
      "scroller:"
    else
      "";

  forEachWorkspace =
    fn: builtins.concatLists (builtins.genList (x: fn (builtins.toString (x + 1))) 9);
in
{
  wayland.windowManager.hyprland.settings = myUtils.recursiveMerge (
    [
      {
        binde =
          [
            "SUPER SHIFT, R, exec, ${pkgs.hyprland}/bin/hyprctl reload"
            "SUPER, F, fullscreen,"
            "SUPER SHIFT, F, togglefloating,"
            "SUPER, minus, pin"
            "SUPER, mouse_down, workspace, e+1"
            "SUPER, mouse_up, workspace, e-1"
            "SUPER SHIFT, Q, killactive,"
            "SUPER, comma, workspace, e-1"
            "SUPER, period, workspace, e+1"
          ]
          ++ forEachWorkspace (workspace: [
            "SUPER, ${workspace}, workspace, ${workspace}"
            "SUPER SHIFT, ${workspace}, movetoworkspacesilent, ${workspace}"
          ])
          ++ (builtins.concatLists (
            builtins.map (x: [
              "SUPER CONTROL, ${x.left}, resizeactive, -10 0"
              "SUPER CONTROL, ${x.right}, resizeactive, 10 0"
              "SUPER CONTROL, ${x.up}, resizeactive, 0 -10"
              "SUPER CONTROL, ${x.down}, resizeactive, 0 10"
              "SUPER, ${x.left}, ${layoutPrefix}movefocus, l"
              "SUPER, ${x.right}, ${layoutPrefix}movefocus, r"
              "SUPER, ${x.up}, ${layoutPrefix}movefocus, u"
              "SUPER, ${x.down}, ${layoutPrefix}movefocus, d"
              "SUPER SHIFT, ${x.left}, ${layoutPrefix}movewindow, l"
              "SUPER SHIFT, ${x.right}, ${layoutPrefix}movewindow, r"
              "SUPER SHIFT, ${x.up}, ${layoutPrefix}movewindow, u"
              "SUPER SHIFT, ${x.down}, ${layoutPrefix}movewindow, d"
            ]) mvts
          ));
        bindm = [
          "SUPER, mouse:272, movewindow"
          "SUPER, mouse:273, resizewindow"
        ];

        gestures = {
          workspace_swipe = "on";
          workspace_swipe_invert = "yes";
        };

        input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_options = "compose:ralt";
          kb_rules = "";

          follow_mouse = 1;
          mouse_refocus = false;

          touchpad = {
            disable_while_typing = false;
            natural_scroll = true;
            # middle_button_emulation = true;
          };
          sensitivity = 0;
        };
      }
    ]
    ++ builtins.map (
      keymap: with lib; {
        "bind${optionalString keymap.repeat "e"}${optionalString keymap.release "r"}${optionalString keymap.lockscreen "l"}${optionalString keymap.ignoreModifiers "i"}" =
          [
            "${optionalString keymap.super "SUPER"} ${optionalString keymap.control "CONTROL"} ${optionalString keymap.shift "SHIFT"} ${optionalString keymap.alt "ALT"}, ${keymap.key}, exec, ${keymap.command}"
          ];
      }
    ) (builtins.filter (keymap: keymap != null) settings.keymaps)
  );
}
