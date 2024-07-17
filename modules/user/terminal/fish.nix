{
  pkgs,
  lib,
  ...
}: {
  programs.fish = {
    enable = true;
    shellAliases = {


      # git
      commit = "git commit -m";
      add = "git add";
      push = "git push origin";
    };
  };
}
