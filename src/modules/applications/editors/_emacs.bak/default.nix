{
  pkgs,
  utils,
  hmConfig,
  ...
}:
{
  hm.programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraPackages =
      _: with pkgs; [
        texliveMedium
        imagemagick
        rustup
      ];
  };
  hm.services.emacs.enable = true;

  hm.xdg.configFile = {
    "emacs/config".source = hmConfig.lib.file.mkOutOfStoreSymlink (utils.getConfigPath ./config);
    "emacs/init.el".text = ''
      (setq load-path (cons "${hmConfig.xdg.configHome}/emacs/config" load-path))

      (load "init")
    '';
  };

}
