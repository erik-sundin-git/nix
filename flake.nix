# flake.nix
# Erik Sundin
#
#
{
  description = "Nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    musnix = {url = "github:musnix/musnix";};
    nvim.url = "github:erik-sundin-git/neovim";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
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
      erik = lib.nixosSystem rec {
        system = "x86_64-linux";

        modules = [
          ./modules/default.nix
        ];
        specialArgs = {
          nixpkgs.config.packageOverrides = pkgs: {
            nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
              inherit pkgs;
            };
          };
          pkgs-stable = import nixpkgs-stable {
            # Refer to the `system` parameter from
            # the outer scope recursively
            inherit system;
            # To use Chrome, we need to allow the
            # installation of non-free software.
            config.allowUnfree = true;
          };
          inherit inputs;
          inherit userSettings;
          inherit systemSettings;
        };
      };
    };
  };
}
