return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
	config = function()
		local status, bufferline = pcall(require, "bufferline")
		if not status then
			return
		end

		local mocha = require("catppuccin.palettes").get_palette("mocha")
		bufferline.setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get({
				styles = { "italic", "bold" },
				custom = {
					all = {
						fill = { bg = "#000000" },
					},
					mocha = {
						background = { fg = mocha.text },
					},
					latte = {
						background = { fg = "#000000" },
					},
				},
			}),
		})
	end,
}
