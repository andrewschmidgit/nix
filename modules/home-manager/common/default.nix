{
  pkgs,
  userConfig,
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
