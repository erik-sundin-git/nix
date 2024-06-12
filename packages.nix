# packages.nix
# Erik Sundin
#
# Packages to be enabled systemwide.
#
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    firefox #TODO: add custom firefox config
    chromium
    kitty
    gamemode
    winetricks
    protontricks
	jq
    clang-tools
    gnumake
    gdb
    trezor-suite
    trezor-udev-rules
    monero-gui

    qutebrowser
    alacritty
    pinentry
    git
    nodejs
    nodePackages.prettier
    tor-browser-bundle-bin
    dmenu
    vscode-with-extensions
    fish #TODO: configure
    nitrogen # wallpapers
    sct # screen color temperature
    pavucontrol
    ncspot # ncurses based Spotify client
    qemu
    gcc
    htop
    neofetch
    discord
    rofi-wayland

    qbittorrent
    remmina

    android-studio
    unzip
    xfce.thunar
    xfce.tumbler
    xfce.ristretto
    nwg-look
    xorg.xev
    mutt
    zathura
  ];
}
