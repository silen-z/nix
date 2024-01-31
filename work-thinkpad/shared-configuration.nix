{ config, pkgs, ... }:
{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/nvme0n1";

  networking = {
    hostName = "ph-thinkpad";

    # not sure if it works together with wpa_supplicant (which seems enabled by default)
    # networkmanager.enable = true; 
  };

  time.timeZone = "Europe/Prague";

  sound.enable = true;
  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio.enable = true;

  users.users.pavelh = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    initialPassword = "changelater";
  };

  environment.systemPackages = with pkgs; [
    displaylink
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

