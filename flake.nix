{
  description = "SilenZ - home-manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixos-wsl, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
       	config.allowUnfree = true;
      };
    in {
      nixosConfigurations.glasscannon-wsl = nixpkgs.lib.nixosSystem {
         inherit system;
         modules = [
 	         ./configuration.nix
           nixos-wsl.nixosModules.wsl
         ];
      }; 

      homeConfigurations.silenz = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];
 
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}

