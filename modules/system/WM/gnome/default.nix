{
  config,
  pkgs,
  ...
}: {
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-photos
      cheese # webcam tool
      gnome-tour
      gedit
      geary # email reader
      totem # video player
      epiphany # web browser
      evince # document viewer
      gnome-terminal
    ])
    ++ (with pkgs.gnome; [
      gnome-maps
      gnome-weather
      gnome-music
      gnome-characters
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
      gnome-contacts
      gnome-clocks
    ]);
}
