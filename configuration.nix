{ lib, pkgs, config, modulesPath, wsl, ... }:

with lib;
{
  system.stateVersion = "22.05";
  
  imports = [
    "${modulesPath}/profiles/minimal.nix"
    ./cachix.nix
  ];

  wsl = {
    enable = true;
    automountPath = "/mnt";
    defaultUser = "silenz";
    startMenuLaunchers = true;

    # Enable native Docker support
    # docker-native.enable = true;

    # Enable integration with Docker Desktop (needs to be installed)
    # docker-desktop.enable = true;

    # don't include executables from Windows
    interop.includePath = false;
  };

  users.users.silenz = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = [ 
    pkgs.cachix
  ];

  # Enable nix flakes
  nix.package = pkgs.nixVersions.stable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

}
