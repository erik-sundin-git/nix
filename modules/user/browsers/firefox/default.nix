{
  config,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    policies = {
      DisableTelemetry = true;
    };

    profiles = {
      # Default profile
      default = {
      settings = {
          "browser.startup.homepage" = "https://www.example.com";
          "datareporting.healthreport.uploadEnabled" = false;
          "toolkit.telemetry.enabled" = false;
          "privacy.donottrackheader.enabled" = true;
        };
      };
    };
  };
}
