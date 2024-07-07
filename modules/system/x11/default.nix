# xorg configuration
# Erik Sundin
{
  config,
  lib,
  pkgs,
  ...
}: {
  services.xserver = {
    xkb.layout = "se";
    xkb.variant = "";
    enable = true;
    windowManager.qtile.enable = true;
  };
}
