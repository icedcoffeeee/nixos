{ ... }: {
  programs.noctalia-shell = {
    enable = true;
    settings = {
      settingsVersion = 15;

      bar = {
        backgroundOpacity = 1;
        density = "default";
        floating = false;
        marginHorizontal = 0.25;
        marginVertical = 0.25;
        monitors = [ ];
        position = "top";
        showCapsule = false;
        widgets = {
          center = [ ];
          left = [
            {
              id = "SystemMonitor";
              showCpuTemp = true;
              showCpuUsage = true;
              showDiskUsage = true;
              showMemoryAsPercent = true;
              showMemoryUsage = true;
              showNetworkStats = true;
            }
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "index";
            }
            {
              id = "Taskbar";
              onlyActiveWorkspaces = true;
              onlySameOutput = true;
            }
          ];
          right = [
            {
              autoHide = false;
              id = "MediaMini";
              scrollingMode = "hover";
              showAlbumArt = false;
              showVisualizer = false;
              visualizerType = "linear";
            }
            { id = "ScreenRecorder"; }
            {
              displayMode = "onhover";
              id = "Microphone";
            }
            {
              displayMode = "onhover";
              id = "Volume";
            }
            {
              displayMode = "onhover";
              id = "Brightness";
            }
            {
              displayMode = "alwaysShow";
              id = "Battery";
              warningThreshold = 30;
            }
            {
              blacklist = [ ];
              id = "Tray";
            }
            { id = "WiFi"; }
            { id = "Bluetooth"; }
            {
              hideWhenZero = true;
              id = "NotificationHistory";
              showUnreadBadge = true;
            }
            {
              customFont = "";
              formatHorizontal = "HH:mm ddd; MMM dd";
              formatVertical = "HH mm - dd MM";
              id = "Clock";
              useCustomFont = false;
              usePrimaryColor = true;
            }
            {
              customIconPath = "";
              icon = "noctalia";
              id = "ControlCenter";
              useDistroLogo = true;
            }
          ];
        };
      };

      general = {
        avatarImage = "";
        dimDesktop = true;
        showScreenCorners = true;
        forceBlackScreenCorners = true;
        radiusRatio = 0.3;
        screenRadiusRatio = 0.3;
        animationSpeed = 2;
        animationDisabled = false;
      };

      location = {
        name = "Kuala_Lumpur";
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
      };

      screenRecorder = {
        directory = "";
        frameRate = 60;
        audioCodec = "opus";
        videoCodec = "h264";
        quality = "very_high";
        colorRange = "limited";
        showCursor = true;
        audioSource = "default_output";
        videoSource = "portal";
      };

      wallpaper = {
        enabled = true;
        directory = "";
        enableMultiMonitorDirectories = false;
        setWallpaperOnAllMonitors = true;
        defaultWallpaper = ../assets/wall.jpg;
        fillMode = "crop";
        fillColor = "#000000";
        randomEnabled = false;
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = "random";
        transitionEdgeSmoothness = 5.0e-2;
        monitors = [ ];
      };

      appLauncher = {
        enableClipboardHistory = false;
        position = "center";
        backgroundOpacity = 1;
        pinnedExecs = [ ];
        useApp2Unit = false;
        sortByMostUsed = true;
        terminalCommand = "kitty --hold";
      };

      controlCenter = { position = "close_to_bar_button"; };

      dock = {
        displayMode = "always_visible";
        backgroundOpacity = 1;
        floatingRatio = 1;
        onlySameOutput = true;
        monitors = [ ];
        pinnedApps = [ ];
      };

      network = { wifiEnabled = true; };

      notifications = {
        doNotDisturb = false;
        monitors = [ ];
        location = "top_right";
        alwaysOnTop = false;
        lastSeenTs = 0;
        respectExpireTimeout = false;
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
      };

      osd = {
        enabled = true;
        location = "top_right";
        monitors = [ ];
        autoHideMs = 2000;
      };

      audio = {
        volumeStep = 5;
        volumeOverdrive = false;
        cavaFrameRate = 60;
        visualizerType = "linear";
        mprisBlacklist = [ ];
        preferredPlayer = "";
      };

      ui = {
        fontDefault = "Karla";
        fontFixed = "JetBrainsMono Nerd Font";
        fontDefaultScale = 1;
        fontFixedScale = 1;
        monitorsScaling = [ ];
        idleInhibitorEnabled = false;
        tooltipsEnabled = true;
      };

      brightness = { brightnessStep = 5; };

      colorSchemes = {
        useWallpaperColors = true;
        darkMode = true;
        matugenSchemeType = "scheme-rainbow";
        generateTemplatesForPredefined = true;
      };

      templates = {
        gtk = true;
        qt = false;
        kitty = false;
        ghostty = false;
        foot = false;
        fuzzel = false;
        vesktop = false;
        pywalfox = false;
        enableUserTemplates = false;
      };

      nightLight.enabled = false;

      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
      };
    };
  };
}
