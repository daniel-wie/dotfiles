vim.pack.add({
	{
		src = "https://github.com/kyzabuilds/vocal.nvim",
	},
	{
		src = "https://github.com/nvim-lua/plenary.nvim",
	},
})

require("vocal").setup({
	-- API key (string, table with command, or nil to use OPENAI_API_KEY env var)
	api_key = nil,

	-- Directory to save recordings
	recording_dir = os.getenv("HOME") .. "/recordings",

	-- Delete recordings after transcription
	delete_recordings = true,

	-- Keybinding to trigger :Vocal (set to nil to disable)
	keymap = "<leader>v",

	-- Local model configuration (set this to use local model instead of API)
	local_model = {
		model = "small.en", -- Model size: tiny, base, small, medium, large
		path = "~/.local/whisper", -- Path to download and store models
	},

	-- API configuration (used only when local_model is not set)
	api = {
		model = "whisper-1",
		language = nil, -- Auto-detect language
		response_format = "json",
		temperature = 0,
		timeout = 60,
	},
})
