{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = { inherit inputs; };

    users.wuluknut = ./wuluknut/home.nix;
  };

  users.users.wuluknut = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
  };
}
