{ ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 10;
    historyLimit = 10000;
    keyMode = "vi";
    shortcut = "a";
    mouse = true;
    terminal = "tmux-256color";
  };
}
