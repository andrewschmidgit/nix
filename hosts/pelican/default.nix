{
  birdhouse,
  ...
}:

{
  imports = [
    ../common

    ./hardware-configuration.nix
    ./disko.nix

    ./caddy.nix
    ./immich.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = true;

  networking.hostName = birdhouse.hostname;
  networking.hostId = "8425e349";

  nix.settings.trusted-users = [ birdhouse.username ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
