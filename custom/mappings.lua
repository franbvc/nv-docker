local M = {}

M.general = {
	n = {
		-- split vertically (doom bindings)
		["<leader>wv"] = { "<cmd> vs <CR>", "Window split vertically" },

		-- close window (doom bindings)
		["<leader>wc"] = { "<cmd> q <CR>", "Close window" },

		-- buffer commands
		["<leader>b"] = { " ", "Buffer" },

		-- new buffer (doom bindings)
		["<leader>bb"] = { "<cmd> enew <CR>", "New buffer" },
		-- save buffer (doom bindings)
		["<leader>bs"] = { "<cmd> w <CR>", "Save buffer" },

		-- kill editor
		["<leader>k"] = { "<cmd> qa <CR>", "Kill editor" },

		-- Tmux
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
	},
}

M.nvimtree = {
	plugin = true,

	n = {
		-- toggle
		["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

		-- toggle (doom bindings)
		["<leader>op"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

		-- focus
		["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
	},
}

M.dap = {
	plugin = true,
	n = {
		["<leader>d"] = { " ", "Debugger" },
		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle Breakpoint" },
		["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger" },
		["<leader>ds"] = { "<cmd> DapStepOver <CR>", "Step over the debugger" },
		["<leader>dk"] = { "<cmd> DapTerminate <CR>", "Kill the debugger" },
		["<leader>dus"] = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			"Open debugger sidebar",
		},
	},
}

M.dap_python = {
	plugin = true,
	n = {
		["<leader>dp"] = { " ", "Debugger Python" },
		["<leader>dpr"] = {
			function()
				require("dap-python").test_method()
			end,
			"Run Python Debugger",
		},
	},
}

M.dap_go = {
	plugin = true,
	n = {
		["<leader>dgt"] = {
			function()
				require("dap-go").debug_test()
			end,
			"Debug go test",
		},
		["<leader>dgl"] = {
			function()
				require("dap-go").debug_last()
			end,
			"Debug last go test",
		},
	},
}

M.tabufline = {
	plugin = true,
	n = {
		-- close buffer + hide terminal buffer (doom bindings)
		["<leader>bk"] = {
			function()
				require("nvchad.tabufline").close_buffer()
			end,
			"Kill buffer",
		},
	},
}

M.copilot = {
	plugin = true,
	i = {
		["<C-l>"] = {
			'copilot#Accept("\\<CR>")',
			"Accept copilot suggestion",
			opts = {
				expr = true,
				silent = true,
				replace_keycodes = false,
			},
		},

		["<C-w>"] = {
			function()
				local suggestion = vim.fn["copilot#Accept"]("")
				local bar = vim.fn["copilot#TextQueuedForInsertion"]()
				return vim.fn.split(bar, [[[ .]\zs]])[1]
			end,
			"Accept one word from copilot suggestion",
			opts = {
				expr = true,
				silent = true,
				replace_keycodes = false,
			},
		},
	},
	n = {
		-- Show panel window
		["<leader>cp"] = { "<cmd> Copilot panel <CR>", "Show copilot panel" },
	},
}

return M
