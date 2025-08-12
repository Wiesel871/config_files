{pkgs, ...}: {
  enableFormat = true;
  enableTreesitter = true;

  nix.enable = true;
  rust.enable = true;
  lua.enable = true;
  clang.enable = true;
  haskell = {
    enable = true;
    lsp.enable = true;
    treesitter.enable = true;
    dap.enable = true;
  };
}
