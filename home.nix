{ config, pkgs, ... }:

{
  home.username = "wuluknut";
  home.homeDirectory = "/home/wuluknut";

  home.packages = with pkgs; [
    git
    htop
    neovim
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
