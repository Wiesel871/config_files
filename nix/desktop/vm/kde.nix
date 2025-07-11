{
  config,
  pkgs,
  inputs,
  user,
  ...
}: {
  imports = [
    ./shared.nix
  ];
  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
  environment = {
    systemPackages = with pkgs; [
      kdePackages.kate
      kdePackages.kscreen
      parsec-bin
    ];
  };
}
