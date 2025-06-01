{
  description = "System";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-unstable.url = "github:nix-community/home-manager";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    ...
  } @ inputs: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    mkSystem = import ./module-template.nix {inherit inputs;};
  in {
    packages."x86_64-linux".default = nixpkgs.legacyPackages."x86_64-linux".hello;
      #(nvf.lib.neovimConfiguration {
      #  pkgs = nixpkgs.legacyPackages."x86_64-linux";
      #  modules = [./nvf-configuration.nix];
      #}).neovim;

    nixosConfigurations = {
      desktop = mkSystem {configModule = ./configuration.desktop.nix;};
      wsl = mkSystem {configModule = ./configuration.wsl.nix;};
    };
  };
}
