{ hmModules, ... }: {
  imports = [
    "${hmModules}/common"
    "${hmModules}/programs/sway"
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
