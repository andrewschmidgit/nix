let
  andrew = "";
  users = [ andrew ];

  albatross = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILBO3ky32BUm84aAwHpxFviu5SQzrk3vQwczSg2i7BBy";
  hosts = [ albatross ];
in {
  # emails
  "users/andrew/email.age".publicKeys = hosts;
}
