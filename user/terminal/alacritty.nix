{
  pkgs,
  lib,
  ...
}: {
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window.opacity = lib.mkForce 0.75;
    primary.background = "#000000";
  };
}
