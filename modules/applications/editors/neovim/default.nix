{ pkgs, configDir, ... }: {
  os.programs.neovim = { enable = true; };
  hm.xdg.configFile."nvim" = {
    source = ./config;
    recursive = true;
  };

  hm.xdg.configFile."nvim/spell/fr.utf-8.spl".source = builtins.fetchurl {
    url = "http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl";
    sha256 = "abfb9702b98d887c175ace58f1ab39733dc08d03b674d914f56344ef86e63b61";
  };

  hm.programs.git = {
    ignores = [ "Session.vim" ];
    extraConfig = {
      safe.directory =
        [ "${configDir}/modules/applications/editors/neovim/config" ];
    };
  };

  os.environment.systemPackages = with pkgs; [
    neovide
    (import ./nvims.nix { inherit pkgs; })

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
    vscode-langservers-extracted
  ];

  hm.home.sessionVariables = {
    EDITOR = "neovide";
    UNCRUSTIFY_CONFIG = ./uncrustify.cfg;
  };

  hm.home.shellAliases = { n = "nvim"; };
}
