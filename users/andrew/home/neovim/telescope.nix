{ ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;
    settings = {
      defaults.layout_strategy = "vertical";
    };
    keymaps = {
      "<leader>//" = {
        action = "live_grep";
        options.desc = "live grep";
      };
      "<leader>/b" = {
        action = "buffers";
        options.desc = "buffers";
      };
      "<leader>/c" = {
        action = "colorscheme";
        options.desc = "colorscheme";
      };
      "<leader>/f" = {
        action = "find_files";
        options.desc = "find files";
      };
      "<leader>/g" = {
        action = "git_files";
        options.desc = "git files";
      };
      "<leader>/h" = {
        action = "help_tags";
        options.desc = "help tags";
      };
      "<leader>/q" = {
        action = "quickfix";
        options.desc = "quickfix";
      };
      "<leader>/r" = {
        action = "resume";
        options.desc = "resume";
      };
    };
  };

  programs.nixvim.dependencies = {
    ripgrep.enable = true;
  };
}
