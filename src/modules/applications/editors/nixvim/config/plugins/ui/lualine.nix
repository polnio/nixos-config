{ lib, ... }:
let
  inherit (lib.nixvim) listToUnkeyedAttrs;
in
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        icons_enabled = true;
        component_separators = "|";
        section_separators = {
          left = "";
          right = "";
        };
      };
      sections = {
        lualine_a = [
          (
            (listToUnkeyedAttrs [ "mode" ])
            // {
              separator = {
                left = "";
                right = "";
              };
            }
          )
        ];
        lualine_b = [
          ((listToUnkeyedAttrs [ "filename" ]) // { colored = true; })
          ((listToUnkeyedAttrs [ "branch" ]) // { colored = true; })
        ];
        lualine_c = [ ];
        lualine_x = [ "diagnostics" ];
        lualine_y = [ "progress" ];
        lualine_z = [
          (
            (listToUnkeyedAttrs [ "location" ])
            // {
              separator = {
                left = "";
                right = "";
              };
              icon = "";
            }
          )
        ];
      };
    };
  };
}
