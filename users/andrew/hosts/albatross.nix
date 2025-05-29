{ ... }:

{
  imports = [
    ../home/sway.nix
  ];

  wayland.windowManager.sway.config.output = {
    "Virtual-1" = {
      mode = "1920x1440@60Hz";
    };
  };
}
