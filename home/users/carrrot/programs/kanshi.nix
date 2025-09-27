{ pkgs, ... }:

{
  services.kanshi = {
    enable = true;
    profiles = {
      "dual" = {
        outputs = [
          {
            criteria = "DP-0";
            mode = "2560x1440";
            position = "0,480";
          }
          {
            criteria = "HDMI-0";
            mode = "1080x1920";
            position = "2560,0";
          }
        ];
      };
    };
  };
}

