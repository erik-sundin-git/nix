{
  pkgs,
  lib,
  ...
}: {
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window.opacity = lib.mkForce 0.75;
    shell.program = "/home/erik/.nix-profile/bin/fish";

    scrolling.multiplier = 5;
  };
}
