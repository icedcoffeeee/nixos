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
      cam0    = ''
        scrcpy --v4l2-sink=/dev/video0 \
        --video-source=camera --no-audio \
        --camera-id=0 -m500 --no-window
        '';
      cam1    = ''
        scrcpy --v4l2-sink=/dev/video0 \
        --video-source=camera --no-audio \
        --camera-id=1 -m500 --no-window
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

      function ghc() {
        repo=$1; shift 1;
        git clone "https://github.com/$repo.git" $@;
      }
      '';
  };

  programs.zsh = {
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
      cam0    = ''
        scrcpy --v4l2-sink=/dev/video0 \
        --video-source=camera --no-audio \
        --camera-id=0 -m500 --no-window
        '';
      cam1    = ''
        scrcpy --v4l2-sink=/dev/video0 \
        --video-source=camera --no-audio \
        --camera-id=1 -m500 --no-window
        '';
    };
    envExtra = ''
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

      function ghc() {
        repo=$1; shift 1;
        git clone "https://github.com/$repo.git" $@;
      }
      '';
  };
}
