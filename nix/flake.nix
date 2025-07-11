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
    mkSystemUser = user:  configModule: mkSystem { user = user; configModule = configModule; };
    mkLaptop = mkSystemUser "wiesel";
    mkWsl = mkSystemUser "nixos";
  in {
    packages."x86_64-linux".default =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [./nvf/conf.nix];
      }).neovim;

    nixosConfigurations = {
      laptop-gnome = mkLaptop ./desktop/laptop/gnome.nix;
      laptop-i3 = mkLaptop ./desktop/laptop/i3.nix;
      laptop-xmonad = mkLaptop ./desktop/laptop/xmonad.nix;
	vm-kde = mkLaptop ./desktop/vm/kde.nix;

      wsl = mkWsl ./wsl.nix;
    };
  };
}
