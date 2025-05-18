{ config, lib, ... }:

{
	virtualisation.oci-containers.containers.flame = {
		autoStart = true;
		image = "docker.io/pawelmalak/flame";
		environment = {
			PASSWORD = "password";
		};
		ports = ["5005:5005"];
		volumes = [
			"flame:/app/data"
		];
	};
}
