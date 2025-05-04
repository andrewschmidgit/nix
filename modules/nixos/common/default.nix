{
  userConfig,
  pkgs,
  ...
}: {
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "America/Chicago";

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  # Wayland
  security.polkit.enable = true;
  hardware.graphics.enable = true;

  # User
  users.users.${userConfig.name} = {
    description = userConfig.fullName;
    extraGroups = [ "networkmanager" "wheel" ];
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Networking
  networking.networkmanager.enable = true;

  # Password-less sudo
  security.sudo.wheelNeedsPassword = false;

  # System packages
  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  # OpenSSH
  services.openssh.enable = true;
}
