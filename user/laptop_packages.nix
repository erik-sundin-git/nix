# laptop_packages.nix
# Erik Sundin
# The packages only meant for my laptop.
{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    kitty
  ];
}
