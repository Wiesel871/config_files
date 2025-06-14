{
  pkgs,
  lib,
  ...
}: {
  vim = {
    theme = {
      enable = true;
      name = "rose-pine";
      style = "main";
    };

    statusline.lualine.enable = true;
    telescope.enable = true;

    languages = {
      enableFormat = true;
      enableTreesitter = true;

      nix.enable = true;
      rust.enable = true;
      lua.enable = true;
      haskell = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
        dap.enable = true;
      };
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

    diagnostics = {
      enable = true;
      config = {
        update_in_insert = true;
        #virtual_lines = true;

        nvim-lint = {
          enable = true;
        };
      };
    };

    #vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    #vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    #vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    #vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    #vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    #vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    #vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    #vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    #vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    #vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    lsp = {
      enable = true;
      mappings = {
        goToDeclaration = "<leader>gd";
        goToDefinition = "gd";
        codeAction = "<leader>vca";
        hover = "K";
        renameSymbol = "<leader>vrn";
        format = "<leader>ff";
        listReferences = "<leader>vrr";
        openDiagnosticFloat = "<leader>vd";
      };
    };
    #['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    #['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    #['<C-y>'] = cmp.mapping.confirm({ select = true }),
    #["<C-Space>"] = cmp.mapping.complete(), -- default
    autocomplete = {
      nvim-cmp = {
        mappings = {
          confirm = "<C-y>";
          next = "<C-n>";
          previous = "<C-p>";
        };
      };
    };

    formatter = {
    };
  };
}
