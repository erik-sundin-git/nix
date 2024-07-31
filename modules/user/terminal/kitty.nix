{
  pkgs,
  lib,
  ...
}: {
  programs.kitty.enable = true;
  programs.kitty.shellIntegration.enableFishIntegration = true;
  programs.kitty.settings = {
    confirm_os_window_close = 0;
  };
}
