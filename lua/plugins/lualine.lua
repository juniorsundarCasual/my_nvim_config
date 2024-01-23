return {
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

        local theme = require("kanagawa.colors").setup().theme

        local kanagawa = {}

        kanagawa.normal = {
            a = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
            b = { bg = theme.diff.change, fg = theme.syn.fun },
            c = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
        }

        kanagawa.insert = {
            a = { bg = theme.diag.ok, fg = theme.ui.bg },
            b = { bg = theme.ui.bg, fg = theme.diag.ok },
        }

        kanagawa.command = {
            a = { bg = theme.syn.operator, fg = theme.ui.bg },
            b = { bg = theme.ui.bg, fg = theme.syn.operator },
        }

        kanagawa.visual = {
            a = { bg = theme.syn.keyword, fg = theme.ui.bg },
            b = { bg = theme.ui.bg, fg = theme.syn.keyword },
        }

        kanagawa.replace = {
            a = { bg = theme.syn.constant, fg = theme.ui.bg },
            b = { bg = theme.ui.bg, fg = theme.syn.constant },
        }

        kanagawa.inactive = {
            a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            b = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, gui = "bold" },
            c = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        }

        if vim.g.kanagawa_lualine_bold then
            for _, mode in pairs(kanagawa) do
                mode.a.gui = "bold"
            end
        end


        -- configure Lualine with modified theme
        lualine.setup({
            options = {
                icons_enabled = true,
                -- theme = "palenight",
                -- theme = "catppuccin",
                theme = "kanagawa",
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
                lualine_c = { "filename" },
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
}
