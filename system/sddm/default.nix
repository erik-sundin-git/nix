# Display manager configuration
# Erik Sundin

{ config, lib, pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
}

