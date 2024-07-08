{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    discord
    gamemode
    winetricks
    protontricks
    hello
  ];

  
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

}
