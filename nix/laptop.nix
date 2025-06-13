{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./laptop.hardware.nix
    ./desktop.nix
  ];

  boot = {
    loader = {
      #systemd-boot.enable = true;
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

      package = pkgs.linuxPackages.nvidiaPackages.latest;

      prime = {
        sync.enable = true;

        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
      };
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

      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        config = builtins.readFile ./xmonad.hs;
      };
    };
    /*
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
    #
    */
    /*
        desktopManager.xterm.enable = false;
        displayManager.defaultSession = "none+i3";

        windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        ];
        };
    #
    */
  };
  environment = {
    systemPackages = with pkgs; [
      rose-pine-gtk-theme
      sassc
      gtk-engine-murrine
      gnome-tweaks
      gnomeExtensions.zen
      gnomeExtensions.binu
      gnomeExtensions.extension-list
      gnomeExtensions.user-themes

      gnome-themes-extra

      ghc
      cabal-install
      haskellPackages.stack
      haskellPackages.haskell-language-server
      haskellPackages.hoogle
      haskellPackages.ghcide
    ];
  };
  programs = {
    dconf = {
      enable = true;
    };
  };
}
