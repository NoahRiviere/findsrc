return {
    {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
	lazy = false,
	init = function()
		local parsers = {
			"lua",
			"vim",
			"vimdoc",
			"markdown",
			"query",
			"gitignore",
			"json",
			"yaml",
			"toml",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"rust",
			"c",
			"cpp",
			"java",
			"python",
		}

		require("nvim-treesitter.config").setup({
			ensure_installed = parsers,
			highlight = { enable = true },
		})

		local group = vim.api.nvim_create_augroup("gudahTreesitter", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
			group = group,
			callback = function()
				if vim.bo.buftype ~= "" then
					return
				end

				pcall(vim.treesitter.start, 0)
			end,
		})
	end,
    },
    {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = false,
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
				},
			},
		})
	end,
    },
}
