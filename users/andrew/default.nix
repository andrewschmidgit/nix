{ hostname, username, pkgs, ... }: {
  imports = [
    ./home/git.nix
    ./home/tmux.nix
    ./home/zsh.nix

    ./hosts/${hostname}/home.nix
  ];

  programs.home-manager.enable = true;

  age.secrets.andrewEmail.file = ./email.age;

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    
    file.".local/bin" = {
      source = ../../scripts;
      recursive = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "vim";
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
