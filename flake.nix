{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      # NixOS config named 'solarpunk'
      nixosConfigurations.solarpunk = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/solarpunk/default.nix

          # Home Manager as a NixOS module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.carrrot = import ./home/users/carrrot/home.nix;
          }
        ];
      };

      # Formatter for this repo (optional but nice)
      formatter.${system} = pkgs.alejandra;
    };
}
