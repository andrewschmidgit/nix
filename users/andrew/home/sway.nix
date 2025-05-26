{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./alacritty.nix
    ./rofi
  ];

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
        "${mod}+d" = "exec rofi -show run";
      	"${mod}+Backspace" = "exec shotman -c output";
      	"${mod}+Shift+Backspace" = "exec shotman -c region";
      };
    };
  };
}
