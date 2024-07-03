# Display manager configuration
# Erik Sundin

{ config, lib, pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
 # services.displayManager.sddm.wayland.enable = true;
# programs.xwayland.enable = true; #TODO: move?
}

