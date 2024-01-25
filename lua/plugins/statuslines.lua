return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local status, bufferline = pcall(require, "bufferline")
			if not status then
				return
			end

			-- local mocha = require("catppuccin.palettes").get_palette("mocha")
			bufferline.setup({
				options = {
					hover = {
						enabled = true,
						delay = 200,
						reveal = { "close" },
					},
					separator_style = "thick",
				},
				-- highlights = require("catppuccin.groups.integrations.bufferline").get({
				-- 	styles = { "italic", "bold" },
				-- 	custom = {
				-- 		all = {
				-- 			fill = { bg = "#000000" },
				-- 		},
				-- 		mocha = {
				-- 			background = { fg = mocha.text },
				-- 		},
				-- 		latte = {
				-- 			background = { fg = "#000000" },
				-- 		},
				-- 	},
				-- }),
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local status, lualine = pcall(require, "lualine")
			if not status then
				return
			end

			local status, prose = pcall(require, "nvim-prose")
			if not status then
				return
			end

			-- configure Lualine with modified theme
			lualine.setup({
				options = {
					icons_enabled = true,
					-- theme = "catppuccin",
					theme = "tokyonight",
					component_separators = { left = "|", right = "|" },
					section_separators = { left = "", right = "" },
					-- component_separators = { left = "", right = "" },
					-- section_separators = { left = "", right = "" },
					disabled_filetypes = {
						"neo-tree",
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { { "filename", path = 2 } },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress", "location" },
					lualine_z = { "filesize" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {
					lualine_z = { { prose.word_count, cond = prose.is_available } },
				},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
}
