{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.extraServices.podman;
in {
  options.extraServices.podman.enable = lib.mkEnableOption "enable podman";

  config = lib.mkIf cfg.enable {
    virtualisation.containers.enable = true;
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;

      autoPrune = {
        enable = true;
        dates = "weekly";
        flags = [ "--filter=until=24h" ];
      };
    };

    environment.systemPackages = with pkgs; [
      podman-compose
    ];
  };
}
