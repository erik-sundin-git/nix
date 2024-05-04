# picom.nix
# Erik Sundin

{ config, lib, pkgs, ...}:
{
  services.picom = {
    enable = true;
    opacityRules = [
      "85:class_g = 'Alacritty'" 
    ];
  };
}