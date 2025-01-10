{
  osConfig,
  hmConfig,
  ...
}:
{
  programs.oh-my-posh = {
    enable = true;

    enableBashIntegration = false;
    enableZshIntegration = false;
    enableFishIntegration = true;

    settings = with osConfig.stylix.base16Scheme; {
      version = 2;
      final_space = true;
      blocks = [
        {
          newline = true;
          type = "prompt";
          alignment = "left";
          segments = [
            {
              type = "text";
              style = "plain";
              foreground = "#${base04}";
              template = "╭─";
            }
            {
              type = "os";
              style = "diamond";
              powerline_symbol = "";
              leading_diamond = "";
              foreground = "#${base00}";
              background = "#${base05}";
              template = " {{ .Icon }} ";
            }
            {
              type = "path";
              style = "powerline";
              powerline_symbol = "";
              foreground = "#${base00}";
              background = "#${base0D}";
              properties = {
                style = "full";
                mapped_locations = {
                  "${hmConfig.xdg.userDirs.documents}/prog" = " ";
                };
              };
            }
            {
              type = "git";
              style = "powerline";
              powerline_symbol = "";
              foreground = "#${base00}";
              background = "#${base0B}";
              properties = {
                fetch_status = true;
                fetch_upstream_icon = true;
                fetch_bare_info = true;
                branch_icon = " ";
                branch_gone_icon = " ";
                branch_identical_icon = " ";
              };
            }
          ];
        }
        {
          type = "prompt";
          alignment = "right";
          segments = [
            {
              type = "python";
              style = "powerline";
              powerline_symbol = "";
              invert_powerline = true;
              foreground = "#${base00}";
              background = "#${base0A}";
              template = " {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }} ";
            }
            {
              type = "node";
              style = "powerline";
              powerline_symbol = "";
              invert_powerline = true;
              foreground = "#${base00}";
              background = "#${base0B}";
              properties = {
                fetch_package_manager = true;
              };
            }
            {
              type = "status";
              style = "diamond";
              invert_powerline = true;
              trailing_diamond = " ";
              leading_diamond = "";
              foreground_templates = [ "{{ if eq .Code 0 }}#${base0B}{{ else }}#${base0A}{{ end }}" ];
              background_templates = [ "{{ if eq .Code 0 }}#${base03}{{ else }}#${base08}{{ end }}" ];
              template = " {{ if eq .Code 0 }}✔{{ else }}{{ .Code }} ✘{{ end }} ";
              properties = {
                always_enabled = true;
              };
            }
          ];
        }
        {
          type = "prompt";
          alignment = "left";
          newline = true;
          segments = [
            {
              type = "text";
              style = "plain";
              foreground = "#${base04}";
              template = "╰─";
            }
          ];
        }
      ];
      transient_prompt = {
        foreground_templates = [ "{{ if eq .Code 0 }}#${base0B}{{ else }}#${base08}{{ end }}" ];
        background = "transparent";
        template = "❯ ";
      };
    };
  };
}
