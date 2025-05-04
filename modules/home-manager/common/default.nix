{
  pkgs,
  userConfig,
  ...
}: {
  imports = [
    ../programs/fish
    ../programs/git
    ../programs/tmux
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
