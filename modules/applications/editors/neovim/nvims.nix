{ pkgs }:
pkgs.writeShellScriptBin "nvims" ''
  items=("default" "nvim-impure" "AstroNvim")
  config=$(printf "%s\n" "''${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    exit 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
''
