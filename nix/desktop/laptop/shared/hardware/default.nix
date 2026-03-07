{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
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
      open = false;

      forceFullCompositionPipeline = true;

      modesetting.enable = true;

      powerManagement = {
        enable = false;
        finegrained = false;
      };

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.production;

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
    /*
  specialisation = {
    external-display.configuration = {
      system.nixos.tags = [ "external-display" ];

      hardware.nvidia = {
        modesetting.enable = pkgs.lib.mkForce false;
        powerManagement.enable = pkgs.lib.mkForce false;

        prime = {
          nvidiaBusId = pkgs.lib.mkForce "PCI:9:0:0";
          offload.enable = pkgs.lib.mkForce false;
        };
      };

      services.xserver.config = pkgs.lib.mkOverride 0 ''
        Section "Module"
            Load           "modesetting"
        EndSection

        Section "Device"
            Identifier     "Device0"
            Driver         "nvidia"
            BusID          "9:0:0"
            Option         "AllowEmptyInitialConfiguration"
            Option         "AllowExternalGpus" "True"
        EndSection
      '';
    };
  };
    */
}
