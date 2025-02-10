{ ... }:
let
  lspInPicker = key: action: {
    inherit key;
    action = '':Pick lsp scope="${action}"<cr>'';
  };
in
{
  plugins.lsp = {
    enable = true;
    keymaps = {
      diagnostic."[d" = "goto_prev";
      diagnostic."]d" = "goto_next";
      diagnostic."<leader>ld" = "open_float";
      # lspBuf."gd" = "definition";
      # lspBuf."gi" = "implementation";
      # lspBuf."gt" = "type_definition";
      # lspBuf."gr" = "references";
      lspBuf."K" = "hover";
      lspBuf."<leader>la" = "code_action";
      lspBuf."<leader>lr" = "rename";
      # lspBuf."<leader>lh" = "toggle_inlay_hint";
      extra = [
        {
          key = "<leader>lD";
          # action = ''require("telescope.builtin").diagnostics()'';
          action = '':Pick diagnostic<cr>'';
          options.desc = "Open diagnostics list";
        }
        (lspInPicker "gd" "definition")
        (lspInPicker "gi" "implementation")
        (lspInPicker "gt" "type_definition")
        (lspInPicker "gr" "references")
      ];
    };
  };
  plugins.lsp-lines.enable = true;
}
