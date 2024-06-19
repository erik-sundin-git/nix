{
  config,
  pkgs,
  ...
}: {
  services.xserver.enable = true;
  services.xserver.windowManager.qtile.enable = true;
#  services.xserver.windowManager.qtile.backend = "wayland";
}
