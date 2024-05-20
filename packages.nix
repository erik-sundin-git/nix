# packages.nix
# Erik Sundin
#
# Packages to be enabled systemwide.
#

{ pkgs, ...}:  {
  environment.systemPackages = with pkgs; [
    firefox                  #TODO: add custom firefox config
	clang-tools
    qutebrowser
    alacritty
	pinentry
    git
	nodejs
	nodePackages.prettier
    tor-browser-bundle-bin
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
    emacs
    rofi-wayland

    qbittorrent
    remmina

    android-studio
    unzip
    xfce.thunar
    xfce.tumbler
    xfce.ristretto
    nwg-look
    python310Packages.mypy 
    xorg.xev
    mutt
    zathura
  ];
}
