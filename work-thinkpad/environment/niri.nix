{ pkgs, ... }:
{
  programs.niri.enable = true;

  security.pam.services.swaylock = {};

  programs.waybar.enable = true; # top bar

  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    jack.enable = true;
  };

  environment.systemPackages = with pkgs; [ fuzzel swaylock mako swayidle xwayland-satellite ];
}
