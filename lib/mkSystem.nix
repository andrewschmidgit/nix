{ nixpkgs, inputs, ... }:

{
  hostname,
  username,
  name ? "",
  system ? "x86_64-linux",
}:

let
  # NixOS
  hostConfig = ../hosts/${hostname};
  userOsConfig = ../users/${username}/nixos.nix;

  # agenix
  agenix = inputs.agenix;

  # Home Manager
  home-manager = inputs.home-manager.nixosModules;
  userHomeConfig = ../users/${username};

  # nixvim
  nixvim = inputs.nixvim;

  # secrets
  secretsPath = ../secrets;

  # complete configuration
  birdhouse = {
    inherit hostname username name secretsPath;
  };
in nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    inherit inputs birdhouse;
  };

  modules = [
    hostConfig
    userOsConfig

    ../modules

    # agenix
    agenix.nixosModules.default
    {
      environment.systemPackages = [ agenix.packages.${system}.default ];
    }

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
