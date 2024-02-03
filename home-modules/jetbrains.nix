{ config, pkgs-clion, ... }: {
  nixpkgs.config.jetbrains.vmopts = ''
    -Xms8g
    -Xmx8g
  '';
  home.packages = with pkgs-clion; [
    jetbrains.clion
  ];
}
