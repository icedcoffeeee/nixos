{ pkgs, lib, ... }: {
  hardware.bluetooth.enable = true;

  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = with pkgs.linuxKernel.packages; [ linux_6_18.v4l2loopback ];

  # fingerprint unlocking
  services.fprintd.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
  security.pam.services.login.fprintAuth = false;
  security.pam.services.gdm-fingerprint.text = ''
    auth       required                    pam_shells.so
    auth       requisite                   pam_nologin.so
    auth       requisite                   pam_faillock.so      preauth
    auth       required                    ${pkgs.fprintd}/lib/security/pam_fprintd.so
    auth       optional                    pam_permit.so
    auth       required                    pam_env.so
    auth       [success=ok default=1]      ${pkgs.gdm}/lib/security/pam_gdm.so
    auth       optional                    ${pkgs.gnome-keyring}/lib/security/pam_gnome_keyring.so

    account    include                     login

    password   required                    pam_deny.so

    session    include                     login
    session    optional                    ${pkgs.gnome-keyring}/lib/security/pam_gnome_keyring.so auto_start
  '';

  # keymap
  services.keyd.enable = true;
  services.keyd.keyboards.default = {
    ids = [ "*" ];
    settings = {
      main = {
        capslock = "layer(control)";
        leftcontrol = "layer(meta)";
        leftmeta = "layer(capslock)";
      };
    };
  };
}
