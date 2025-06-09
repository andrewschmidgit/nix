{ ... }:

{
  programs.nixvim.plugins.oil = {
    enable = true;
    settings = {
      view_options.show_hidden = true;
      win_options.signcolumn = "yes:2"; # for git status
      keymaps = {
        "<C-h>" = false;
        "<C-l>" = false;
      };
    };
  };

  programs.nixvim.plugins.oil-git-status = {
    enable = true;
  };
}
