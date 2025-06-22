default:
  just --list

deploy machine='':
  #!/usr/bin/env sh
  host="$(hostname)"
  if [ -z "{{machine}}" ]; then
    sudo nixos-rebuild switch --fast --flake ".#$host"
  else
    nixos-rebuild switch \
      --fast \
      --flake ".#{{machine}}" \
      --target-host "{{machine}}" \
      --use-remote-sudo
  fi

cypher FILE:
  agenix -e {{FILE}}

install machine user ip:
  nix run github:nix-community/nixos-anywhere -- \
    --flake ".#{{machine}}" \
    --generate-hardware-config nixos-generate-config ./hosts/{{machine}}/hardware-configuration.nix \
    -i ~/.ssh/id_ed25519 \
    {{user}}@{{ip}}
