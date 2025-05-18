{
  inputs,
  userConfig,
  hostname,
  nixosModules,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    "${nixosModules}/common"
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = hostname;

  nix.settings.trusted-users = [ userConfig.name ];

  system.stateVersion = "24.11"; # Did you read the comment?

}
