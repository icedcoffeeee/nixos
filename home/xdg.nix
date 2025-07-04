{ pkgs, ... }: {
  xdg = {
    mimeApps = let
      evince         = "org.gnome.Evince.desktop";
      zen            = "app.zen_browser.zen.desktop";
      loupe          = "org.gnome.Loupe.desktop;";
    in {
      enable = true;
      associations.added = {
        "application/pdf"             = evince;
        "application/xhtml+xml"       = zen;
        "text/html"                   = zen;
        "x-scheme-handler/http"       = zen;
        "x-scheme-handler/https"      = zen;
        "image/png"                   = loupe;
        "image/gif"                   = loupe;
        "image/webp"                  = loupe;
        "image/tiff"                  = loupe;
        "image/x-tga"                 = loupe;
        "image/vnd-ms.dds"            = loupe;
        "image/x-dds"                 = loupe;
        "image/bmp"                   = loupe;
        "image/vnd.microsoft.icon"    = loupe;
        "image/vnd.radiance"          = loupe;
        "image/x-exr"                 = loupe;
        "image/x-portable-bitmap"     = loupe;
        "image/x-portable-graymap"    = loupe;
        "image/x-portable-pixmap"     = loupe;
        "image/x-portable-anymap"     = loupe;
        "image/x-qoi"                 = loupe;
        "image/svg+xml"               = loupe;
        "image/svg+xml-compressed"    = loupe;
        "image/avif"                  = loupe;
        "image/heic"                  = loupe;
        "image/jxl"                   = loupe;
      };
      defaultApplications = {
        "application/pdf"             = evince;
        "application/xhtml+xml"       = zen;
        "text/html"                   = zen;
        "x-scheme-handler/http"       = zen;
        "x-scheme-handler/https"      = zen;
        "image/jpeg"                  = loupe;
        "image/png"                   = loupe;
        "image/gif"                   = loupe;
        "image/webp"                  = loupe;
        "image/tiff"                  = loupe;
        "image/x-tga"                 = loupe;
        "image/vnd-ms.dds"            = loupe;
        "image/x-dds"                 = loupe;
        "image/bmp"                   = loupe;
        "image/vnd.microsoft.icon"    = loupe;
        "image/vnd.radiance"          = loupe;
        "image/x-exr"                 = loupe;
        "image/x-portable-bitmap"     = loupe;
        "image/x-portable-graymap"    = loupe;
        "image/x-portable-pixmap"     = loupe;
        "image/x-portable-anymap"     = loupe;
        "image/x-qoi"                 = loupe;
        "image/svg+xml"               = loupe;
        "image/svg+xml-compressed"    = loupe;
        "image/avif"                  = loupe;
        "image/heic"                  = loupe;
        "image/jxl"                   = loupe;
      };
    };
    configFile = {
      # "autostart/autostart-zen.desktop".source = ../assets/autostart-zen.desktop;
      "yazi/theme.toml".source                 = ../assets/yazi-theme.toml;
      "yazi/flavors/onedark.yazi".source       = pkgs.fetchgit {
        url    = "https://github.com/BennyOe/onedark.yazi";
        rev    = "fa1da70556a5654f5d40d063a95e55ecc63b3ef7";
        sha256 = "sha256-SJdkLjF2i5/G0H/x9kTPXv/ozzMO1WhddWMjZi6+x3A=";
      };
    };
  };
}
