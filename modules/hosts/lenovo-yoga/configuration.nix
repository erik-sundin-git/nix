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
  users.users.erik.ignoreShellProgramCheck = true;

  services.trezord.enable = true;
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        efiSupport = true;
        device = "nodev";
      };
    };
  };
}
