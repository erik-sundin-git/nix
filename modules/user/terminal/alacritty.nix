{
  pkgs,
  lib,
  userSettings,
  ...
}: {
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window.opacity = lib.mkForce 0.75;

    scrolling.multiplier = 5;

#    font.normal = {
#     family = "ubuntu";
#    };
  };
}
