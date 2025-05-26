{
  inputs,
  hostname,
  nixosModules,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    "${nixosModules}/common"
  ];

  programs.sway.enable = true;

  # for sway with home-manager
  security.polkit.enable = true;

  environment.sessionVariables = {
    # cursor may be invisible without this
    # WLR_NO_HARDWARE_CURSORS = "1";
    # tell electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session.command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
          --time \
          --asterisks \
          --user-menu \
          --cmd sway
      '';
    };
  };

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = hostname;
  
  system.stateVersion = "25.05";
}
