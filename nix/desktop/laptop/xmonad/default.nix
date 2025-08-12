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

        config = "
Section \"Module\"
    Load \"modesetting\"
EndSection

Section \"Device\"
    Identifier \"Device0\"
    Driver     \"nvidia\"
    BusID      \"PCI:06:0:0\"
    Option     \"AllowEmptyInitialConfiguration\"
    Option     \"AllowExternalGpus\" \"True\"
EndSection
";
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
