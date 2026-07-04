return {
	"Diogo-ss/42-header.nvim",
	cmd = { "Stdheader" },
	keys = { "<F1>" },
	opts = {
		default_map = false,
		auto_update = true,
		user = "norivier",
		mail = "norivier@student.42.fr",
	},
	config = function(_, opts)
		require("42header").setup(opts)
	end,
}
