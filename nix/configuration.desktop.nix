# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Bratislava";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sk_SK.UTF-8";
    LC_IDENTIFICATION = "sk_SK.UTF-8";
    LC_MEASUREMENT = "sk_SK.UTF-8";
    LC_MONETARY = "sk_SK.UTF-8";
    LC_NAME = "sk_SK.UTF-8";
    LC_NUMERIC = "sk_SK.UTF-8";
    LC_PAPER = "sk_SK.UTF-8";
    LC_TELEPHONE = "sk_SK.UTF-8";
    LC_TIME = "sk_SK.UTF-8";
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

          package = config.boot.kernelPackages.nvidiaPackages.beta;

          prime = {
              sync.enable = true;

              nvidiaBusId = "PCI:1:0:0";
              intelBusId = "PCI:0:2:0";
          };
      };
  };


# Configure keymap in X11
  services = {
      xserver = {
          enable = true;
          xkb = {
              layout = "us";
              variant = "";

          };
          videoDrivers = ["nvidia"];
          displayManager.gdm.enable = true;
          desktopManager.gnome.enable = true;
      };
      /*
         desktopManager.xterm.enable = false;
         displayManager.defaultSession = "none+i3";

         windowManager.i3 = {
         enable = true;
         extraPackages = with pkgs; [
         dmenu #application launcher most people use
         i3status # gives you the default i3 status bar
         i3lock #default i3 screen locker
         ];
         };
       */
      # Enable CUPS to print documents.
      printing.enable = true;

      pulseaudio.enable = false;
      pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
            # If you want to use JACK applications, uncomment this
            # jack.enable = true;

            # use the example session manager (no others are packaged yet so this is enabled by default,
            # no need to redefine it in your config for now)
            # media-session.enable = true;
      };

  };

  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.wiesel = {
    isNormalUser = true;
    description = "Filip Pavlovic";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
      pathsToLink = [ "/libexec" ];
      systemPackages = with pkgs; [     
          gnome-tweaks
          #gnomeExtensions.zen
          gnomeExtensions.binu
          #gnomeExtensions.extension-list

          gnome-themes-extra

          firefox

          gimp

          xclip
          lshw
          feh

          arandr
          alacritty

          parsec-bin

          discord

          spotify
          deja-dup
          wget

          cmake
          gnumake
          valgrind

          unzip
          zip
      ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs = {
      neovim = {
          enable = true;
          defaultEditor = true;
      };
      steam = {
          enable = true;
          remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
          dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      };
      dconf = {
          enable = true;
      };
  };
  home-manager.users."wiesel" = import ./home.nix;
}
