{ pkgs, ... }:
let
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    includeNDK = true;
    ndkVersion = "26.1.10909125";
    abiVersions = [ "x86_64" ];
  };
  androidSdk = androidComposition.androidsdk;
in {
  options.android.enable = true;
  config = {
    nixpkgs.config.android_sdk.accept_license = true;
    environment.systemPackages = [ pkgs.jdk17 androidSdk ];
    environment.sessionVariables = rec {
      ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
      ANDROID_NDK_ROOT = "${ANDROID_SDK_ROOT}/ndk-bundle";
    };
  };
}
