{ pkgs, ... }: {
  hardware.bluetooth.enable = true;

  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = with pkgs.linuxKernel.packages;
    [ linux_6_18.v4l2loopback ];
}
