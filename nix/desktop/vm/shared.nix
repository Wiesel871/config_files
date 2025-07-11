{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
	../destop.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

	services = {
displayManager.autoLogin.enable = true;
displayManager.autoLogin.user = "wiesel";
};

}
