{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  system.stateVersion = "25.11";

  environment.systemPackages = with pkgs; [
    inputs.self.packages.x86_64-linux.default

    gcc
    cmake
    gnumake
  ];

  programs = {
    vim.enable = true;
    git = {
      enable = true;
    };
    zsh = {
      enable = true;
      #ohMyZsh = {
      #    enable = true;
      #    plugins = ["git"]
      #};
    };
    tmux = {
      enable = true;
    };
  };

  users.defaultUserShell = pkgs.zsh;

  nix = {
    package = pkgs.nixVersions.latest;
    settings.experimental-features = ["nix-command" "flakes"];
  };
}
