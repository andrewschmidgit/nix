{ config, lib, pkgs, birdhouse, ... }:

{
  # root user configuration
  users.users.root = let
    user = config.users.users.${birdhouse.username};
  in
    lib.mkIf birdhouse.isPrimaryUser
  {
    shell = pkgs.zsh;
    hashedPasswordFile = user.hashedPasswordFile;
    openssh.authorizedKeys.keys = user.openssh.authorizedKeys.keys;
  };

  # localization
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "America/Chicago";

  # nix
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Networking
  networking = {
    hostName = birdhouse.hostname;
    firewall.enable = true;
    networkmanager.enable = true;
  };

  # Password-less sudo
  security.sudo.wheelNeedsPassword = false;

  # System packages
  programs.zsh.enable = true;
  programs.git.enable = true;
  environment.systemPackages = with pkgs; [
    git
    just
    rsync
    vim
  ];

  # OpenSSH
  services.openssh = {
    enable = true;
    openFirewall = true;
  };
}
