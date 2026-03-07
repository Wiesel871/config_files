{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [];

  boot = {
    initrd = {
      availableKernelModules = ["ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod"];
      kernelModules = [];
    };
    kernelModules = [];
    extraModulePackages = [];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/4ff14a01-dfeb-4b08-ba63-9bd9fe34fd4e";
    fsType = "ext4";
  };

  swapDevices = [];

  networking.useDHCP = true;

  nixpkgs.hostPlatform = "x86_64-linux";
  virtualisation.virtualbox.guest.enable = true;
}
