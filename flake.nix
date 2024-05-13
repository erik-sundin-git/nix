# flake.nix
# Erik Sundin
#
#
#

{
  description = "Nixos config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #nix-colors.url="github:misterio77/nix-colors";
    stylix.url = "github:danth/stylix";

  };

  outputs = { self, nixpkgs, home-manager, stylix, ...}: 
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.erik = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ 
       ./configuration.nix
#       ./stylix_conf.nix
       ./dm.nix
       ./packages.nix	
        ({ config, pkgs, ... }: {
         })
      ];



    };
    homeConfigurations = {
      erik-home = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home.nix];
        extraSpecialArgs = {};
      }; 
    };
  };
}
