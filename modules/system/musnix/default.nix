# musnix config
# Erik Sundin
{
  config,
  lib,
  pkgs,
  musnix,
  ...
}: {
  musnix = {
    enable = true;
     alsaSeq.enable = false;

    rtirq = {
      # highList = "snd_hrtimer";
      resetAll = 1;
      prioLow = 0;
      enable = true;
      nameList = "rtc0 snd";
    };
  };
}
