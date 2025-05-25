default:
  just --list

deploy machine hostname='':
  #!/usr/bin/env sh
  if [ -z "{{hostname}}" ]; then
    sudo nixos-rebuild switch --fast --flake ".#{{machine}}"
  else
    nixos-rebuild switch \
      --fast \
      --flake ".#{{machine}}" \
      --target-host "{{hostname}}" \
      --use-remote-sudo
  fi
