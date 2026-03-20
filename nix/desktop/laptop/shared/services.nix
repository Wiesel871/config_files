{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services = {
    hardware.bolt.enable = true;

    flatpak.enable = true;
    pcscd.enable = true;

    dbus.packages = [ pkgs.gcr ];

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      videoDrivers = [
        "nvidia"
      ];
    };
  };
}
