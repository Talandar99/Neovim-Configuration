require("lspsaga").setup({
	ui = {
		theme = "round", -- Currently, only the round theme exists
		title = true, -- This option only works in Neovim 0.9
		border = "rounded", -- Border type can be single, double, rounded, solid, shadow.
		winblend = 0,
		expand = "",
		collapse = "",
		preview = " ",
		code_action = "",
		diagnostic = "🐞",
		incoming = " ",
		outgoing = " ",
		colors = {
			normal_bg = "",
			title_bg = "#9ece6a",
			red = "#f7768e",
			magenta = "#bb9af7",
			orange = "#ff9e64",
			yellow = "#e0af68",
			green = "#9ece6a",
			cyan = "#2ac3de",
			blue = "#7aa2f7",
			purple = "#bb9af7",
			white = "#cfc9c2",
			black = "#414868",
			},
		kind = {},
	},
})
