{ pkgs, ... }:
{
  home.username = "carrrot";
  home.homeDirectory = "/home/carrrot";

  programs.zsh.enable = true;

  home.stateVersion = "24.05";
}
