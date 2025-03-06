{ pkgs, ... }:
let
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    includeNDK = true;
    abiVersions = [ "x86_64" ];
  };
  androidSdk = androidComposition.androidsdk;
in {
  options.android.enable = true;
  config = {
    nixpkgs.config.android_sdk.accept_license = true;
    environment.systemPackages = [ androidSdk ];
    environment.sessionVariables = rec {
      ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
      ANDROID_NDK_ROOT = "${ANDROID_SDK_ROOT}/ndk-bundle";
    };
  };
}
