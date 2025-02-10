{ pkgs, ... }:
let
  webFormatters = [
    "prettier"
  ];
  jsFormatters = webFormatters ++ [
    "biome"
  ];
  webLinters = [
    "eslint_d"
  ];
  jsLinters = webLinters ++ [
    "biomejs"
  ];
in
{
  myOptions.treesitter = [
    "jsdoc"
    "javascript"
    "typescript"
    "tsx"
    "svelte"
    "astro"
    "vue"
    "json"
    "yaml"
    "markdown"
    "graphql"
  ];
  myOptions.formatters = {
    javascript = jsFormatters;
    typescript = jsFormatters;
    javascriptreact = jsFormatters;
    typescriptreact = jsFormatters;
    svelte = webFormatters;
    astro = webFormatters;
    vue = webFormatters;
    json = webFormatters;
    yaml = webFormatters;
    markdown = webFormatters;
    graphql = webFormatters;
  };
  myOptions.linters = {
    javascript = jsLinters;
    typescript = jsLinters;
    javascriptreact = jsLinters;
    typescriptreact = jsLinters;
    svelte = webLinters;
    astro = webLinters;
  };
  plugins.lsp.servers.ts_ls = {
    enable = true;
    filetypes = [
      "javascript"
      "javascriptreact"
      "javascript.jsx"
      "typescript"
      "typescriptreact"
      "typescript.tsx"
      # "vue"
    ];
  };
  plugins.lsp.servers.svelte.enable = true;
  plugins.lsp.servers.astro.enable = true;
  plugins.lsp.servers.cssls.enable = true;
  plugins.lsp.servers.html.enable = true;
  plugins.lsp.servers.emmet_ls.enable = true;
  plugins.lsp.servers.biome = {
    enable = true;
    rootDir = ''require('lspconfig').util.root_pattern('biome.json')'';
  };
  plugins.schemastore.enable = true;
  plugins.lsp.servers.jsonls = {
    enable = true;
    settings.json = {
      validate.enable = true;
    };
  };
  plugins.lsp.servers.yamlls.enable = true;
  extraPackages = [
    pkgs.nodePackages.prettier
    pkgs.nodePackages.eslint_d
    pkgs.biome
  ];
}
