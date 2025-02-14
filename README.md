#### icedcoffeeee nixos config

Basic size: 25G. Make sure larger.

On new machine:
- `/etc/nixos/configuration.nix`
    - add git: `environment.systemPackages = with pkgs; [ git ];`
    - add flakes: `nix.settings.experimental-features = [ "nix-command" "flakes" ];`
- `sudo nixos-rebuild switch`
- `git clone https://github.com/icedcoffeeee/nixos ~/nixos && cd ~/nixos`
- `cp /etc/nixos/hardware-configuration.nix nixos/`
- `git add -f nixos/hardware-configuration.nix`
- `sudo nixos-rebuild switch --flake .`

Todo portovers:
- python uv?
- texlive latexmk
