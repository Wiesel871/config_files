{pkgs, ...}: {
  imports = [
    ./environment.nix
    ./programs.nix
  ];
  system.stateVersion = "25.11";

  users.defaultUserShell = pkgs.zsh;


  nix = {
    package = pkgs.nixVersions.latest;
    settings.experimental-features = ["nix-command" "flakes"];
  };
}
