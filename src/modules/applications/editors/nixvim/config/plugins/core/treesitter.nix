{
  pkgs,
  lib,
  config,
  ...
}:
let
  inherit (lib) mkOption types;
  inherit (config.myOptions) treesitter;
in
{
  options.myOptions.treesitter = mkOption {
    type = with types; listOf str;
    default = [ ];
    description = "Filetypes";
  };
  config = {
    plugins.treesitter = {
      enable = true;
      grammarPackages = map (
        filetype: pkgs.vimPlugins.nvim-treesitter.builtGrammars.${filetype}
      ) treesitter;
    };

    plugins.treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          af = "@function.outer";
          "if" = "@function.inner";

          ac = "@class.outer";
          ic = "@class.inner";

          aa = "@parameter.outer";
          ia = "@parameter.inner";

          aC = "@conditional.outer";
          iC = "@conditional.inner";

          aS = "@statement.outer";
          iS = "@statement.inner";

          aD = "@block.outer";
          iD = "@block.inner";

          aF = "@field.outer";
          iF = "@field.inner";

          aM = "@macro.outer";
          iM = "@macro.inner";

          aT = "@table.outer";
          iT = "@table.inner";

          aR = "@comment.outer";
          iR = "@comment.inner";
        };
      };
    };
  };
}
