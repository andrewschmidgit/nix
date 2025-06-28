{ ... }:

{
  imports = [
    ../home/hyprland.nix
  ];

  wayland.windowManager.hyprland.settings.monitor = [
    "Virtual-1, 1920x1440@30, 0x0, 1"
  ];
}
