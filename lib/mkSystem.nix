{ nixpkgs, inputs, ... }:

{
  hostname,
  username,
  isPrimaryUser ? true,
  name ? "",
  system ? "x86_64-linux",
}:

let
  # NixOS
  hostConfig = ../hosts/${hostname};
  userOsConfig = ../users/${username}/nixos.nix;

  # agenix
  agenix = inputs.agenix;

  # disko
  disko = inputs.disko;

  # Home Manager
  home-manager = inputs.home-manager.nixosModules;
  userHomeConfig = ../users/${username};

  # nixvim
  nixvim = inputs.nixvim;

  # secrets
  secretsPath = ../secrets;

  # complete configuration
  birdhouse = {
    inherit hostname username name secretsPath isPrimaryUser;
  };
in nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    inherit inputs birdhouse;
  };

  modules = [
    hostConfig
    userOsConfig

    # ../modules

    # agenix
    agenix.nixosModules.default
    {
      environment.systemPackages = [ agenix.packages.${system}.default ];
    }

    # disko
    disko.nixosModules.disko

    # home-manager
    home-manager.home-manager {
      home-manager.backupFileExtension = "backup";
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;

      home-manager.users.${username} = import userHomeConfig;
      home-manager.extraSpecialArgs = {
        inherit inputs birdhouse;
      };

      home-manager.sharedModules = [
        agenix.homeManagerModules.default
        nixvim.homeModules.nixvim
      ];
    }
  ];
}
