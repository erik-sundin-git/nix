{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
}
