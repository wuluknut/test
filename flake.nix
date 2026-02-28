{
  description = "NixOS configuration of Wulu Knut";

  nixConfig = {
    extra-substituters = [
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

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
