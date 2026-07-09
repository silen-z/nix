{ pkgs, ... }:
{
  networking = {
    hostName = "ph-thinkpad";

    networkmanager = {
      enable = true;
      plugins = [
        pkgs.networkmanager-openvpn
      ];
    };

    firewall.enable = false;
  };

  services.tailscale.enable = true;
  environment.systemPackages = [ pkgs.tailscale ];
}
