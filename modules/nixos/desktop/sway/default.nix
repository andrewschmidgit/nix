{ pkgs, ... }:

{
  programs.sway.enable = true;

  # for sway with home-manager
  security.polkit.enable = true;

  environment.sessionVariables = {
    # cursor may be invisible without this
    # WLR_NO_HARDWARE_CURSORS = "1";
    # tell electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session.command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
          --time \
          --asterisks \
          --user-menu \
          --cmd sway
      '';
    };
  };
}
