# picom.nix
# Erik Sundin

{ config, lib, pkgs, ...}:
{
  services.picom = {
    enable = true;
    opacityRules = [
      "85:class_g = 'alacritty'"
      "85:class_g = 'emacs'"
      "85:class_g = 'kitty'"
      "90class_g = 'qutebrowser'"
      "85:class_g = 'Zathura'"

    ];
  };
}
