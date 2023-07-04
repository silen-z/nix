{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/nvme0n1";

  networking = {
    hostName = "ph-thinkpad";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Prague";
  
  services.xserver = {
    enable = true;
    desktopManager = {
      xfce.enable = true;
    };
    layout = "us";
    videoDrivers = [ "displaylink" "modesetting" ];
    displayManager.defaultSession = "xfce";
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.pavelh = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
    initialPassword = "changelater";
  };
 
  environment.systemPackages = with pkgs; [
    displaylink
    xfce.xfce4-xkb-plugin
    tailscale
  ];
  
  environment.shells = [ pkgs.fish ];

  services.tailscale.enable = true;
  
  networking.firewall = {
    enable = false;
  };

  virtualisation.docker.enable = true;
  security.polkit.enable = true;  
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.11";
}

