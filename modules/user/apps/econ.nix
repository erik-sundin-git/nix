{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    trezor-suite
    trezor-udev-rules
    monero-gui
  ];
}
