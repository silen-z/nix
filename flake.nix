{
  description = "My NisOS systems";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      nixos-hardware,
      home-manager,
      ...
    }:
    {
      nixosConfigurations.work-thinkpad-xfce = import ./systems/work-thinkpad {
        inherit
          nixpkgs
          nixpkgs-unstable
          nixos-hardware
          home-manager
          ;
        variant = "xfce";
        desktop = ./systems/work-thinkpad/xfce.nix;
      };

      nixosConfigurations.work-thinkpad-niri = import ./systems/work-thinkpad {
        inherit
          nixpkgs
          nixpkgs-unstable
          nixos-hardware
          home-manager
          ;
        variant = "niri";
        desktop = ./systems/work-thinkpad/niri.nix;
      };
    };
}
