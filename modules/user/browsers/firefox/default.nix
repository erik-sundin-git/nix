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
        search.engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["!np"];
          };
        };
      };
    };
  };
}
