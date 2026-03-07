{
  inputs,
  extraModules ? [ ],
  configModule,
  user,
  nixpkgs,
  ...
}: let pkgs = nixpkgs; in
inputs.nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = { inherit inputs user; };
  modules = [
    ./shared
    configModule
    inputs.nvf.nixosModules.default

    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.${user} = ./home.nix;
      };
    }
  ]
  ++ extraModules;
}
