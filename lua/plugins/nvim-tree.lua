return {
	"nvim-tree/nvim-tree.lua",

	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>")

		require("nvim-tree").setup({
			view = {
				adaptive_size = true,
			},
		})
	end,
}
