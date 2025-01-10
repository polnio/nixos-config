{
  pkgs,
  lib,
  settings,
  # utils,
  inputs,
  ...
}:
{
  programs.neovim.enable = true;
  xdg.configFile."nvim" = lib.mkForce {
    source = ./config;
    # source = hmConfig.lib.file.mkOutOfStoreSymlink (utils.getConfigPath ./config);
    recursive = true;
  };

  xdg.configFile."neovide/config.toml".text = "";

  xdg.configFile."nvim/spell/fr.utf-8.spl".source = inputs.nvim-spell-fr;

  programs.git = {
    ignores = [ "Session.vim" ];
    extraConfig = {
      safe.directory = [ "${settings.os-config.path}/modules/applications/editors/neovim/config" ];
    };
  };

  programs.neovim.extraPackages = with pkgs; [
    biome
    clang-tools
    cppcheck
    # cpplint
    fd
    gcc
    gnumake
    go
    golangci-lint
    golangci-lint-langserver
    gopls
    lua5_1
    lua-language-server
    luajitPackages.luarocks
    metals
    nil
    nixfmt-rfc-style
    nodePackages_latest.typescript-language-server
    pylint
    python3
    python312Packages.python-lsp-server
    ripgrep
    rustup
    clippy
    shfmt
    typst-lsp
    uncrustify
    vala-language-server
    vala-lint
    vscode-langservers-extracted
    vue-language-server
  ];

  home.sessionVariables = {
    EDITOR = "neovide";
    UNCRUSTIFY_CONFIG = ./uncrustify.cfg;
  };

  home.shellAliases = {
    n = "nvim";
  };
}
