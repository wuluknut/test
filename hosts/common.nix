{ ... }:

{
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
    };

    efi = {
      efiSysMountPoint = "/efi";
      canTouchEfiVariables = true;
    };
  };

  networking.networkmanager.enable = true;

  system.stateVersion = "25.11";
}
