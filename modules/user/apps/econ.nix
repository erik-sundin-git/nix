{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    ledger # Double-entry accounting system with a command-line reporting interface
    trezor-suite
    trezor-udev-rules
    monero-gui
  ];
}
