{ config, lib, pkgs-clion, self, ... }:
with lib;
let
  customizeJetbrains = map (pkg:
    (pkg.override ({
      # increase memory
      vmopts = ''
        -server
        -Xms2048m
        -Xmx8192m
      '';
    })).overrideAttrs (attrs: attrs));
in {

  imports = [ ];
  environment = { systemPackages = with pkgs-clion; customizeJetbrains ([ (jetbrains.clion) ]); };

}