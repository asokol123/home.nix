{ config, lib, pkgs, ...}:

with lib;

let
  cfg = config.programs.orbstack;
  orbstackPkg = import ./orbstack-pkg.nix { inherit(pkgs) _7zz lib stdenvNoCC fetchurl; };
in {
  options.programs.orbstack = {
    enable = mkEnableOption "orbstack";
    enableSshIntegration = mkOption {
      default = true;
      type = types.bool;
      description = ''
        Enable integration with ssh config
      '';
    };
  };
  config = mkIf cfg.enable {
    home.packages = [ orbstackPkg ];

    programs.ssh.includes = mkIf cfg.enableSshIntegration ["~/.orbstack/ssh/config"];
  };
}
