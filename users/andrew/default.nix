{
  config,
  pkgs,
  lib,
  birdhouse,
  ...
}:

{
  imports = let
    hostHomeConfig = ./hosts/${birdhouse.hostname}.nix;
  in [
    ./home/git.nix
    ./home/neovim.nix
    ./home/tmux.nix
    ./home/zsh.nix
  ] ++ lib.optional (builtins.pathExists hostHomeConfig) hostHomeConfig;

  programs.home-manager.enable = true;

  xdg.enable = true;

  # fix for default value of "${XDG_CONFIG_DIR}/agenix"
  age.secretsDir = "${config.xdg.configHome}/agenix";

  home = {
    username = birdhouse.username;
    homeDirectory = "/home/${birdhouse.username}";
    
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
