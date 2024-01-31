{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # widgets
    # eww-wayland 

    # screensharing for wayland/hyprland
    pipewire
    wireplumber

    #app launchers
    tofi
    bemenu
  ];

  programs.hyprland = {
    enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland";
      };
    };
  };

}
