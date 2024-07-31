{
  config,
  lib,
  pkgs,
  systemSettings,
  ...
}: {
  programs.steam.enable =
    if systemSettings.enableSteam
    then true
    else false;
  programs.steam.gamescopeSession.enable = true;
}
