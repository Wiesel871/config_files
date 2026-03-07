{
  config,
  pkgs,
  inputs,
  lib,
  ...
} @args : {
  imports = [
    ./..
  ];
  services = {
    xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
        };
      };
    };
    displayManager.defaultSession = "xfce";
  };
  environment.systemPackages = [
    (pkgs.callPackage ./winxp.nix {})
  ];
  programs = {
    xfconf.enable = true;
  };
}
