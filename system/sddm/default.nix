# Display manager configuration
# Erik Sundin

{ config, lib, pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;

}

