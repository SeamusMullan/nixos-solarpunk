{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  services.xserver.windowManager.i3.enable = true;
  programs.sway.enable = true;

  # autorandr for X11 multi-monitor profiles
  services.autorandr = {
    enable = true;
    profiles = {
      "dual" = {
        config = {
          "DP-0" = {
            enable = true;
            primary = true;
            mode = "2560x1440";
            position = "0x480";
          };
          "HDMI-0" = {
            enable = true;
            mode = "1080x1920";
            position = "2560x0";
          };
        };
      };
    };
  };

  # Packages for theming / wallpapers
  environment.systemPackages = with pkgs; [
    feh        # wallpaper tool for i3/X11
    swaybg     # wallpaper tool for Sway/Wayland
    nwg-look   # GTK theming tool
    qt6ct      # Qt theming tool
  ];
}

