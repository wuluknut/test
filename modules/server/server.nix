{
  config,
  lib,
  ...
}:

let
  cfg = config.wuOptions.server;
in
{
  config = lib.mkIf cfg.enable {

  };
}
