#! /usr/bin/env nix-shell
#! nix-shell -p vim git
git clone https://github.com/icedcoffeeee/nixos
cd nixos
vim flake.nix
sudo nixos-rebuild \
  --flake . --impure \
  --experimental-features nix-command \
  --experimental-features flakes
reboot
