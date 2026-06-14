vim.pack.add({
	{
		src = "https://github.com/nvim-lua/plenary.nvim",
	},
	{
		src = "https://github.com/nvim-telescope/telescope.nvim",
	},
	{
		src = "https://github.com/ThePrimeagen/harpoon",
		version = "harpoon2",
		name = "harpoon",
	},
})

local harpoon = require("harpoon")
harpoon:setup()

-- Telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

local make_finder = function()
	local paths = {}
	for _, item in ipairs(harpoon:list()) do
		table.insert(paths, item.value)
	end

	return require("telescope.finders").new_table({
		results = paths,
	})
end

require("telescope.pickers").new({}, {
	prompt_title = "Harpoon",
	finder = make_finder(),
	previewer = conf.file_previewer({}),
	sorter = conf.generic_sorter({}),
	attach_mappings = function(prompt_buffer_number, map)
		map("i", "<C-d>", function()
			local state = require("telescope.actions.state")
			local selected_entry = state.get_selected_entry()
			local current_picker = state.get_current_picker(prompt_buffer_number)

			harpoon:list():removeAt(selected_entry.index)
			current_picker:refresh(make_finder())
		end)

		return true
	end,
})

-- Keybinds
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open Harpoon window" })

vim.keymap.set("n", "<C-a>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-s>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-d>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-f>", function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end)
