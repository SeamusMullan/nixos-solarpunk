{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Dublin";
  i18n.defaultLocale = "en_IE.UTF-8";

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    git
  ];

}
