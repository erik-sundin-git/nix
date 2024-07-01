{
  pkgs,
  lib,
  ...
}: {
  programs.kitty.enable= true;
  programs.kitty.shellIntegration.enableFishIntegration = true;
  programs.kitty.settings = {
  };
}
