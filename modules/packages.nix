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
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ### Browsers ###
    #    firefox moved
    chromium
    qutebrowser
    tor-browser-bundle-bin

    ### Music and audio ###
    ardour
    ncspot # ncurses based Spotify client
    pavucontrol

    ### Looks/theming ###
    gnome.gnome-tweaks
    gnomeExtensions.pop-shell

    ### Terminal emulators ###
    kitty
    alacritty
    dmenu

    ### Development ###
    git
    (inputs.nvim.defaultPackage."${systemSettings.system}")

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
    trezor-suite
    trezor-udev-rules
    monero-gui
    xorg.xev
  ];
}
