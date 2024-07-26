# picom.nix
# Erik Sundin

{ config, lib, pkgs, ...}:
{
  services.picom = {
    enable = true;
    opacityRules = [
    #  "90:class_g = 'qutebrowser'"
    ];
  };
}
