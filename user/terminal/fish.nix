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
      hm = "home-manager switch --file ~/nix/user/home.nix";
      nx = "sudo nixos-rebuild switch --flake ~/nix/#erik";
      nix-rebuild = "hm && nx"; #TODO maybe switch to module hm.

      # ssh aliases
      ssh-desktop = "ssh erik@192.168.1.171";
      ssh-plex = "ssh erik@192.168.1.145";

      # git
      status = "git status";
      commit = "git commit -m";
      push = "git push origin";
    };
  };
}
