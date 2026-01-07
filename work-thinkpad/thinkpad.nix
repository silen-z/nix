{
  nixpkgs,
  nixpkgs-unstable,
  nixos-hardware,
  home-manager,
}:
let
  system = "x86_64-linux";
  home = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.pavelh = import ./user/pavelh.nix;
    home-manager.extraSpecialArgs = {
      nixpkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    };
  };
in
nixpkgs.lib.nixosSystem {
  inherit system;

  modules = [
    ./hardware.nix
    nixos-hardware.nixosModules.lenovo-thinkpad-l14-intel
    ./configuration.nix
     ./environment/xfce.nix
    #./environment/niri.nix
    home-manager.nixosModules.home-manager
    home
  ];
}
