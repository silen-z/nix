{ lib, pkgs, config, modulesPath, ... }:

with lib;
{
  system.stateVersion = "22.05";

  imports = [
    "${modulesPath}/profiles/minimal.nix"
    ./cachix.nix
  ];

  users.users.silenz = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = [
    pkgs.cachix
    pkgs.cascadia-code
  ];

  i18n.extraLocaleSettings = {
    LC_TIME = "cs_CZ.UTF-8";
  };

  # Enable nix flakes
  nix.package = pkgs.nixVersions.stable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

}
