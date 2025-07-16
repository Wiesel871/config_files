{
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      ghc
      cabal-install
      haskellPackages.stack
      haskellPackages.haskell-language-server
      haskellPackages.hoogle
      haskellPackages.ghcide
    ];
  };
}
