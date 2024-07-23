{
  pkgs,
  lib,
  config,
  userSettings,
  ...
}: {
  home.packages = with pkgs; [alacritty];
  home.file."${config.home.homeDirectory}/.config/alacritty/alacritty.toml" = {
    source = ./alacritty.toml;
  };
  #programs.alacritty.enable = true;
  #programs.alacritty.settings = {
  #  window.opacity = lib.mkForce 0.75;
  #
  #  scrolling.multiplier = 5;

  #    font.normal = {
  #     family = "ubuntu";
  #    };
  #};
}
