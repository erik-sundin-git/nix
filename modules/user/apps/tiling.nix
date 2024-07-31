# Tiling.nix
# Erik Sundin
# pkgs i use with tiling window managers
{
  pkgs,
  pkgs-erik,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    nitrogen
    nwg-look
    #    rofi-wayland
    #   xfce.thunar
    pkgs-erik.picom-ftlabs
    nautilus
    xfce.tumbler
    xfce.ristretto
    python312Packages.mypy # for qtile
  ];
}
