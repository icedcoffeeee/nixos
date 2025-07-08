# icedcoffeeee (icedtea)'s nixos + hyprland config

Based on the works of [HyDE-Nix](https://github.com/richen604/hydenix)
configuration.

```sh
nix-shell -p vim git
git clone https://github.com/icedcoffeeee/nixos && cd nixos
nixos-generate-config --show-hardware-config > nixos/hardware.nix
vim nixos/hardware.nix
```

```diff
# nixos/hardware.nix
-  boot.kernelModules = [ "kvm-amd" ];
-  boot.extraModulePackages = [ ];
+  boot.kernelModules = [ "kvm-amd" "v4l2loopback" ];
+  boot.extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];
```

```sh
sudo nixos-rebuild switch --flake .
```
