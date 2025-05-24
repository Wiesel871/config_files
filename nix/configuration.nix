{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  system.stateVersion = "25.05";

  environment.systemPackages = with pkgs; [
    inputs.self.packages.x86_64-linux.default
  ];
}
