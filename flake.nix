# flake.nix
# Erik Sundin
#
#
{
  description = "Nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";

    nvim = {
      url = "github:erik-sundin-git/neovim";
      flake = true;
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nvim,
    ...
  }: let
    systemSettings = {
      system = "x86_64-linux"; # system arch
      hardware = "desktop"; # sets hardware-configuration
      hostname = "nixos"; # hostname
      profile = "personal"; # select a profile defined from my profiles directory
      timezone = "Europe/Stockholm"; # select timezone
      locale = "en_US.UTF-8"; # select locale
      bootMode = "uefi"; # uefi or bios
      bootMountPath = "/boot"; # mount path for efi boot partition; only used for uefi boot mode
      grubDevice = ""; # device identifier for grub; only used for legacy (bios) boot mode
    };

    # ----- USER SETTINGS ----- #
    userSettings = rec {
      username = "erik"; # username
      name = "Erik"; # name/identifier
      email = "mail@eriksundin.com"; # email (used for certain configurations)
      dotfilesDir = "~/.dotfiles"; # absolute path of the local repo
      theme = "uwunicorn-yt"; # selected theme from my themes directory (./themes/)
      wm = "qtile"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
      # window manager type (hyprland or x11) translator
      wmType =
        if (wm == "hyprland")
        then "wayland"
        else "x11";
      browser = "qutebrowser"; # Default browser; must select one from ./user/app/browser/
      defaultRoamDir = "Personal.p"; # Default org roam directory relative to ~/Org
      term = "alacritty"; # Default terminal command;
      font = "Intel One Mono"; # Selected font
      editor = "nvim"; # Default editor;
      # editor spawning translator
      # generates a command that can be used to spawn editor inside a gui
      # EDITOR and TERM session variables must be set in home.nix or other module
      # I set the session variable SPAWNEDITOR to this in my home.nix for convenience
      spawnEditor =
        if (editor == "emacsclient")
        then "emacsclient -c -a 'emacs'"
        else
          (
            if
              ((editor == "vim")
                || (editor == "nvim")
                || (editor == "nano"))
            then "exec " + term + " -e " + editor
            else editor
          );
    };

    lib = inputs.nixpkgs.lib;
  in {
    nixosConfigurations = {
      erik = lib.nixosSystem {
        modules = [
          (./. + "/systems" + ("/" + systemSettings.hardware) + "/hardware-configuration.nix")
          ./configuration.nix
          ./dm.nix
          ./steam.nix
          ./packages.nix
        ];
      };
    };

    homeConfigurations = {
      erik-home = home-manager.lib.homeManagerConfiguration {
        modules = [./home.nix];
        extraSpecialArgs = {};
      };
    };
  };
}
