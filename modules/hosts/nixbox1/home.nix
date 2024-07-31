# home-manager
# nixlab1/home.nix
# 
# 
# Erik Sundin
#
{
  config,
  inputs,
  userSettings,
  pkgs,
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
   };

  programs.home-manager = {
    enable = true;
  };
}
