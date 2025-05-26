{ ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "ssh" "themes" ];
      theme = "agnoster";
    };

    shellAliases = {
      # vim
      v = "nvim";
      vim = "nvim";

      # git
      g = "git";
      ga = "git add";
      gs = "git status";
      gc = "git commit";
      gl = "git log --graph --abbrev-commit";
      gp = "git push";
      gpu = "git pull";
    };
  };
}
