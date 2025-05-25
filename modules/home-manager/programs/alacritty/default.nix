{ ... }:

{
  programs.alacritty = {
    enable = true;
    theme = "argonaut";
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
