{ config, birdhouse, ... }: {
  programs.git = {
    enable = true;
    userName = birdhouse.name;
    userEmail = "andrewschmid-dev@proton.me";

    signing = {
      key = "~/.ssh/id_ed25519.pub";
      format = "ssh";
      signByDefault = true;
    };

    extraConfig = {
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";

      init.defaultBranch = "master";

      rerere.enabled = true;

      pull = {
        ff = "only";
      };

      push = {
        default = "current";
        autoSetupRemote = true;
      };
    };
  };
}
