{ pkgs, ... }:
{
  time.timeZone = "Europe/Prague";

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
    ntfs3g
    openssl
    devenv
  ];

  environment.shells = [ pkgs.fish ];

  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "22.11";
}
