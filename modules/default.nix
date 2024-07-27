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
    ./packages.nix
    ./system/default.nix
  ];
}
