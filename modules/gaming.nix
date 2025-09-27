{ pkgs, ... }:

{
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  services.flatpak.enable = true; # for Lutris, Heroic, etc.

  environment.systemPackages = with pkgs; [
    lutris
    bottles
    rpcs3
    pcsx2
    dolphin-emu
  ];
}

