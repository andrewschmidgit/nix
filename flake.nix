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
    users = {
      andrew = {
        fullName = "Andrew Schmid";
        name = "andrew";
      };
    };

    mkNixosConfiguration = {
      hostname, # required string
      username, # required string
    }: nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs hostname;
          userConfig = users.${username};
          nixosModules = "${self}/modules/nixos";
        };

        modules = [
          ./hosts/${hostname}
          home-manager.nixosModules.home-manager {
            home-manager.users.${username} = import ./home/${username}/${hostname};

            home-manager.backupFileExtension = "backup";

            home-manager.extraSpecialArgs = {
              inherit inputs;
              userConfig = users.${username};
              hmModules = "${self}/modules/home-manager";
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
