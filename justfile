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
