{ config, pkgs, lib, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;   # Wayland + better performance
    nvidiaPersistenced = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = false; # Keep proprietary driver (open kernel module isn’t stable yet for gaming)
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Enable PRIME render offload (useful if you want one GPU primary, other for compute)
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
    };
  };

  # CUDA dev packages
  environment.systemPackages = with pkgs; [
    cudatoolkit
    nvidia-settings
  ];
}

