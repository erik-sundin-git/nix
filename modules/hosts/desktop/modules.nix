{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../user/apps/tiling.nix
    ../../user/rofi.nix
    ../../user/browsers/firefox/default.nix
    ../../user/picom.nix
    ../../user/terminal/kitty.nix
    ../../user/terminal/alacritty.nix
    ../../user/rofi.nix
  ];
}
