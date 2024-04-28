# packages.nix
# Erik Sundin
#
#
#

{ pkgs, ...}:  {
  environment.systemPackages = with pkgs; [
    firefox #TODO: add custom firefox config
    alacritty
    git
  ];
}
