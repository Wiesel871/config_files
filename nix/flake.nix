{
  description = "System";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
    #nvf.url = "github:wiesel871/nvf_glsl";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nvf,
      home-manager,
    nixos-wsl,
      ...
    }@inputs:
    let
      mkSystem =
        args:
        import ./module-template.nix (
          {
            inherit inputs;
            inherit nixpkgs;
          }
          // args
        );

      mkDesktop = args: mkSystem ({ user = "wiesel"; } // args);
      mkWsl = args: mkSystem ({ user = "nixos"; } // args);
    in
    {
      packages."x86_64-linux".default =
        (nvf.lib.neovimConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [ ./nvf/default.nix ];
        }).neovim;

      nixosConfigurations = {
        laptop-gnome = mkDesktop { configModule = ./desktop/laptop/gnome; };
        laptop-i3 = mkDesktop { configModule = ./desktop/laptop/i3; };
        laptop-xmonad = mkDesktop { configModule = ./desktop/laptop/xmonad; };
        laptop-xfce = mkDesktop { configModule = ./desktop/laptop/xfce; };

        vm-kde = mkDesktop { configModule = ./desktop/vm/kde.nix; };

        default = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./default/configuration.nix ];
        };

        wsl = mkWsl { configModule = ./wsl; extraModules = [  nixos-wsl.nixosModules.default ]; };
      };
    };
}
