{
  pkgs,
  ...
}:

{
  programs.kitty.enable = true;

  home.packages = with pkgs; [
    grim
  ];

  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "kitty";
    };
  };
}
