require("neo-tree").setup({
	window = {
		position = "left",
		width = 25,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
	},
	file_size = {
		enabled = true,
		required_width = 10, -- min width of window required to show this column
	},
	type = {
		enabled = true,
		required_width = 122, -- min width of window required to show this column
	},
	last_modified = {
		enabled = true,
		required_width = 88, -- min width of window required to show this column
	},
	created = {
		enabled = true,
		required_width = 110, -- min width of window required to show this column
	},
	symlink_target = {
		enabled = false,
	},
})

vim.keymap.set("n", "<Leader>e", ":Neotree toggle<cr>")
