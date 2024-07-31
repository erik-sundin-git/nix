# home-manager
#
# Erik Sundin
#
{
  config,
  inputs,
  userSettings,
  pkgs,
  pkgs-erik,
  ...
}: {
  imports = [
    ./modules.nix
  ];

  # manage.
  home.username = "erik";
  home.homeDirectory = "/home/erik";

  nixpkgs.config.allowUnfree = true;

  # DO NOT CHANGE #
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # dotfiles
  home.file = {
    ".config/qtile/config.py".source = ../../user/qtile/config.py;
    ".config/qtile/colors.py".source = ../../user/qtile/colors.py;
    ".config/qtile/autostart.sh".source = ../../user/qtile/autostart.sh;
    ".config/hypr/hyprland/hyperland.conf".source = ../../user/hyprland/hyprland.conf;
  };

  programs.home-manager = {
    enable = true;
  };
}
