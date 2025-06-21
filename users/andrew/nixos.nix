{ lib, pkgs, birdhouse, ... }:

let
  pubKeys = lib.filesystem.listFilesRecursive ./keys;
in
{
  users.users.andrew = {
    description = birdhouse.name;
    extraGroups = [ "networkmanager" "wheel" ];
    isNormalUser = true;
    shell = pkgs.zsh;

    openssh.authorizedKeys.keys = lib.lists.forEach pubKeys (key: builtins.readFile key);
  };

  programs.zsh.enable = true;
}
