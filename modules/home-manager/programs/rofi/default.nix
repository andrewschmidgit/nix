{ config, ... }:

{
  xdg.configFile."rofi/theme.rasi".source = ./everforest.rasi;

  programs.rofi = {
    enable = true;
    font = "Maple Mono";
    theme = "theme";
  };
}
