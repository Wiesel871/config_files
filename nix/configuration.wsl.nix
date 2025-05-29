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

  environment.systemPackages = with pkgs; [
    cargo
    rustc
    rustfmt
  ];

  programs = {
  };
}
