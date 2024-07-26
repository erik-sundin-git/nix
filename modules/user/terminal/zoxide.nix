{
  pkgs,
  lib,
  ...
}: {
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    package = pkgs.zoxide;
  };
}
