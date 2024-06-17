# Nixos configuration file
# Author: Erik Sundin
#
#
#
{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../desktop/configuration.nix
  ];
  networking.hostName = "lenovo-yoga"; # Define your hostname.TODO: change to variable
  #  networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
  #  networking.networkmanager.enable = false; # override default
}
