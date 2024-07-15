{ pkgs, inputs, configDir, ... }: {
  inputs = {
    nvim-spell-fr = {
      url = "http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl";
      flake = false;
    };
  };
  os.programs.neovim.enable = true;
  hm.programs.neovim.enable = true;
  hm.xdg.configFile."nvim" = {
    source = ./config;
    recursive = true;
  };

  hm.xdg.configFile."neovide/config.toml".text = "";

  hm.xdg.configFile."nvim/spell/fr.utf-8.spl".source = inputs.nvim-spell-fr;

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
  ];
  hm.programs.neovim.extraPackages = with pkgs; [
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
    nil
    nixfmt
    nodePackages_latest.typescript-language-server
    python3
    ripgrep
    rustup
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

  settings = { commands.editor = "${pkgs.neovide}/bin/neovide"; };
}
