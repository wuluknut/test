{ pkgs, ... }:

{
  imports = [
    ./modules/niri-dms.nix
  ];

  home.username = "wuluknut";
  home.homeDirectory = "/home/wuluknut";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    fastfetch
  ];

  programs.git = {
    enable = true;
    userName = "Wulu Knut";
    userEmail = "wuluknut@email.com";
  };

  programs.home-manager.enable = true;
}
