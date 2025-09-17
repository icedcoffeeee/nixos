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
  };
}
