{ nixpkgs, inputs, ... }:

{
  hostname,
  username,
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
in nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    inherit inputs hostname username;
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
        inherit inputs hostname username;
      };

      home-manager.sharedModules = [ agenix.homeManagerModules.default ];
    }
  ];
}
