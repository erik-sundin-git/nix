# home-manager
#
# Erik Sundin
#
{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../user/browsers/firefox/default.nix
    ../../user/picom.nix
    ../../user/terminal/kitty.nix
    ../../user/terminal/alacritty.nix
    ../../user/terminal/fish.nix
    ../../user/rofi.nix
    ./packages.nix
    #../../user/gnome/dconf.nix #TODO broken
  ];

  # manage.
  home.username = "erik";
  home.homeDirectory = "/home/erik";

  nixpkgs.config.allowUnfree = true;

  # DO NOT CHANGE #
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # dotfiles
  home.file = {
    ".config/qtile/config.py".source = ./qtile/config.py;
    ".config/hypr/hyprland/hyperland.conf".source = hyprland/hyprland.conf;
  };
  
   programs.home-manager = {
    enable = true;
  };
}
