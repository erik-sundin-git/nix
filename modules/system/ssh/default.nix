{
  config,
  inputs,
  systemSettings,
  lib,
  pkgs,
  ...
}: {
  services.openssh = {
    enable = true;
  };
}
