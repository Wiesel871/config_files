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
    xserver = {
      windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        #config = ./xmonad.hs;
      };
    };
  };
  environment = {
    systemPackages = with pkgs; [
      dmenu
      gmrun
      udiskie
    ];
  };
}
