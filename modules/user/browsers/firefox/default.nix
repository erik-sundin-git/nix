{
  config,
  pkgs,
  nur,
  lib,
  ...
}: let
  nur-no-pkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {};
in {
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
          "extensions.autoDisableScopes" = 0;
        };

        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          bitwarden
          darkreader
          vimium
          kristofferhagen-nord-theme
        ];

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
          "Home manager options" = {
            urls = [
              {
                template = "https://home-manager-options.extranix.com/?query={searchTerms}";
                params = [
                  {
                    name = "type";
                    value = "options";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["!hm"];
          };
        };
      };
    };
  };
}
