{
  pkgs,
  config,
  modulesPath,
  ...
}: {
  boot = {
    initrd = {
      availableKernelModules = ["xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod"];
      kernelModules = [];
    };
    kernelModules = [
      "kvm-intel"
      "thunderbolt"
      "usbhid"
      "joydev"
      "xpad"
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
            #"pci_hotplug"
    ];
    blacklistedKernelModules = ["nova_core" "nouveau"];

    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = ["pci=realloc"];
    extraModulePackages = [

    ];

    supportedFilesystems = ["ntfs"];

    loader = {
      systemd-boot.enable = true;

      efi.canTouchEfiVariables = true;
                        /*
      grub = {
        enable = true;

        configurationLimit = 5;
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
                        */
      timeout = 15;
    };
  };
}
