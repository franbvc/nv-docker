local overrides = require("custom.configs.overrides")

local plugins = {
	--- debugger ---
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function(_, opts)
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			require("dap-go").setup(opts)
			require("core.utils").load_mappings("dap_go")
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = { "python" },
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
			require("core.utils").load_mappings("dap_python")
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},

	--- LSP ---
	{
		"nvimtools/none-ls.nvim",
		ft = {
			"python",
			"c",
			"cpp",
			"h",
			"lua",
			"sh",
			"go",
			"rs",
			"erl",
			"svelte",
			"typescriptreact",
			"tsx",
			"ts",
			"js",
			"jsx",
			"html",
			"css",
		},
		opts = function()
			return require("custom.configs.null-ls")
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	--- Overrides ---
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	--- Copilot ---
	{
		"github/copilot.vim",
		-- lazy = false -- Loads on startup
		lazy = false, -- Loads on demand
		config = function(_, opts)
			require("core.utils").load_mappings("copilot")
		end,
	},

	--- Tmux ---
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	--- CMake ---
	{
		"Civitasv/cmake-tools.nvim",
		event = "VeryLazy",
		dependencies = "nvim-lua/plenary.nvim",
	},

	--- Self Closing tags ---
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	-- Context --
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		config = function()
			require("treesitter-context").setup()
			return { mode = "cursor", max_lines = 3 }
		end,
	},
}

return plugins
