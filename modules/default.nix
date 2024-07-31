# The imports added into flake.nix
{
  config,
  inputs,
  systemSettings,
  lib,
  pkgs,
  pkgs-erik,
  ...
}: {
  imports = [
    (./. + "/hardwares" + ("/" + systemSettings.hardware) + "/hardware-configuration.nix")
    (./. + "/hosts" + ("/" + systemSettings.hostname) + "/configuration.nix")
    ./programs/default.nix
    ./packages.nix
    ./system/default.nix
  ];
}
