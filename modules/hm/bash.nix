{ ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      ga = "git add";
      gc = "git commit";
      gs = "git status";
      gd = "git diff --cached";
      ld = "lazydocker";
      lg = "lazygit";
      ll = "ls -alF";
      mk = "mkdir -p";
      ps = "ps -A|rg";

      nrs = "nixos-rebuild switch --flake ~/nixos";
      ncg = "nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";

      s  = "sudo ";
      v  = "nvim";
      vx = "cd ~/nixos/ && nvim";

      ".."   = "cd ..";
      open   = "xdg-open";
      camset = "sudo modprobe v4l2loopback";
      cam    = ''
        scrcpy --v4l2-sink=/dev/video0 \
        --video-source=camera --no-audio \
        --camera-id=1 -m500
        '';
    };
    bashrcExtra = ''
      export PATH=$PATH:/home/icedtea/.local/bin
      export PATH=$PATH:/home/icedtea/.cargo/bin
      export PATH=$PATH:/home/icedtea/.bun/bin
      export PATH=$PATH:/home/icedtea/go/bin

      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }

    gitc() { repo=$1; shift 1; git clone https://github.com/$1.git $@; }

    fastfetch
      '';
  };
}
