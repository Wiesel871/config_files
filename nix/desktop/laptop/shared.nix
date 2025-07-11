{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware.nix
    ../desktop.nix
  ];

  boot = {
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
    supportedFilesystems = ["ntfs"];
  };
  networking = {
    firewall = {
      allowPing = true;
      allowedTCPPortRanges = [
        {
          from = 8000;
          to = 9000;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 8000;
          to = 9000;
        }
      ];
    };
  };
  hardware = {
    graphics.enable = true;
    nvidia = {
      open = true;

      modesetting.enable = true;
      powerManagement = {
        enable = false;
        finegrained = false;
      };

      nvidiaSettings = true;

      package = pkgs.linuxPackages.nvidiaPackages.beta;

      /*
      prime = {
        sync.enable = true;

        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };
      */
    };
  };

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      videoDrivers = ["nvidia"];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      ghc
      cabal-install
      haskellPackages.stack
      haskellPackages.haskell-language-server
      haskellPackages.hoogle
      haskellPackages.ghcide
    ];
  };

  programs = {
    tuxclocker = {
      enable = true;
      useUnfree = true;
      enabledNVIDIADevices = [0];
    };
  };
}
