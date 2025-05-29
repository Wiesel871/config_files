{ inputs, system ? "x86_64-linux", extraModules ? [] }:

{ configModule }:

inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit inputs; };
  modules = [
    configModule
    inputs.nvf.nixosModules.default
  ] ++ extraModules;
}
