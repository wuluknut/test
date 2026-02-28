{
  config,
  lib,
  wulib,
  ...
}:

let
  cfg = config.wuOptions;
in
{
  imports = (wulib.scanPaths ./basic) ++ [
    ./desktop
    ./server
  ];

  options.wuOptions = {
    desktop.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable desktop graphical environment";
    };
    server.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable server specific configurations";
    };
  };
}
