{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./boot.nix
    ./filesystems.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  hardware = {
    cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;

    graphics.enable = true;

    nvidia = import ./nvidia.nix;
  };
}
