{
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = with pkgs; [
    emacs
  ];

  home.file = {
    "/home/erik/.config/doom".source = ./doom;
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.config/emacs/bin"
  ];
}
