{pkgs, ...} @ inputs: {
  statusline.lualine.enable = true;
  telescope.enable = true;

  languages = import ./languages.nix inputs;
  diagnostics = import ./diagnostics.nix inputs;
  lsp = import ./lsp.nix inputs;
  autocomplete = import ./autocomplete.nix inputs;

  formatter = {};

  theme = {
    enable = true;
    name = "rose-pine";
    style = "main";
  };

  startPlugins = with pkgs; [
    vimPlugins.harpoon
    vimPlugins.undotree
  ];

  additionalRuntimePaths = ["$HOME/config_files/nvim"];
  luaConfigRC = {
    myconfig =
      /*
      lua
      */
      ''
        require("wiesel")
        require("plugin")
      '';
  };
}
