{ config, pkgs, ... }:
{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/nvme0n1";

  networking = {
    hostName = "ph-thinkpad";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Prague";

  nixpkgs.config.pulseaudio = true;

  users.users.pavelh = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
      "vboxusers"
    ];
    initialPassword = "changelater";
  };

  environment.systemPackages = with pkgs; [
    displaylink
    tailscale
    ntfs3g
    clang
    pkg-config
    openssl
  ];

  environment.shells = [ pkgs.fish ];

  services.gnome.gnome-keyring.enable = true;

  services.tailscale.enable = true;

  services.traefik = (import ./services/traefik.nix) { inherit config; } // {
    enable = true;
  };

  networking.firewall = {
    enable = false;
  };

  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  security.polkit.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.11";
}
