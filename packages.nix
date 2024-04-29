# packages.nix
# Erik Sundin
#
# Packages to be enabled systemwide.
#

{ pkgs, ...}:  {
  environment.systemPackages = with pkgs; [
    firefox #TODO: add custom firefox config
    alacritty
    git
    dmenu
    vscode-with-extensions
    fish
    nitrogen
  ];
}
