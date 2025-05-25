{ ... }:

{
  programs.alacritty = {
    enable = true;
    theme = "everforest_dark";
    settings = {
      font = {
      	normal = {
          family = "Maple Mono";
          style = "Regular";
        };
      };
      window = {
        opacity = 0.8;
        dynamic_padding = true;
      };
    };
  };
}
