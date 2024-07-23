{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    package = pkgs.starship;
    enableZshIntegration = true;
  };
}
