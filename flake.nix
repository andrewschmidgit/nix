{
  description = "A template that shows all standard flake outputs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ... }@inputs:
  let
    mkNixosConfiguration = {
      hostname, # required string
      username, # required string
    }: nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs hostname username;
          nixosModules = "${self}/modules/nixos";
        };

        modules = [
          ./hosts/${hostname}
	  ./users/${username}/nixos
          home-manager.nixosModules.home-manager {
            home-manager.users.${username} = import ./users/${username};

            home-manager.backupFileExtension = "backup";

            home-manager.extraSpecialArgs = {
              inherit inputs hostname username;
            };
          }
        ];
      };
  in
  {
    nixosConfigurations = {
      albatross = mkNixosConfiguration {
        hostname = "albatross";
        username = "andrew";
      };

      pelican = mkNixosConfiguration {
        hostname = "pelican";
        username = "andrew";
      };
    };
  };
}
