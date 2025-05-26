{ username, hostname, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./sway.nix
    ./tmux.nix
    ./zsh.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    
    file.".local/bin" = {
      source = ../../../scripts;
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    # fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    maple-mono.truetype-autohint

    # utils
    jq
    vim
    neovim
    just
    fzf

    # archives
    zip
    xz
    unzip

    # monitoring
    btop
    iotop
    iftop
  ];

  home.stateVersion = "24.11";
}
