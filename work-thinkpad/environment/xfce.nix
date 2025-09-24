{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    xfce.xfce4-xkb-plugin
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
