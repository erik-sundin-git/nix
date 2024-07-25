{
  config,
  lib,
  pkgs,
  ...
}: {
  systemd.timers."sct" = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "5m";
      Unit = "sct.service";
    };
  };

  systemd.services."sct" = {
    description = "Run sct 1600 service";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/home/erik/nix/modules/system/systemd/timers/sct-timer.sh";
      User = "root";
    };
  };
}
