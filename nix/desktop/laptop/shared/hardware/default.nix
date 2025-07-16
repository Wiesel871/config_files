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
    nvidia = {
      open = true;

      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };

      nvidiaSettings = true;

      package = pkgs.linuxPackages.nvidiaPackages.beta;

      prime = {
        /*
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        sync.enable = true;
        */
        reverseSync.enable = true;

        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };
    };
  };
}
