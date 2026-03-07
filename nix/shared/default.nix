{pkgs, ...}: {

  imports = [
    ./environment.nix
    ./programs.nix
  ];
  system.stateVersion = "25.11";

  users.defaultUserShell = pkgs.zsh;

  virtualisation.docker = {
    enable = true;
    # Set up resource limits
    daemon.settings = {
      experimental = true;
      default-address-pools = [
        {
          base = "172.30.0.0/16";
          size = 24;
        }
      ];
    };
  };

  nix = {
    package = pkgs.nixVersions.latest;
    settings.experimental-features = ["nix-command" "flakes"];
  };
}
