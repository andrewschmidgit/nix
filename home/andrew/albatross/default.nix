{ hmModules, ... }: {
  imports = [
    "${hmModules}/common"
    "${hmModules}/programs/alacritty"
    "${hmModules}/programs/sway"
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";

  wayland.windowManager.sway.config.output = {
    "Virtual-1" = {
      mode = "1920x1440@60Hz";
    };
  };
}
