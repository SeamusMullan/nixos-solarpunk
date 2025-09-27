{ pkgs, lib, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true; # GDM handles X11 + Wayland sessions

  services.xserver.windowManager.i3.enable = true;
  programs.sway.enable = true;

  # Set monitor layout via autorandr (X11) and kanshi (Wayland)
  services.autorandr.enable = true;
  services.kanshi = {
    enable = true;
    profiles = {
      dual = {
        outputs = [
          {
            criteria = HDMI-A-1;
            mode = 1920x1080;
            position = 0,0;
          }
          {
            criteria = DP-1;
            mode = 1080x1920;
            position = 1920,0;
          }
        ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    feh        # wallpaper (i3/X11)
    swaybg     # wallpaper (Sway/Wayland)
    nwg-look   # GTK theme config
    qt6ct      # Qt theme config
  ];
}

