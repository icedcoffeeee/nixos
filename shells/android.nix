{ nixpkgs, system }: let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    config.android_sdk.accept_license = true;
  };
  androidSdk = (pkgs
    .androidenv
    .composeAndroidPackages
      { includeNDK = true; abiVersions = [ "x86_64" ]; })
    .androidsdk;
in with pkgs;
mkShell rec {
  buildInputs = [ androidSdk ];
  ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
  ANDROID_NDK_ROOT = "${ANDROID_SDK_ROOT}/ndk-bundle";
}
