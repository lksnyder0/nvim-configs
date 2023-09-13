return {
	{
		"mcauley-penney/tidy.nvim",
		config = {
			filetype_exclude = { "markdown", "diff" }
		},
		init = function()
			vim.keymap.set('n', "<leader>te", require("tidy").toggle, {})
		end
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			-- local util = require("formatter.util")
			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.DEBUG,
				filetype = {
					go = {
						require("formatter.filetypes.go").gofmt
					},
					json = {
						require("formatter.filetypes.json").jq
					},
					lua = {
						require("formatter.filetypes.lua").stylus
					},
					python = {
						require("formatter.filetypes.python").black
					},
					terraform = {
						require("formatter.filetypes.terraform").terraformfmt
					},
					["*"] = {
						require("formatter.filetypes.any").remove_trailing_whitespace
					}
				}
			})
		end,
	}
}
