{
  description = "NixOS configuration of Wulu Knut";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:

    let
      wulib = import ./libs { inherit (nixpkgs) lib; };
    in
    {
      nixosConfigurations = {
        qemu = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          specialArgs = { inherit inputs wulib; };

          modules = [
            {
              networking.hostName = "qemu";
            }

            ./hosts/qemu

            ./modules

            ./users
          ];
        };
      };
    };
}
