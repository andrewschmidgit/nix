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

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, d, exec, rofi -show run"
        "$mod, Backspace, exec, shotman -c output"
        "$mod_SHIFT, Backspace, exec, shotman -c output"
      ];
    };
  };
}
