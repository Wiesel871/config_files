{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  system.stateVersion = "25.05";

  environment.systemPackages = with pkgs; [
    inputs.self.packages.x86_64-linux.default
  ];

  programs = {
    vim.enable = true;
    git.enable = true;
    zsh = {
      enable = true;
      #ohMyZsh = {
      #    enable = true;
      #    plugins = ["git"]
      #};
    };
  };
  users.defaultUserShell = pkgs.zsh;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = ["nix-command" "flakes"];
  };
}
