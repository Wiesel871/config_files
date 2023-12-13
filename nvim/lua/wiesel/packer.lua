vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
    use { "bluz71/vim-nightfly-colors", as = "nightfly" }
    use { 'AlexvZyl/nordic.nvim' }
    use { "ellisonleao/gruvbox.nvim" }
    require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
            strings = false,
            comments = true,
            operators = false,
            folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        inver_sign = false,
        invert_tabline = false,
        inver_indent_guides = false,
        inverse = false,
        contrast = "",
        paletter_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
    })
    use ({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	end})
    use{'jacoborus/tender.vim', as = 'tender' }
    use('github/copilot.vim')
    use('nvim-treesitter/nvim-treesitter', {run = 'TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('simrat39/rust-tools.nvim')
    use('hrsh7th/cmp-nvim-lsp-signature-help')
    use('hrsh7th/cmp-vsnip')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/vim-vsnip')
    use('tpope/vim-fugitive')
    use("arnamak/stay-centered.nvim")
    use({ "Pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup {
            execution_message = {
                message = function()
                    return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
                end,
                dim = 0.18,
                cleaning_interval = 10000,
            },
        }
    end,
})
use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
        {'neovim/nvim-lspconfig'},
        {
        'williamboman/mason.nvim',
        run = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },
    {'williamboman/mason-lspconfig.nvim'},

    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
}

}
end)
