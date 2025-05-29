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
    mkSystem = import ./lib/mkSystem.nix {
      inherit nixpkgs inputs;
    };
  in
  {
    nixosConfigurations = {
      albatross = mkSystem {
        hostname = "albatross";
        username = "andrew";
      };

      pelican = mkSystem {
        hostname = "pelican";
        username = "andrew";
      };
    };
  };
}
