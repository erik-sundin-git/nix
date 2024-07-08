{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../user/apps/tiling.nix
    ../../user/apps/econ.nix
    ../../user/rofi.nix
    ../../user/browsers/firefox/default.nix
    ../../user/picom.nix
    ../../user/terminal/kitty.nix
    ../../user/terminal/alacritty.nix
    ../../user/terminal/fish.nix
    ../../user/rofi.nix
   #../../user/gnome/dconf.nix #TODO broken
  ];
}
