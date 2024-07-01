# The imports added into flake.nix
{
  config,
  inputs,
  systemSettings,
  lib,
  pkgs,
  ...
}: {
  imports = [
    (./. + "/hardwares" + ("/" + systemSettings.hardware) + "/hardware-configuration.nix")
    (./. + "/hosts" + ("/" + systemSettings.hostname) + "/configuration.nix")
    ./programs/steam.nix
    ./packages.nix
    ./system/WM/qtile/default.nix
    ./system/x11/default.nix
    ./fish/default.nix
    ./system/sddm/default.nix
    #inputs.musnix.nixosModules.musnix
    #          ./system/musnix/default.nix
    #          ./system/jack/default.nix
  ];
}
