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
    ./tofi.nix
  ];

  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    mako
    shotman
    clapboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, d, exec, rofi -show run"
        "$mod, t, exec, tofi-drun --drun-launch=true"
        "$mod, Backspace, exec, shotman -c output"
        "$mod_SHIFT, Backspace, exec, shotman -c output"
      ];
    };
  };
}
