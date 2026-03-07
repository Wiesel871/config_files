{ pkgs, ... }:
{
  enableFormat = true;
  enableTreesitter = true;

  nix.enable = true;
  /*
    rust = {
      enable = true;
      lsp.opts = ''
        ['rust-analyzer'] = {
            cargo = {allFeature = true},
            check = {
                command = "clippy",
                extraArgs = { "--", "-W", "clippy::pedantic", "-W", "clippy::nursery" },
            },
          },
      '';
    };
  */
  clang = {
    enable = true;
    lsp = {
      enable = true;
      servers = [ "clangd" ];
    };
  };

  java.enable = true;

  haskell = {
    enable = true;
    lsp.enable = true;
    treesitter.enable = true;
    dap.enable = false;
  };
}
