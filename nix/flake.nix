{
  description = "System";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    packages."x86_64-linux".default =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [./nvf-configuration.nix];
      }).neovim;

    nixosConfigurations = {
      laptop = mkSystem {
        configModule = ./laptop.nix;
        user = "wiesel";
      };
      wsl = mkSystem {
        configModule = ./wsl.nix;
        user = "nixos";
      };
    };
  };
}
