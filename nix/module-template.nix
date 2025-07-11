{
  inputs,
  system ? "x86_64-linux",
  extraModules ? [],
  ...
}: {
  configModule,
  user ? "",
  inExtraModules ? [],
}:
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {inherit inputs user;};
  modules =
    [
      configModule
      ./shared.nix
      inputs.nvf.nixosModules.default
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${user} = ./home.nix;
        };

        # Optionally, use home-manager.extraSpecialArgs to pass
        # arguments to home.nix
      }
    ]
    ++ extraModules ++ inExtraModules;
}
