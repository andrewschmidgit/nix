{
  pkgs,
  userConfig,
  rootDir,
  ...
}: {
  imports = [
    ../programs/git
    ../programs/tmux
    ../programs/zsh
  ];

  home = {
    username = "${userConfig.name}";
    homeDirectory = "/home/${userConfig.name}";
    
    file.".local/bin" = {
      source = ../../../scripts;
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    jq
    vim
    neovim
    wl-clipboard

    # archives
    zip
    xz
    unzip

    # monitoring
    btop
    iotop
    iftop
  ];
}
