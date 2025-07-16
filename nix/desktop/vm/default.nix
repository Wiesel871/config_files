{
  config,
  pkgs,
  user,
  ...
}: {
  imports = [
    ./hardware.nix
    ./..
  ];
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "/dev/sda";
        useOSProber = true;
      };
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
    };
  };

  services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = user;
      };
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      videoDrivers = ["nvidia"];
    };
  };
}
