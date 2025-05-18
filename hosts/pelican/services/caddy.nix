{ config, lib, ... }:

{
	networking.firewall.allowedTCPPorts = [ 80 443 ];

	services.caddy = {
		enable = true;
		virtualHosts = {
			"http://${config.networking.hostName}.lan" = {
				extraConfig = ''
					reverse_proxy http://localhost:5005
				'';
			};
		};
	};
}
