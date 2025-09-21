{ pkgs, lib, ... }: {
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = with pkgs.linuxKernel.packages;
    [ linux_zen.v4l2loopback ];
}
