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

    #nvidia = import ./nvidia.nix;
    nvidia = {
      open = false;

      forceFullCompositionPipeline = true;

      modesetting.enable = true;

      powerManagement = {
        enable = false;
        finegrained = false;
      };

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.beta;

      prime = {
        offload = {
          enable = false;
          enableOffloadCmd = false;
        };
        reverseSync.enable = false;

        sync.enable = true;

        allowExternalGpu = true;

        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };
    };
  };
}
