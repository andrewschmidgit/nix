{ hmModules, ... }: {
  imports = [
    "${hmModules}/common"
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
