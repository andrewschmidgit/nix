{ ... }:

{
  imports = [
    ./keymaps.nix

    ./lsp.nix

    ./harpoon.nix
    ./oil.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals.mapleader = " ";
    colorschemes.everforest.enable = true;

    opts = {
      number = true;
      relativenumber = true;

      termguicolors = true;

      shiftwidth = 0;
      tabstop = 2;
      smartindent = true;
      expandtab = true;
    };

    plugins = {
      lualine.enable = true;
      notify.enable = true;
      todo-comments.enable = true;
      web-devicons.enable = true;
    };
  };
}
