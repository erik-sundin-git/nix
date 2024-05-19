# dm.nix
# Display manager configuration
# Erik Sundin

{ config, lib, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.xserver.windowManager.qtile.enable = true; 
  services.picom.enable = true;
  programs.hyprland.enable = true;

  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "qtile start";
  services.xrdp.openFirewall = true;
}

