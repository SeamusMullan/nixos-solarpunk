{ config, pkgs, lib, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaPersistenced = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;

    # Keep proprietary driver for maximum gaming/pro app compatibility
    open = false;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.systemPackages = with pkgs; [
    cudatoolkit
    nvidia-settings
  ];
}
