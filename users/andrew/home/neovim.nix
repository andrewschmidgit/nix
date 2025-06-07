{ ... }:

{
  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";
    colorschemes.everforest.enable = true;

    opts = {
      number = true;
      relativenumber = true;

      shiftwidth = 0;
      tabstop = 2;
      smartindent = true;
      expandtab = true;
    };
  };
}
