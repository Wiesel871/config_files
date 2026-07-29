{ pkgs, ... }@inputs:
{
  statusline.lualine.enable = true;
  telescope.enable = true;
  comments.comment-nvim.enable = true;

  languages = import ./languages.nix inputs;
  diagnostics = import ./diagnostics.nix inputs;
  lsp = import ./lsp.nix inputs;
  autocomplete = import ./autocomplete.nix inputs;

  formatter = { };

  theme = {
    enable = true;
    /*
      name = "rose-pine";
      style = "main";
    */
    name = "gruvbox";
    style = "dark";
  };

  startPlugins = with pkgs.vimPlugins; [
    harpoon
    undotree
    #vim-glsl
    #nvim-treesitter-parsers.glsl
    #nvim-lspconfig
  ];

  additionalRuntimePaths = [ "$HOME/config_files/nvim" ];
  luaConfigRC = {
    myconfig = /* lua */ ''
      require("wiesel")
      require("plugin")
    '';
    #vim.lsp.enable('glsl_analyzer')
  };
}
