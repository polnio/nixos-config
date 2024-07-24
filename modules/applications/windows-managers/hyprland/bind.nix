{
  config,
  pkgs,
  lib,
  mkUtils,
  ...
}:
let
  utils = mkUtils lib;

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

  forEachWorkspace =
    fn: builtins.concatLists (builtins.genList (x: fn (builtins.toString (x + 1))) 9);
in
{
  hm.wayland.windowManager.hyprland.settings = utils.recursiveMerge (
    [
      {
        binde =
          [
            "SUPER SHIFT, R, exec, ${pkgs.hyprland}/bin/hyprctl reload"
            "SUPER, B, hy3:makegroup, v"
            "SUPER, N, hy3:makegroup, h"
            "SUPER, E, hy3:changegroup, opposite"
            "SUPER, W, hy3:changegroup, toggletab"
            "SUPER SHIFT, W, hy3:makegroup, tab"
            "SUPER, A, hy3:changefocus, raise"
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
              "SUPER, ${x.left}, hy3:movefocus, l"
              "SUPER, ${x.right}, hy3:movefocus, r"
              "SUPER, ${x.up}, hy3:movefocus, u"
              "SUPER, ${x.down}, hy3:movefocus, d"
              "SUPER SHIFT, ${x.left}, hy3:movewindow, l"
              "SUPER SHIFT, ${x.right}, hy3:movewindow, r"
              "SUPER SHIFT, ${x.up}, hy3:movewindow, u"
              "SUPER SHIFT, ${x.down}, hy3:movewindow, d"
            ]) mvts
          ));
        bindm = [
          "SUPER, mouse:272, movewindow"
          "SUPER, mouse:273, resizewindow"
        ];
        bindn = [ ", mouse:272, hy3:focustab, mouse" ];

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
        "bind${optionalString keymap.repeat "e"}${optionalString keymap.release "r"}${optionalString keymap.lockscreen "l"}${optionalString keymap.ignoreModifiers "i"}" = [
          "${optionalString keymap.super "SUPER"} ${optionalString keymap.control "CONTROL"} ${optionalString keymap.shift "SHIFT"} ${optionalString keymap.alt "ALT"}, ${keymap.key}, exec, ${keymap.command}"
        ];
      }
    ) config.settings.keymaps
  );
}
