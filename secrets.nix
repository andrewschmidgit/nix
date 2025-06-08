let
  andrew = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILBO3ky32BUm84aAwHpxFviu5SQzrk3vQwczSg2i7BBy";
  users = [ andrew ];

  albatross = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGs33GjTUdtf6/5uLU7mEgzopUVCfNXkDMm135A9scvz";
  pelican = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP7wY8v8UqC/mSi73XMD/UoZMxf+MbunOuk6rohZutub";
  hosts = [ albatross pelican ];

  cloudflare = [ andrew pelican ];
in {
  # emails
  "users/andrew/email.age".publicKeys = [ andrew ] ++ hosts;

  # cloudflare
  "secrets/cloudflare.age".publicKeys = cloudflare;
  "secrets/cloudflare-email.age".publicKeys = cloudflare;
  "secrets/cloudflare-domain.age".publicKeys = cloudflare;
}
