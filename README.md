# My NixOS Flake-based Config
This organizational system is heavily inspired by
[Alex Nabokikh's config](https://github.com/AlexNabokikh/nix-config).

## New Machine Setup
The home manager configurations are separate from nixos itself,
so on first install you need to bootstrap home-manager like this:

```sh
nix-shell -p home-manager
home-manager switch --flake .#user@hostname
```

## Updating Configuration
```sh
# make sure to add any new files to git
git add .

# this uses the current hostname of the system you're on
# to choose the correct nixosConfiguration
sudo nixos-rebuild switch --flake .
```

# Resources

- Main inspiration: https://github.com/AlexNabokikh/nix-config
- A straightforward guide to NixOS with flakes / home-manager: https://nixos-and-flakes.thiscute.world
