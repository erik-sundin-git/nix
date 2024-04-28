 # home-manager-alacritty
 #
 # Erik Sundin
 #

{ config, pkgs, ... }:

programs.alacritty = {
    enable = true
    settings =
     "
     Window:
        opacity= 0.9
     
     "
};