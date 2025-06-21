{
  description = "A template that shows all standard flake outputs";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    # home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # agenix
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    agenix.inputs.darwin.follows = ""; # don't download darwin deps

    # disko
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # nixvim
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, ... }@inputs: let
    mkSystem = import ./lib/mkSystem.nix {
      inherit nixpkgs inputs;
    };
  in {
    nixosConfigurations = {
      albatross = mkSystem {
        hostname = "albatross";
        username = "andrew";
        name = "Andrew Schmid";
      };

      pelican = mkSystem {
        hostname = "pelican";
        username = "andrew";
        name = "Andrew Schmid";
      };
    };
  };
}
