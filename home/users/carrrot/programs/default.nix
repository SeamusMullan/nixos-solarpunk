{ pkgs, ... }:

{
  programs.git.enable = true;
  programs.git.userName = carrot;
  programs.git.userEmail = your@email.com;

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ git docker sudo tmux colored-man-pages ];
      theme = agnoster;
    };
  };

  programs.starship.enable = true;

  programs.kitty.enable = true;

  programs.tmux = {
    enable = true;
    clock24 = true;
    plugins = with pkgs; [ tmuxPlugins.sensible tmuxPlugins.resurrect ];
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
      telescope-nvim
      vim-nix
      lsp-zero-nvim
    ];
  };

  programs.vscode.enable = true;

  home.packages = with pkgs; [
    docker
    docker-compose
    virt-manager
    qemu
  ];
}

