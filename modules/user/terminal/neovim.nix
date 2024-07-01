# neovim.nix
{ inputs, pkgs, lib, ... }:

let
  _ = builtins.trace "inputs: ${inputs}" "";
in
{
  nixpkgs.overlays = [inputs.nvim.overlays.default];

  environment.systemPackages = [inputs.nvim.packages.default];

  home.packages = [inputs.nvim.packages.default];

  programs.neovim = {
    enable = true;
    package = inputs.nvim.packages.default;
  };
}

