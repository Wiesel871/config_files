{}:
{
      open = false;

      forceFullCompositionPipeline = true;

      modesetting.enable = true;

      powerManagement = {
        enable = false;
        finegrained = false;
      };

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.latest;

      prime = {

        offload = {
          enable = false;
          enableOffloadCmd = false;
        };
        reverseSync.enable = false;

        sync.enable = true;

        allowExternalGpu = true;

        nvidiaBusId = "PCI:6:0:0";
        intelBusId = "PCI:0:2:0";
      };
}
