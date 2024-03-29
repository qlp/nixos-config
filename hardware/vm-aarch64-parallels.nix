# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "usbhid" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  swapDevices = [ ];

  hardware.parallels = {
    enable = true;
    package = with pkgs; (config.boot.kernelPackages.prl-tools.overrideAttrs (old:
      let
        version = "19.0.0-54570";
        src = fetchurl {
          url = "https://download.parallels.com/desktop/v${lib.versions.major version}/${version}/ParallelsDesktop-${version}.dmg";
          sha256 = "sha256-y7UC+E5i2cxkOJ9nVI6aQAFJ5kTXv9uaZoMO4/SCS6k=";
        };
        patches = lib.optionals (lib.versionAtLeast config.boot.kernelPackages.kernel.version "6.0") [
          # ./prl-tools-6.0.patch
        ];
      in
      { inherit version src patches; }
    ));
  };
}
