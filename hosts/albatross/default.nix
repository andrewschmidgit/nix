{
  inputs,
  hostname,
  nixosModules,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    "${nixosModules}/common"
    "${nixosModules}/desktop/sway"
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = hostname;
  
  system.stateVersion = "25.05";
}
