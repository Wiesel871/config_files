{ inputs, system ? "x86_64-linux", extraModules ? [], user ? "", home-manager }:

{ configModule }:

inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit inputs; };
  modules = [
    configModule
    ./configuration.shared.nix
    inputs.nvf.nixosModules.default
    home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${user} = ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
  ] ++ extraModules;
}
