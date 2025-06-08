{ config, birdhouse, ... }:

{
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  age.secrets.cloudflare.file = "${birdhouse.secretsPath}/cloudflare.age";

  security.acme = let
    envFile = config.age.secrets.cloudflare.path;
    domain = "schmid.place";
  in {
    acceptTerms = true;
    defaults.email = "andrewschmid-dev@proton.me";

    certs."${domain}" = {
      group = config.services.caddy.group;

      domain = domain;
      extraDomainNames = [ "*.${domain}" ];
      dnsProvider = "cloudflare";
      dnsResolver = "1.1.1.1:53";
      dnsPropagationCheck = true;
      environmentFile = envFile;
    };
  };

  services.caddy = {
    enable = true;

    virtualHosts."localhost".extraConfig = ''
      respond "OK"
    '';
  };
}
