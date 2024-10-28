{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
let
  cfg = config.programs.mycli;
in
{
  options.programs.mycli = with types; {
    enable = mkEnableOption "command line MySQL interface";
  };

  config = mkIf cfg.enable {
    home = {
      packages = [ pkgs.mycli ];
    };
  };
}
