# packages.nix
# Erik Sundin
#
# Packages to be enabled systemwide.
#

{ pkgs, ...}:  {
  environment.systemPackages = with pkgs; [
    firefox                  #TODO: add custom firefox config
    qutebrowser
    alacritty
    git
    dmenu
    vscode-with-extensions
    fish                     #TODO: configure
    nitrogen                 # wallpapers
    sct                      # screen color temperature
    pavucontrol
    ncspot                   # ncurses based Spotify client
    qemu
    gcc
    htop
    neofetch
    gnupg
    emacs
    rofi-wayland

    qbittorrent
    polybarFull
    remmina

    android-studio
    unzip
    xfce.thunar
    xfce.tumbler
    xfce.ristretto
    waybar
    nwg-look
    hyprpaper

    python310Packages.mypy 
    xorg.xev
    mutt
    zathura
  ];
}
