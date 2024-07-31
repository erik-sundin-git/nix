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
  pkgs-erik,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    ### Browsers ###
    chromium
    pkgs-stable.qutebrowser

    ### Music and audio ###
    ardour
    ncspot # ncurses based Spotify client
    pavucontrol

    ### Looks/theming ###
    gnome-tweaks
    gnomeExtensions.pop-shell

    ### Terminal emulators ###
    alacritty
    dmenu

    ### Development ###
    git
    (inputs.nvim.defaultPackage."${systemSettings.system}")
    mypy
    clang
    fd
    coreutils
    ripgrep

    ### Utilities ###
    pinentry
    htop
    mdcat # Cat but for markdown.
    xclip
    fzf # Fuzzy search

    ### Other ###
    neofetch
    unzip
  ];
}
