{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    blender
    gimp
    krita
    inkscape
    obs-studio
    vesktop
    calibre
    plexamp
    jdownloader
    milkytracker
  ];
}

