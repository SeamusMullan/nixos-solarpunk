{ pkgs, ... }:
{
  home.username = "carrrot";
  home.homeDirectory = "/home/carrrot";

  programs.zsh.enable = true;

  home.stateVersion = "25.05";

imports = [
    ./programs/kanshi.nix
    # add other program configs here
  ];
}
