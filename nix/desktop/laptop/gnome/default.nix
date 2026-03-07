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
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = false;
    desktopManager.gnome.enable = true;
  };
  environment = {
    systemPackages = with pkgs; [
      rose-pine-gtk-theme
      sassc
      gtk-engine-murrine
      gnome-tweaks
      gnomeExtensions.zen
      gnomeExtensions.binu
      gnomeExtensions.extension-list
      gnomeExtensions.user-themes

      gnome-themes-extra
    ];
  };
  programs = {
    dconf = {
      enable = true;
    };
  };
}
