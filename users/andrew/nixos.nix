{ pkgs, hostname, ... }:

{
  imports = [
    ./hosts/${hostname}/nixos.nix
  ];

  # User
  users.users.andrew = {
    description = "Andrew Schmid";
    extraGroups = [ "networkmanager" "wheel" ];
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
