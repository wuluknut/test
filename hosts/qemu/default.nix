{ ... }:

{
  imports = [
    ../common.nix
    ./hardware.nix
  ];

  wuOptions.desktop.enable = true;
}
