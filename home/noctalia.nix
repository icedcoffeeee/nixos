{ ... }: {
  programs.noctalia-shell = {
    enable = true;
    settings = {
      settingsVersion = 15;

      bar = {
        position = "top";
        backgroundOpacity = 1;
        monitors = [ ];
        density = "default";
        showCapsule = true;
        floating = true;
        marginVertical = 0.25;
        marginHorizontal = 0.25;
        widgets = {
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
            { id = "ActiveWindow"; }
            { id = "MediaMini"; }
          ];
          center = [{ id = "Workspace"; }];
          right = [
            { id = "Tray"; }
            { id = "ScreenRecorder"; }
            { id = "NotificationHistory"; }
            { id = "WiFi"; }
            { id = "Bluetooth"; }
            {
              id = "Battery";
              displayMode = "alwaysShow";
            }
            { id = "Volume"; }
            { id = "Brightness"; }
            { id = "Clock"; }
            {
              id = "ControlCenter";
              useDistroLogo = false;
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

      nightLight = {
        enabled = true;
        forced = false;
        autoSchedule = true;
        nightTemp = "2500";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "00:00";
      };

      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
      };
    };
  };
}
