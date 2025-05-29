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

  wsl = {
    enable = true;
    defaultUser = "nixos";
    useWindowsDriver = true;
  };

  system.stateVersion = "25.05";

  environment.systemPackages = with pkgs; [
    inputs.self.packages.x86_64-linux.default

    pkgs.cargo
    pkgs.rustc
  ];
  nixpkgs.config.allowUnfree = true;

  programs = {
    vim.enable = true;
    git.enable = true;
    steam.enable = true;
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
