{ ... }:
{
  programs.waybar = {
    enable = true;
    settings.main = {
      layer = "top"; position = "top"; mod = "dock";
      height = 30; exclusive = true; gtk-layer-shell = true;
      include = [ 
        "$HOME/.local/share/waybar/modules/cpu.jsonc"
        "$HOME/.local/share/waybar/modules/memory.jsonc"
        "$HOME/.local/share/waybar/modules/custom-cpuinfo.jsonc"
        "$HOME/.local/share/waybar/modules/custom-gpuinfo.jsonc"
        "$HOME/.local/share/waybar/modules/hyprland-workspaces.jsonc"
        "$HOME/.local/share/waybar/modules/hyprland-window.jsonc"
        "$HOME/.local/share/waybar/modules/backlight.jsonc"
        "$HOME/.local/share/waybar/modules/pulseaudio.jsonc"
        "$HOME/.local/share/waybar/modules/pulseaudio#microphone.jsonc"
        "$HOME/.local/share/waybar/modules/custom-updates.jsonc"
        "$HOME/.local/share/waybar/modules/privacy.jsonc"
        "$HOME/.local/share/waybar/modules/tray.jsonc"
        "$HOME/.local/share/waybar/modules/battery.jsonc"
        "$HOME/.local/share/waybar/modules/custom-cliphist.jsonc"
        "$HOME/.local/share/waybar/modules/custom-hyde-menu.jsonc"
        "$HOME/.local/share/waybar/modules/custom-power.jsonc"
      ];
      output = [ "*" ]; # screens

      modules-left = [ "group/pill#left1" "group/pill#left2" ];
      "group/pill#left1".orientation = "inherit";
      "group/pill#left1".modules = [ "cpu" "memory" "custom/cpuinfo" "custom/gpuinfo" ];
      "group/pill#left2".orientation = "inherit";
      "group/pill#left2".modules = [ "idle_inhibitor" "clock" ];

      modules-center = [ "group/pill#center" ];
      "group/pill#center".orientation = "inherit";
      "group/pill#center".modules = [ "hyprland/workspaces" "hyprland/window" ];

      modules-right = [ "group/pill#right1" "group/pill#right2" "group/pill#right3" ];
      "group/pill#right1".orientation = "inherit";
      "group/pill#right1".modules = [ "network" "pulseaudio" "pulseaudio#microphone" "custom/updates" ];
      "group/pill#right2".orientation = "inherit";
      "group/pill#right2".modules = [ "backlight" "privacy" "tray" "battery" ];
      "group/pill#right3".orientation = "inherit";
      "group/pill#right3".modules = [ "custom/cliphist" "custom/hyde-menu" "custom/power" ];

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
    };
  };
}
