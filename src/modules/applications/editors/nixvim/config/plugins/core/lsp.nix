{ ... }:
{
  plugins.lsp = {
    enable = true;
    keymaps = {
      diagnostic."gD" = "setqflist";
      lspBuf."gd" = "definition";
      lspBuf."gi" = "implementation";
      lspBuf."gt" = "type_definition";
      lspBuf."gr" = "references";
      lspBuf."K" = "hover";
      lspBuf."<leader>la" = {
        mode = [
          "n"
          "x"
        ];
        action = "code_action";
      };
      lspBuf."<leader>lr" = "rename";
      # lspBuf."<leader>lh" = "toggle_inlay_hint";
    };
  };
  plugins.lsp-lines.enable = true;
  plugins.tiny-inline-diagnostic.enable = true;
  plugins.lensline = {
    enable = true;
    settings.profiles = [
      {
        name = "minimal";
        style = {
          placement = "inline";
          prefix = "";
        };
      }
    ];
  };
  keymaps = [
    {
      key = "gl";
      action.__raw = ''require("lsp_lines").toggle'';
      options.desc = "Toggle diagnostic lines";
    }
  ];
}
