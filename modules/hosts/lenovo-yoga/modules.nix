{
  config,
  lib,
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    ../../user/apps/tiling.nix
    ../../user/rofi.nix
    ../../user/picom.nix
    ../../user/terminal/kitty.nix
    ../../user/browsers/firefox/default.nix
    ../../user/browsers/chromium/default.nix
    ../../user/terminal/alacritty/alacritty.nix
    ../../user/emacs/default.nix
    ../../user/terminal/starship/starship.nix
    ../../user/terminal/zsh.nix
    ../../user/apps/econ.nix
  ];
}
