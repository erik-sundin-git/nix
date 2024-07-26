#!/usr/bin/env bash

cd $HOME/nix
nix flake update
sudo nixos-rebuild switch --impure --flake $HOME/nix#erik
