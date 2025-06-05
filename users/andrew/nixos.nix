{ pkgs, birdhouse, ... }:

{
  users.users.andrew = {
    description = birdhouse.name;
    extraGroups = [ "networkmanager" "wheel" ];
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
