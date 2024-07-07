# dcof.nix
# Erik Sundin
{
  config,
  lib,
  pkgs,
  ...
}: {
  dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell.extensionUuid
        gsconnect.extensionUuid
        pop-shell.extensionUuid
        user-themes.extensionUuid
      ];
    };
  };
}
