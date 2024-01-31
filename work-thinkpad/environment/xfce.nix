{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    xfce.xfce4-xkb-plugin
  ];

  services.xserver = {
    enable = true;
    desktopManager = {
      xfce.enable = true;
    };
    layout = "us";
    videoDrivers = [ "displaylink" "modesetting" ];
    displayManager = {
      defaultSession = "xfce";
      lightdm.enable = true;
    };
  };
}
