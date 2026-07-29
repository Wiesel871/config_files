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

    strongswan = {
      enable = true;
      # Required for L2TP/IPsec to function with NetworkManager
      secrets = [ "ipsec.d/ipsec.nm-l2tp.secrets" ];
    };

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
