{ ... }: {
  programs.tmux = {
    enable = true;
    shortcut = "a";
    mouse = true;
    baseIndex = 1;
    escapeTime = 10;
    keyMode = "vi";
  };
}
