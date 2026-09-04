{
  nixpkgs,
  nixpkgs-unstable,
  nixos-hardware,
  home-manager,
  noctalia,
  noctalia-greeter,
}:
let
  system = "x86_64-linux";
  home = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.pavelh = import ../../users/pavelh.nix;
    home-manager.extraSpecialArgs = {
      nixpkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      inherit noctalia;
    };
  };
in
nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    flakeUri = "/home/pavelh/.config/nix#work-thinkpad";
  };

  modules = [
    ../../machines/work-thinkpad/hardware.nix
    nixos-hardware.nixosModules.lenovo-thinkpad-l14-intel

    ../../modules/boot.nix
    ../../modules/networking.nix
    ../../modules/media.nix
    ../../modules/virtualisation.nix
    ../../modules/nix.nix
    ../../modules/base.nix

    ./niri.nix

    home-manager.nixosModules.home-manager
    home

    noctalia.nixosModules.default
    noctalia-greeter.nixosModules.default
  ];
}
