{ config, ... }:

{
	services.frigate = {
		enable = true;
		settings = {
			ffmpeg.hwaccel_args = "preset-vaapi";

			record = {
				enabled = true;
				retain = {
					days = 7;
					mode = "all";
				};
				events = {
					retain = {
						default = 30;
						mode = "motion";
					};
				};
			};

			cameras."desk" = {
				ffmpeg.inputs = [
				{
					path = "rtsp://admin:password@desk.lan:554/cam/realmonitor?channel=1&subtype=1";
					roles = [ "detect" ];
				}
				{
					path = "rtsp://admin:password@desk.lan:554/cam/realmonitor?channel=1&subtype=0";
					roles = [ "record" ];
				}
				];
			};
		};
	};
}
