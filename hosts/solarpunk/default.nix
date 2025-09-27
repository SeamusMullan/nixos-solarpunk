{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    # add more modules as you implement them
  ];

  # Target the NixOS release you intend to install first.
  system.stateVersion = "24.05";
}
