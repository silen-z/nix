{ pkgs, ... }:
{
  programs.niri.enable = true;

  # Noctalia provides the bar, launcher, notifications, wallpaper, idle
  # daemon and lock screen, replacing waybar/fuzzel/mako/swaylock/swayidle.
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true; # NetworkManager, Bluetooth, UPower
  };

  services.power-profiles-daemon.enable = true;

  # Noctalia's own greeter, matching the shell's look; replaces greetd+tuigreet.
  programs.noctalia-greeter = {
    enable = true;
    settings = {
      session.default = "niri";
    };
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
