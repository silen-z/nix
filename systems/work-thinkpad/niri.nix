{ pkgs, ... }:
{
  programs.niri.enable = true;

  programs.waybar.enable = true; # top bar

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd niri-session";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    fuzzel
    swaylock
    mako
    swayidle
    xwayland-satellite
  ];
}
