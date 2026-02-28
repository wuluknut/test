{ lib, pkgs, ... }:

{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ ];

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
  ];

  i18n.defaultLocale = "en_US.UTF-8";

  time.timeZone = "Asia/Shanghai";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    useXkbConfig = true;
  };
}
