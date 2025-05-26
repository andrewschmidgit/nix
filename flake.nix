{
  description = "A template that shows all standard flake outputs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    agenix.inputs.darwin.follows = ""; # don't download darwin deps
  };

  outputs = {
    self,
    agenix,
    nixpkgs,
    home-manager,
    ... }@inputs:
  let
    mkNixosConfiguration = {
      hostname, # required string
      username, # required string
      system ? "x86_64-linux"
    }: nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs hostname username;
          nixosModules = "${self}/modules/nixos";
        };

        modules = [
          ./hosts/${hostname}
          ./users/${username}/nixos.nix

          agenix.nixosModules.default
          { environment.systemPackages = [ agenix.packages.${system}.default ]; }


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
