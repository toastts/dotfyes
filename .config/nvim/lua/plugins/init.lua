return {
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator",

	{ "j-hui/fidget.nvim", branch = "main", opts = {}, },

	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  { 'numToStr/Comment.nvim', opts = {}},

	{ "norcalli/nvim-colorizer.lua", opts = {}},
	{ "kylechui/nvim-surround", opts = {}, version = "*", event = "VeryLazy" },
}
