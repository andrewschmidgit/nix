{ ... }:

{
  programs.nixvim.keymaps = [
      { key = "-"; action = "<cmd>Oil<CR>"; }

      # harpoon
      { key = "<leader>a"; action.__raw = "function() require'harpoon':list():add() end"; options.desc = "Add to harpoon"; }
      { key = "<C-e>"; action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end"; }
      { key = "<C-h>"; action.__raw = "function() require'harpoon':list():select(1) end"; }
      { key = "<C-j>"; action.__raw = "function() require'harpoon':list():select(2) end"; }
      { key = "<C-k>"; action.__raw = "function() require'harpoon':list():select(3) end"; }
      { key = "<C-l>"; action.__raw = "function() require'harpoon':list():select(4) end"; }
  ];
}
