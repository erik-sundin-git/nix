{ config, pkgs, ... }:
{
	programs.rofi = {
		enable = true;
		location = "top";
		theme = "DarkBlue";
	};
}
