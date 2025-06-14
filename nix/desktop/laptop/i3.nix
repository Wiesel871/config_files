{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./shared.nix
  ];
  services = {
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
  };
}
