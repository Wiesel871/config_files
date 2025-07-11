{
  config,
  pkgs,
  inputs,
  user,
  ...
}: {
  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };
  };

  time.timeZone = "Europe/Bratislava";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
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
  };

  services = {
    printing.enable = true;

    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  security.rtkit.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    description = "Filip Pavlovic";
    extraGroups = ["networkmanager" "wheel"];
  };

  environment = {
    pathsToLink = ["/libexec"];
    systemPackages = with pkgs; [
      alacritty
      arandr
      cmake
      deja-dup
      discord
      feh
      firefox
      gimp
      gnumake
      lshw
      parsec-bin
      spotify
      unzip
      wget
      xclip
      zip
    ];
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
}
