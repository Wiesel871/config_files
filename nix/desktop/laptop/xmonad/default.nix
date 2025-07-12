{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./..
  ];
  services = {
    xserver = {
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        #config = ./xmonad.hs;
      };
    };

    dbus.enable = true;
    udisks2.enable = true;
  };
  security.polkit.enable = true;

  environment = {
    systemPackages = with pkgs; [
      dmenu
      gmrun
      udiskie
      flameshot
      picom
    ];
  };
}
