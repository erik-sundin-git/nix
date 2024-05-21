{ pkgs, lib, ... }:

{
  programs.fish = {
	  enable = true;
	  interactiveShellInit = 
    "function fish_greeting\n
    neofetch\n
    end\n
    funcsave fish_greeting";
    shellAliases = {
     hm = "home-manager switch --file ~/nix/user/home.nix";  
     nx = "sudo nixos-rebuild switch --flake ~/nix/#erik";

     # ssh aliases
	 ssh-desktop = "ssh erik@192.168.1.171";
	 ssh-plex = "ssh erik@192.168.1.145";

	 nv = "nix run ~/neovim/.#";
    };  
  };
}
