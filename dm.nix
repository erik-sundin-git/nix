# dm.nix
# Display manager configuration
# Erik Sundin

{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.windowManager.qtile.enable = true; 
}

