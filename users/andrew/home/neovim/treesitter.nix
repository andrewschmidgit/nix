{ pkgs, ... }:

{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      c
      css
      html
      json
      just
      lua
      markdown
      nix
      rust
      svelte
      terraform
      toml
      typescript
      vim
      yaml
    ];

    settings = {
      highlight.enable = true;
      indent.enable = true;

      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "gnn";
          node_incremental = "grn";
          scope_incremental = "grc";
          node_decremental = "grm";
        };
      };

      sync_install = false;
    };
  };

  programs.nixvim.plugins.treesitter-context.enable = true;
  programs.nixvim.plugins.rainbow-delimiters.enable = true;
}
