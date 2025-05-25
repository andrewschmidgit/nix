{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 10;
    historyLimit = 10000;
    keyMode = "vi";
    shortcut = "a";
    mouse = true;
    terminal = "tmux-256color";

    plugins = let
      tmux-everforest = pkgs.tmuxPlugins.mkTmuxPlugin {
        pluginName = "tmux-everforest";
        version = "";
        src = pkgs.fetchFromGitHub {
          owner = "TanglingTreats";
          repo = "tmux-everforest";
          rev = "d8d6ac5";
          sha256 = "sha256-Iff+S5VPhBYw8Jc7aA4oO3ZOwRMteApJIN9j2eVsN3s=";
        };
      };
      in [
        {
          plugin = tmux-everforest;
          extraConfig = "set -g @tmux-everforest 'dark-medium'";
        }
      ];
  };
}
