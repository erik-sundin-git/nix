# packages.nix
# Erik Sundin
#
# Packages to be enabled systemwide.
#
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ### Browsers ### 
    firefox 
    chromium
    qutebrowser
    tor-browser-bundle-bin

    ### Music and audio ###
    ardour
    ncspot # ncurses based Spotify client
    pavucontrol
    
    ### Looks/theming ###
    nitrogen # wallpapers
    nwg-look


    ### Gaming ### 
    discord
    gamemode
    winetricks
    protontricks

    ### Windowmanager related ###
    rofi-wayland
    xfce.thunar
    xfce.tumbler
    xfce.ristretto

    ### Terminal emulators ###
    kitty
    alacritty
    dmenu


    ### Development ###
    git
    ### Utilities ###
    pinentry
    sct # screen color temperature
    qemu
    htop
    mutt
    zathura


    ### Other ### 
    neofetch
    qbittorrent
    remmina
    mypy
    unzip
    trezor-suite
    trezor-udev-rules
    monero-gui
    xorg.xev
  ];
}
