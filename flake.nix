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
  };

  outputs = { self, nixpkgs, home-manager }: 
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.erik = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ 
       ./configuration.nix
       ./dm.nix
       ./packages.nix	
        ({ config, pkgs, ... }: {
        services.picom.enable = true;
         })
      ];
    };
    homeConfigurations = {
      erik-home = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home.nix];
      }; 
    };
  };
}
