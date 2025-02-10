{ ... }:
{
  vim = {
    lsp.formatOnSave = true;

    languages = {
      enableLSP = true;
      enableTreesitter = true;
      enableFormat = true;
      enableExtraDiagnostics = true;
      enableDAP = true;

      nix.enable = true;
      html.enable = true;
      ts.enable = true;
    };
  };
}
