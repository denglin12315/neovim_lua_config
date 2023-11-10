local packer = require("packer")
packer.startup(
function(use)
	-- Packer可以管理自己本身
	use 'wbthomason/packer.nvim'

	-- 主题插件
	use 'tanvirtin/nvim-monokai'

	-- 侧边栏文件浏览器
	use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })

	-- 标签栏
	use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})

	-- 状态栏
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use("arkav/lualine-lsp-progress")

	-- telescope & telescope extension
	use({ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" }})
	use "LinArcX/telescope-env.nvim"

	-- dashboard
	use({ 'nvimdev/dashboard-nvim', requires = {'nvim-tree/nvim-web-devicons'}})
	use("ahmedkhalf/project.nvim")

	-- LSP-server
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	-- LSP-client
	use({ "neovim/nvim-lspconfig" })

	-- 补全引擎
	use("hrsh7th/nvim-cmp")
	-- Snippet 引擎
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	-- 补全源
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	use("hrsh7th/cmp-path") -- { name = 'path' }
	use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
	use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }

	-- Lua 增强
	use("folke/neodev.nvim")
	-- JSON 增强
	use("b0o/schemastore.nvim")
	-- Rust 增强
	use("simrat39/rust-tools.nvim")
end)

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)

require("plugin.config.nvim-tree")
require("plugin.config.bufferline")
require("plugin.config.lualine")
require("plugin.config.telescope")
require("plugin.config.dashboard")
require("plugin.config.project")


