{
  config,
  lib,
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    ../../user/apps/emacs/default.nix
    ../../user/terminal/alacritty/alacritty.nix
    ../../user/terminal/starship/starship.nix
    ../../user/terminal/zsh.nix
    ../../user/terminal/zoxide.nix
  ];
}
