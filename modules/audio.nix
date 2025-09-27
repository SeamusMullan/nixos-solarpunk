{ config, pkgs, ... }:

{
  # Enable rtkit for low-latency audio scheduling
  security.rtkit.enable = true;

  # PipeWire with JACK (so DAWs + yabridge work seamlessly)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Recommended: real-time kernel tweaks (without full musnix yet)
  boot.kernel.sysctl = {
    fs.inotify.max_user_watches = 524288;
    kernel.sched_rt_runtime_us = -1;
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
    qjackctl
    reaper
    carla       # plugin host
    yabridge
  ];
}

