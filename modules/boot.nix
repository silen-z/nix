{ ... }:
{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/nvme0n1";

  swapDevices = [
    {
      device = "/swapfile";
      size = 8192; # size in MB (8GB)
    }
  ];
}
