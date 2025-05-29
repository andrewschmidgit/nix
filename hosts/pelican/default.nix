{
  inputs,
  config,
  username,
  hostname,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  extraServices.podman.enable = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = hostname;

  nix.settings.trusted-users = [ username ];

  system.stateVersion = "24.11"; # Did you read the comment?
}
