# https://youtu.be/G3NJzFX6XhY
{ pkgs, settings, ... }:
{
  programs.git = {
    enable = true;
    userName = "Po Co";
    userEmail = "polniolino@gmail.com";
    extraConfig = {
      core.compression = 9;
      core.whitespace = "error";
      core.preloadindex = true;
      advice.addEmptyPathspec = false;
      advice.pushNonFastForward = false;
      advice.statusHints = false;
      init.defaultBranch = "main";
      status.branch = true;
      status.showStash = true;
      status.showUntrackedFiles = true;
      diff.context = 3;
      diff.renames = "copies";
      diff.interHunkContext = 10;
      color.diff = {
        meta = "black bold";
        frag = "magenta";
        context = "white";
        whitespace = "yellow reverse";
        old = "red";
      };
      pager.diff = "${pkgs.delta}/bin/delta | $PAGER";
      pager.branch = false;
      pager.tag = false;
      delta.navigate = true;
      commit.verbose = true;
      push.autoSetupRemote = true;
      push.default = "current";
      push.followTags = true;
      pull.default = "current";
      pull.rebase = true;
      merge.conflictstyle = "zdiff3";
      rebase.missingCommitsCheck = true;
      branch.sort = "-committerdate";
      tag.sort = "-taggerdate";
      safe.directory = [ settings.os-config.path ];

      url = {
        "git@github.com:polnio/".insteadOf = "polnio:";
        "git@github.com:".insteadOf = "gh:";
        "git@gitlab.com:".insteadOf = "gl:";
      };
    };
  };

  home.shellAliases = {
    g = "git";
    ga = "git add";
    gau = ''echo -e "a\n*\nq\n" | git add -i > /dev/null'';
    gaa = "git add -A";
    gr = "git restore";
    grs = "git restore --staged";
    ge = "git rebase -i";
    gs = "git status --short";
    gc = "EDITOR=nvim git commit";
    gd = "git diff --output-indicator-new=' ' --output-indicator-old=' '";
    gds = "git diff --staged";
    gp = "git push";
    gu = "git pull";
    gl = "git log";
    glo = "git log --oneline";
    gb = "git branch";
    gcl = "git clone";
    gwt = "git worktree";
  };
}
