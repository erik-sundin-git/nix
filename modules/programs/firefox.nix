#Systemwide firefox config
{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
  };
  nixpkgs.config.firefox.enableGnomeExtensions = true;
  services.gnome.core-shell.enable = true;
}
