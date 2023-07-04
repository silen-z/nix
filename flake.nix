{
  description = "system configurations via home-mamanger";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }: {
    nixosConfigurations.work-thinkpad = let system = "x86_64-linux"; in nixpkgs.lib.nixosSystem {
        inherit system;

#        pkgs = import nixpkgs { 
#          inherit system;
#          config = { allowUnfree = true; };
#        };

        modules = [
          ./work-thinkpad/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.pavelh = import ./work-thinkpad/pavelh.nix;
            home-manager.extraSpecialArgs = {
              unstable = import nixpkgs-unstable { inherit system; config = { allowUnfree = true; }; };
            };
          }
        ];
    };
  };
}
