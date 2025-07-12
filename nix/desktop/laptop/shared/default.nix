{...}: {
  imports = [
    ./hardware
    ./networking.nix
    ./services.nix
    ./environment.nix
    ./programs.nix
  ];
}
