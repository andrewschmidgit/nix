{
  inputs,
  config,
  birdhouse,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    ./immich.nix
  ];

  extraServices.podman.enable = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = birdhouse.hostname;

  nix.settings.trusted-users = [ birdhouse.username ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
