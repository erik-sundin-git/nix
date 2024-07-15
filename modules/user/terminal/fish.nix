{
  pkgs,
  lib,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = "function fish_greeting\n
    neofetch\n
    end\n
    funcsave fish_greeting";
    shellAliases = {


      # git
      commit = "git commit -m";
      add = "git add";
      push = "git push origin";
    };
  };
}
