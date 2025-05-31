# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

/*
  fileSystems."/mnt/games" = {
	  device = "/dev/disk/by-label/KINGSTON";
	  fsType = "exfat";
	  options = [ "rwx" "uid=1000" "gid=100" "fmask=0111" "dmask=0000" ];
  };
*/

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

  #/*
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  #*/

  hardware.opengl = {
    enable = true;
  };

#/*
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    modesetting.enable = true;

    powerManagement.enable = false;

    powerManagement.finegrained = false;

    open = true;
    ##enable = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.beta;

    prime = {
    	sync.enable = true;

    	nvidiaBusId = "PCI:1:0:0";
    	intelBusId = "PCI:0:2:0";
    };
  };
  #*/


  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  environment.pathsToLink = [ "/libexec" ];
  /*
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };
   
    displayManager = {
  # Load nvidia driver for Xorg and Wayland
        defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        #i3blocks #if you are planning on using i3blocks over i3status
     ];
    };
  };
  #*/

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.wiesel = {
    isNormalUser = true;
    description = "Filip Pavlovic";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = "${pkgs.zsh}/bin/zsh";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [     
    firefox
  	gimp
  	xclip
  	lshw
  	feh
  	docker
  	docker-compose
  	arandr
  	alacritty
	inetutils

	doxygen
	parsec-bin
	#inputs.parsecgaming.packages.x86_64-linux.parsecgaming
	libffi
	libxkbcommon
	gdb
	rust-analyzer
	rustup
	cargo

	discord

	python3Full
	python3Packages.pip

	spotify
  	gparted
	deja-dup
  	#unstable.gcc14
	#unstable.clang_19
	#unstable.llvmPackages_19.clang-tools
	wget
	cmake
	gnumake
	valgrind

	unzip
	zip
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.steam = {
	enable = true;
	remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
	dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
	#localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
