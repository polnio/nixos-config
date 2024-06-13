{ config, pkgs, ... }: {
  os.programs.neovim = {
    enable = true;
    # defaultEditor = true;
  };
  hm.xdg.configFile."nvim" = {
    source = ./config;
    recursive = true;
  };

  hm.xdg.configFile."nvim/spell/fr.utf-8.spl".source = builtins.fetchurl {
    url = "http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl";
    sha256 = "abfb9702b98d887c175ace58f1ab39733dc08d03b674d914f56344ef86e63b61";
  };

  hm.programs.git.ignores = [ "Session.vim" ];
  os.environment.systemPackages = with pkgs; [
    neovide

    biome
    rustup
    clang-tools
    cppcheck
    cpplint
    go
    golangci-lint
    golangci-lint-langserver
    gopls
    lua-language-server
    nil
    nixfmt
    nodePackages_latest.typescript-language-server
    ripgrep
    typst-lsp
    uncrustify
    vala-language-server
    vala-lint
  ];

  hm.home.sessionVariables = {
    EDITOR = "neovide";
    # UNCRUSTIFY_CONFIG = "-";
    UNCRUSTIFY_CONFIG = ./uncrustify.cfg;
  };
}
