{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      pkgs.cargo
      pkgs.rustc
    ];
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    steam.enable = true;
  };
}
