{ pkgs, ... }:

{
  # Enable X11 + Wayland display managers
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # Window managers
  services.xserver.windowManager.i3.enable = true;
  programs.sway.enable = true;

  # Monitor auto-layout
  services.autorandr = {
    enable = true;
    profiles = {
      dual = {
        outputs = {
          DP-0 = {
            enable = true;
            primary = true;
            mode = 2560x1440;
            position = 0x480;
          };
          HDMI-0 = {
            enable = true;
            mode = 1080x1920;
            position = 2560x0;
          };
        };
      };
    };
  };

  services.kanshi = {
    enable = true;
    profiles = {
      dual = {
        outputs = [
          {
            criteria = DP-0;
            mode = 2560x1440;
            position = 0,480;
          }
          {
            criteria = HDMI-0;
            mode = 1080x1920;
            position = 2560,0;
          }
        ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    feh        # wallpaper for i3
    swaybg     # wallpaper for Sway
    nwg-look   # GTK theming
    qt6ct      # Qt theming
  ];
}

