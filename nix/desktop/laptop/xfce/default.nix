{
  config,
  pkgs,
  inputs,
  lib,
  stdenv,
  ...
} @args : {
  imports = [
    ./..
  ];
  services = {
    services.xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
        };
      };
    };
    services.displayManager.defaultSession = "xfce";
  };
  environment.systemPackages = [
    (pkgs.callPackage /winxp.nix args)
  ];
  programs = {
    xfconf.enable = true;
  };
}
