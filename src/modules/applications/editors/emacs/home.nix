# https://github.com/nix-community/home-manager/issues/257#issuecomment-1646557848
{
  pkgs,
  lib,
  inputs,
  myUtils,
  osConfig,
  hmConfig,
  ...
}:
let
  # stylix-theme = pkgs.callPackage ./stylix.nix { inherit osConfig; };
  extraPackages = with pkgs; [
    clang-tools
    coursier
    eslint
    fd
    gcc
    gdtoolkit_4
    glslang
    html-tidy
    jsbeautifier
    metals
    nil
    nixfmt-rfc-style
    nodePackages.prettier
    # nodePackages.vls
    nodejs
    pandoc
    pipenv
    # pyenv
    python3
    python312Packages.black
    python312Packages.editorconfig
    python312Packages.isort
    # python312Packages.nose
    python312Packages.pyflakes
    python312Packages.pyflakes
    python312Packages.pytest
    python312Packages.python-lsp-server
    ruff
    rustup
    scalafmt
    shellcheck
    shfmt
    stylelint
    # stylix-theme
    texlive.combined.scheme-medium
    texliveSmall
    typescript
    typescript-language-server
    vscode-langservers-extracted
    yaml-language-server
  ];
in
{

  # inputs.doom-emacs.url = "github:nix-community/nix-doom-emacs";
  # hmModules = [ inputs.doom-emacs.hmModule ];

  # os.services.emacs = {
  #   enable = true;
  #   # package = pkgs.emacs.overrideAttrs (old: {
  #   #   nativeBuildInputs = old.nativeBuildInputs ++ [ pkgs.makeWrapper ];
  #   #   postFixup = ''wrapProgram $out/bin/emacs --prefix PATH : ${lib.makeBinPath (with pkgs; [ nil ])}'';
  #   # });
  #   package = pkgs.symlinkJoin {
  #     name = "emacs-wrapped";
  #     paths = [ pkgs.emacs ];
  #     nativeBuildInputs = [ pkgs.makeWrapper ];
  #     postBuild = ''
  #       wrapProgram $out/bin/emacs \
  #         --prefix PATH : ${lib.makeBinPath extraPackages}
  #     '';
  #   };
  # };

  services.emacs.enable = true;
  programs.emacs = {
    enable = true;
    package = pkgs.symlinkJoin {
      name = "emacs-wrapped";
      paths = [ pkgs.emacs ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/emacs \
          --prefix PATH : ${lib.makeBinPath extraPackages}
      '';
      meta = pkgs.emacs.meta;
    };
  };

  # hm.programs.doom-emacs = {
  #   enable = true;
  #   doomPrivateDir = hmConfig.lib.file.mkOutOfStoreSymlink (utils.getConfigPath ./config);
  #   extraPackages = extraPackages;
  # };

  home.activation.doom-emacs-clone =
    hmConfig.lib.dag.entryAfter [ "writeBoundary" ] # sh
      ''
        if [ ! -d ${hmConfig.xdg.configHome}/emacs ]; then
          cp -r ${inputs.doom-emacs} ${hmConfig.xdg.configHome}/emacs
          chmod -R u+w ${hmConfig.xdg.configHome}/emacs
        fi
      '';

  xdg.configFile."doom" = {
    # source = hmConfig.lib.file.mkOutOfStoreSymlink (myUtils.getConfigPath ./config);
    source = hmConfig.lib.file.mkOutOfStoreSymlink ./config;
    # source = ./config;
    # onChange = # sh
    #   ''
    #     if [ -x ${hmConfig.xdg.configHome}/emacs/bin/doom ]; then
    #       PATH="$PATH:${
    #         lib.makeBinPath [
    #           osConfig.services.emacs.package
    #           pkgs.git
    #         ]
    #       }" ${hmConfig.xdg.configHome}/emacs/bin/doom sync
    #     fi
    #   '';
  };

  home.sessionPath = [ "${hmConfig.xdg.configHome}/emacs/bin" ];
}
