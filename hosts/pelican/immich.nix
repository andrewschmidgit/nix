{ config, ... }:

let
  domain = "schmid.place";
  port = builtins.toString config.services.immich.port;

  certDir = "/var/lib/acme/${domain}";
in {
  services.immich = {
    enable = true;
    group = "multimedia";
    mediaLocation = "/storage/media/immich";
    accelerationDevices = [ "/dev/dri/renderD128" ];
  };

  services.caddy.virtualHosts."immich.${domain}".extraConfig = ''
    reverse_proxy http://localhost:${port}
    tls ${certDir}/cert.pem ${certDir}/key.pem {
      protocols tls1.3
    }
  '';
}
