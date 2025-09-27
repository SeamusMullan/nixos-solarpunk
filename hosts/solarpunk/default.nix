
{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/users.nix
    ../../modules/nvidia.nix
    ../../modules/audio.nix
    ../../modules/desktop.nix
    ../../modules/gaming.nix
    ../../modules/creative.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
