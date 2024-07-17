{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../user/apps/tiling.nix
    ../../user/rofi.nix
    ../../user/picom.nix
    ../../user/terminal/kitty.nix
    ../../user/browsers/firefox/default.nix
    ../../user/browsers/chromium/default.nix
    ../../user/terminal/alacritty.nix
    ../../user/terminal/fish.nix
  ];
}
