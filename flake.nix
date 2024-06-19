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
    musnix = {url = "github:musnix/musnix";};
    nvim.url = "github:erik-sundin-git/neovim";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    musnix,
    ...
  }: let
    # TODO: actually use all variables.
    systemSettings = {
      system = "x86_64-linux"; # system arch
      hardware = "laptop"; # sets hardware-configuration
      hostname = "lenovo-yoga"; # hostname TODO: make automatic.
      timezone = "Europe/Stockholm"; # select timezone
      locale = "en_US.UTF-8"; # select locale
      bootMode = "uefi"; # uefi or bios
      bootMountPath = "/boot"; # mount path for efi boot partition; only used for uefi boot mode
      grubDevice = ""; # device identifier for grub; only used for legacy (bios) boot mode
    };

    userSettings = {
      user = "erik";
    };

    lib = inputs.nixpkgs.lib;
  in {
    nixosConfigurations = {
      erik = lib.nixosSystem {
        modules = [
          ./modules/default.nix
        ];
        specialArgs = {
          inherit inputs;
          inherit userSettings;
          inherit systemSettings;
        };
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
