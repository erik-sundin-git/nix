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
