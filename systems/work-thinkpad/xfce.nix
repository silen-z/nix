{ pkgs, ... }:
{

  environment.systemPackages = [
    pkgs.xfce4-xkb-plugin
  ];

  services.xserver = {
    enable = true;
    desktopManager = {
      xfce.enable = true;
    };
    xkb.layout = "us";
    videoDrivers = [
      "displaylink"
      "modesetting"
    ];
  };
  services.displayManager.defaultSession = "xfce";
}
