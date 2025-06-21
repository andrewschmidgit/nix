{ ... }: 

{
  programs.nixvim.lsp = {
    enable = true;

    inlayHints.enable = true;

    servers = {
      nixd.enable = true;
    };
  };
}
