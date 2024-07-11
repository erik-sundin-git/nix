# packages.nix
# Erik Sundin
#
# Packages to be enabled systemwide.
#
{
  config,
  inputs,
  systemSettings,
  lib,
  pkgs-stable,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ### Browsers ###
    chromium
    pkgs-stable.qutebrowser
    tor-browser-bundle-bin

    ### Music and audio ###
    ardour
    ncspot # ncurses based Spotify client
    pavucontrol

    ### Looks/theming ###
    gnome-tweaks
    gnomeExtensions.pop-shell

    ### Terminal emulators ###
    kitty
    alacritty
    dmenu

    ### Development ###
    git
    (inputs.nvim.defaultPackage."${systemSettings.system}")
    mypy

    ### Utilities ###
    pinentry
    sct # screen color temperature
    qemu
    htop
    mutt
    zathura
    mdcat

    ### Other ###
    neofetch
    qbittorrent
    remmina
    unzip
    xorg.xev
  ];
}
