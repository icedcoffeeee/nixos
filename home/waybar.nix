{ ... }: {
  programs.waybar = {
    enable = true;
    style = builtins.readFile ../assets/waybar/style.css;
    settings.main = {
      layer = "top"; position = "top"; mod = "dock";
      height = 30; exclusive = true; gtk-layer-shell = true;
      output = [ "*" ]; # screens

      modules-left = [ "group/L1" "group/L2" "group/L3" ];
      "group/L1".orientation = "inherit";
      "group/L1".modules = [ "cpu" "memory" "custom/cputemp" "custom/gputemp" ];
      "group/L2".orientation = "inherit";
      "group/L2".modules = [ "idle_inhibitor" "clock" ];
      "group/L3".orientation = "inherit";
      "group/L3".modules = [ "hyprland/workspaces" ];

      modules-center = [ "group/C1" ];
      "group/C1".orientation = "inherit";
      "group/C1".modules = [ "wlr/taskbar" ];

      modules-right = [ "group/R1" "group/R2" "group/R3" ];
      "group/R1".orientation = "inherit";
      "group/R1".modules = [ "network" "pulseaudio" "pulseaudio#microphone" ];
      "group/R2".orientation = "inherit";
      "group/R2".modules = [ "tray" ];
      "group/R3".orientation = "inherit";
      "group/R3".modules = [ "battery" "custom/cliphist" "custom/power" ];

      # group/L1
      "cpu" = { interval = 10; format = "󰍛 {usage}%"; };
      "memory" = {
        interval = 30;
        format = builtins.fromJSON ''"\udb83\udf86 {used}GB"'';
        max-length = 10; tooltip = true;
        tooltip-format = builtins.fromJSON ''
          "\udb83\udf86 Memory usage: {percentage}%\n\ue266 Used: {used:0.2f}GB / {total:0.2f}GB\n\uf85a Available: {avail:0.2f}GB\n\uf233 Swap used: {swapUsed:0.2f}GB / {swapTotal:0.2f}GB ({swapPercentage}%)"'';
      };
      "custom/cputemp" = {
        exec = "hyde-shell cpuinfo";
        return-type = "json";
        format = "{0}"; rotate = 0; interval = 5;
        tooltip = true; max-length = 1000;
      };
      "custom/gputemp" = {
        exec = "hyde-shell gpuinfo";
        return-type = "json";
        format = "{0}"; rotate = 0; interval = 5;
        tooltip = true; max-length = 1000;
      };
      # group/L2
      "idle_inhibitor" = {
        format = "{icon}";
        format-icons = {
          activated = builtins.fromJSON ''"\udb80\udd76"'';
          deactivated = builtins.fromJSON ''"\udb81\udeca"'';
        };
        start-activated = true;
        rotate = 0; justify = "center";
      };
      "clock" = {
        format = builtins.fromJSON ''"{:%R \udb80\udced %d\u00b7%m\u00b7%y}"'';
        rotate = 0; tooltip-format = "<span>{calendar}</span>";
        calendar = {
          mode = "month";
          mode-mon-col = 3;
          on-scroll = 1;
          on-click-right = "mode";
          format = {
            months = "<span color='#ffead3'><b>{}</b></span>";
            weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            today = "<span color='#ff6699'><b>{}</b></span>";
          };
        };
      };
      # group/L3
      "hyprland/workspaces" = {
        class = "no-margin-padding";
        rotate = 0; all-outputs = true;
        active-only = false; on-click = "activate";
        disable-scroll = false;
        on-scroll-up = "hyprctl dispatch workspace -1";
        on-scroll-down = "hyprctl dispatch workspace +1";
        persistent-workspaces = { };
      };

      # group/C1
      "wlr/taskbar" = {
        all-outputs = true; active-first = false; markup = true;
        format = "{icon}"; rotate = 0; spacing = 20;
        tooltip-format = "{title} | {app_id}";
        on-click = "activate";
        on-click-right = "fullscreen";
        on-click-middle = "close";
        class = "no-margin-padding";
        ignore-list = [ "" ];
      };

      # R1
      "network" = {
        interval = 2; tooltip = true; rotate = 0;
        format = builtins.fromJSON ''
          "<span foreground='#99ffdd'>\uf019 {bandwidthDownBytes}</span> <span foreground='#ffcc66'>\uf093 {bandwidthUpBytes}</span>"'';
        format-linked = builtins.fromJSON ''"\udb80\ude00 {ifname} (No IP)"'';
        format-disconnected = builtins.fromJSON ''"\udb81\uddaa "'';
        tooltip-format = ''
          Network: <big><b>{essid}</b></big>
          Signal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>
          Frequency: <b>{frequency}MHz</b>
          Interface: <b>{ifname}</b>
          IP: <b>{ipaddr}/{cidr}</b>
          Gateway: <b>{gwaddr}</b>
          Netmask: <b>{netmask}</b>'';
        tooltip-format-disconnected = "Disconnected";
      };
      "pulseaudio" = {
        format = "{icon} {volume}"; rotate = 0;
        format-muted = "婢";
        on-click = "pavucontrol -t 3";
        on-click-right = "hyde-shell volumecontrol -s ''";
        on-click-middle = "hyde-shell volumecontrol -o m";
        on-scroll-up = "hyde-shell volumecontrol -o i";
        on-scroll-down = "hyde-shell volumecontrol -o d";
        tooltip-format = "{icon} {desc} // {volume}%";
        scroll-step = 5;
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" "" ];
        };
      };
      "pulseaudio#microphone" = {
        format = "{format_source}"; rotate = 0;
        format-source = builtins.fromJSON ''"\uf86b"'';
        format-source-muted = builtins.fromJSON ''"\uf131"'';
        on-click = "pavucontrol -t 4";
        on-click-middle = "hyde-shell volumecontrol -i m";
        on-scroll-up = "hyde-shell volumecontrol -i i";
        on-scroll-down = "hyde-shell volumecontrol -i d";
        tooltip-format = "{format_source} {source_desc} // {source_volume}%";
        scroll-step = 5;
      };
      # R2
      "tray" = { spacing = 5; };
      # R3
      "battery" = {
        format = "{icon} {capacity}%"; rotate = 0;
        format-charging = " {capacity}%";
        format-plugged = " {capacity}%";
        format-alt = "{time} {icon}";
        format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
      };
      "custom/cliphist" = {
        format = "{0}"; rotate = 0;
        exec =
          builtins.fromJSON ''"echo ; echo \udb80\udd47 clipboard history"'';
        on-click = "sleep 0.1 && hyde-shell cliphist -c";
        menu = "on-click-right";
        menu-file = "$XDG_CONFIG_HOME/waybar/clipboard.xml";
        menu-actions = {
          favorites = "hyde-shell cliphist --favorites";
          history = "hyde-shell cliphist --copy";
          delete-history = "hyde-shell cliphist --delete";
          manage-favorites = "hyde-shell cliphist 'Manage Favorites'";
          clear-history = "hyde-shell cliphist --wipe";
        };
        interval = 86400; tooltip = true;
      };
      "custom/power" = {
        format = "{0}"; rotate = 0;
        exec = "echo ; echo  logout";
        on-click = "hyde-shell logoutlaunch 2";
        menu = "on-click-right";
        menu-file = "$XDG_CONFIG_HOME/waybar/power.xml";
        menu-actions = {
          shutdown-now = "systemctl shutdown now";
          shutdown-wait = "systemctl poweroff";
          reboot = "reboot";
          suspend = "systemctl suspend";
          hibernate = "systemctl hibernate";
        };
        interval = 86400; tooltip = true;
      };
    };
  };
}
