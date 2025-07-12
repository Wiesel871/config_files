{
  pkgs,
  modulesPath,
  ...
}: {
  boot = {
    initrd = {
      availableKernelModules = ["xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod"];
      kernelModules = [];
    };
    kernelModules = ["kvm-intel"];
    kernelPackages = pkgs.linuxPackages;
    extraModulePackages = [];
    supportedFilesystems = ["ntfs"];

    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        device = "nodev";
        theme = builtins.fetchTarball {
          url = "https://github.com/YouStones/ultrakill-grub-theme/archive/main.tar.gz";
          sha256 = "0r7qw7a972f66a9rm61wrmzfm43m3xxbx5gp8ay57my7dvb2w11y";
        };
        extraEntries = ''
          menuentry "Reboot" {
              reboot
          }
          menuentry "Poweroff" {
              halt
          }
          menuentry "Enter UEFI Firmware Settings" {
              fwsetup
          }
        '';
      };
      timeout = 15;
    };
  };
}
