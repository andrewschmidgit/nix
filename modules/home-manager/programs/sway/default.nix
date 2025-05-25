{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.alacritty.enable = true;

  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    mako
    shotman
  ];

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      terminal = "alacritty";
      keybindings = let
      	mod = config.wayland.windowManager.sway.config.modifier;
      in lib.mkOptionDefault {
      	"${mod}+Backspace" = "exec shotman -c output";
      	"${mod}+Shift+Backspace" = "exec shotman -c region";
      };
    };
  };
}
