{
  description = "system configurations via home-mamanger";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      mkHome = { system }: {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.pavelh = import ./work-thinkpad/user/pavelh.nix;
        home-manager.extraSpecialArgs = {
          unstable = import nixpkgs-unstable { inherit system; config = { allowUnfree = true; }; };
        };
      };
    in
    {
      nixosConfigurations.work-thinkpad =
        let
          system = "x86_64-linux";
          home = mkHome { inherit system; };
        in
        nixpkgs.lib.nixosSystem {
          inherit system;

          #        pkgs = import nixpkgs { 
          #          inherit system;
          #          config = { allowUnfree = true; };
          #        };

          modules = [
            ./work-thinkpad/hardware-configuration.nix
            ./work-thinkpad/shared-configuration.nix
            ./work-thinkpad/environment/xfce.nix
            home-manager.nixosModules.home-manager
            home
          ];
        };

      nixosConfigurations.work-thinkpad-hyperland =
        let
          system = "x86_64-linux";
          home = mkHome { inherit system; };
        in
        nixpkgs.lib.nixosSystem {
          inherit system;

          #        pkgs = import nixpkgs { 
          #          inherit system;
          #          config = { allowUnfree = true; };
          #        };

          modules = [
            ./work-thinkpad/hardware-configuration.nix
            ./work-thinkpad/shared-configuration.nix
            ./work-thinkpad/environment/hyperland.nix
            home-manager.nixosModules.home-manager
            home
          ];
        };
    };
}
