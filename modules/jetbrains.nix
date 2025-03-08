{ lib, pkgs-jetbrains, ... }:
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
  environment = { systemPackages = with pkgs-jetbrains; customizeJetbrains ([ (jetbrains.rust-rover) ]); };

}