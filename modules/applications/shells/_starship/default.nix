{ lib, ... }: {
  os.programs.starship = { enable = true; };
  hm.programs.starship = {
    enable = true;

    enableBashIntegration = false;
    enableZshIntegration = false;
    enableFishIntegration = true;

    enableTransience = true;
    settings = {
      format = lib.concatStrings [
        "[╭─](#45475a)"
        "[](#bac2de)"
        "[  ](bg:#bac2de fg:#090c0c)"
        "[](bg:#89B4FA fg:#bac2de)"
        "$directory"
        "[](fg:#89B4FA bg:#394260)"
        "$git_branch"
        "$git_status"
        "[](fg:#394260 bg:#212736)"
        # "$nodejs"
        # "$rust"
        # "$golang"
        # "$php"
        "[](fg:#212736 bg:#1d2230)"
        ''

          [╰─](#45475a)''
      ];
      directory = {
        style = "fg:#e3e5e5 bg:#89B4FA";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";

        substitutions = {
          "^/" = " ";
          "~" = " ";
          "Documents" = "󰈙";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };
      git_branch = {
        symbol = "";
        style = "bg:#394260";
        format = "[[ $symbol $branch ](fg:#89B4FA bg:#394260)]($style)";
      };
      git_status = {
        style = "bg:#394260";
        format =
          "[[($all_status$ahead_behind )](fg:#89B4FA bg:#394260)]($style)";
      };
      time = {
        disabled = false;
        time_format = "%R"; # Hour:Minute Format
        style = "bg:#1d2230";
        format = "[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)";
      };
    };
  };
}
