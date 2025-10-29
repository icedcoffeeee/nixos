#!/usr/bin/env nix-shell
#!nix-shell -p vim git --run "bash ./install.sh"

git clone https://github.com/icedcoffeeee/nixos
cd nixos
vim flake.nix
sudo nixos-rebuild build --flake . --impure
