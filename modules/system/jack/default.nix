# jack config
# Erik Sundin
{
  config,
  inputs,
  userSettings,
  systemSettings,
  lib,
  pkgs,
  ...
}: {
  services.jack = {
    jackd.enable = true;
    # support ALSA only programs via ALSA JACK PCM plugin
    # alsa.enable = false;
  };

  users.extraUsers.${userSettings.user}.extraGroups = ["jackaudio"];
}
