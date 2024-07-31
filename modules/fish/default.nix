{
  config,
  systemSettings,
  ...
}: {
  programs.fish.enable =
    if systemSettings.enableFish
    then true
    else false;
}
