{ pkgs, lib, ... }: {
  hardware.bluetooth.enable = true;

  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = with pkgs.linuxKernel.packages; [ linux_6_18.v4l2loopback ];

  # fingerprint unlocking
  services.fprintd.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;

  # keymap
  services.keyd.enable = true;
  services.keyd.keyboards.default = {
    ids = [ "*" ];
    settings = {
      main = {
        capslock = "layer(control)";
        leftcontrol = "layer(meta)";
        leftmeta = "layer(capslock)";

        # Alt+H/J/K/L -> arrow keys (left/down/up/right)
        # (keyd uses "alt" modifier notation)
        "alt+h" = "left";
        "alt+j" = "down";
        "alt+k" = "up";
        "alt+l" = "right";
      };
    };
  };
}
