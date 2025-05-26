{ pkgs, ... }:

{
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "America/Chicago";

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
    firewall.enable = true;
    networkmanager.enable = true;
  };

  # Password-less sudo
  security.sudo.wheelNeedsPassword = false;

  # System packages
  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  # OpenSSH
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
    };
    openFirewall = true;
  };
}
