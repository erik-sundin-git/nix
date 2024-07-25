{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = with pkgs; [
    emacs
  ];

  home.sessionPath = [
    "${config.home.homeDirectory}/.config/emacs/bin"
  ];
}
