let
  andrew = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILBO3ky32BUm84aAwHpxFviu5SQzrk3vQwczSg2i7BBy";
  users = [ andrew ];

  albatross = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGs33GjTUdtf6/5uLU7mEgzopUVCfNXkDMm135A9scvz";
  pelican = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHNXGQWqqBN49aLyz7BB6yFhU0868EU46IWX1UmxHQaS";
  hosts = [ albatross pelican ];

  cloudflare = [ andrew pelican ];
in {
  # cloudflare
  "secrets/cloudflare.age".publicKeys = cloudflare;
}
