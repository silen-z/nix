{ config, pkgs, unstable, ... }:

{  
  home.stateVersion = "22.11";
  
  programs.fish.enable = true;
  programs.helix.enable = true;
  
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ../wezterm/config.lua;
  };

  programs.git = {
    enable = true;
    userName = "Pavel Hrách";
    userEmail = "pavel.hrach@moderntv.eu";
  };
  
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = [
    pkgs.firefox
    pkgs.spotify
    pkgs.lapce
    unstable.jetbrains.phpstorm
#    unstable.jetbrains.idea-community
  ];

  home.sessionVariables = {
    EDITOR = "hx";
  };

}
