{ config, pkgs, ... }:

{
  home.stateVersion = "22.05";

  home.username = "silenz";
  home.homeDirectory = "/home/silenz";

  programs.home-manager.enable = true;

  programs.nushell.enable = true;
  programs.starship.enable = true;

  programs.helix.enable = true;

  programs.git = {
    enable = true;
    userName = "Pavel Hrách";
    userEmail = "pavel@hrach.email";
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = [
    pkgs.nodePackages.intelephense
    pkgs.cascadia-code
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };

}
