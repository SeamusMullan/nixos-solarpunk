{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  services.xserver.windowManager.i3.enable = true;
  programs.sway.enable = true;

  # autorandr for X11
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

  # kanshi for Wayland
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
    feh
    swaybg
    nwg-look
    qt6ct
  ];
}

