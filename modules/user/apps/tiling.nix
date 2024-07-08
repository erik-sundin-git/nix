# Tiling.nix
# Erik Sundin
# pkgs i use with tiling window managers
{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    nitrogen
    nwg-look
    rofi-wayland
    xfce.thunar
    xfce.tumbler
    xfce.ristretto
    python312Packages.mypy # for qtile
  ];
}
