{ pkgs, ... }:

{
  users.users.carrrot = {
    isNormalUser = true;
    description = "24carrot i aint one bit fake";
    home = "/home/carrrot";
    extraGroups = [
      "wheel"    # sudo
      "audio"    # audio interface
      "video"    # GPU access
      "docker"   # docker group
      "libvirtd" # virtualization
      "input"    # controllers
    ];
    shell = pkgs.zsh;
  };
}
