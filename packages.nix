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
    bitwarden                # passwords
    sct                      # screen color temperature
  ];
}
