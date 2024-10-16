local M = {}

M.treesitter = {
	ensure_installed = {
		"bash",
		"c",
		"cpp",
		"css",
		"dockerfile",
		"erlang",
		"go",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"rust",
		"svelte",
		"typescript",
		"tsx",
		"vim",
		"vimdoc",
		"yaml",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- C/C++
		"clangd",
		"clang-format",
		"codelldb",

		-- Python
		"black",
		"debugpy",
		"mypy",
		"ruff",
		"pyright",

		-- Lua
		"lua-language-server",
		"stylua",

		-- Bash
		"beautysh",
		"shellcheck",
		"bash-language-server",

		-- go
		"gopls",
		"gofumpt",
		"goimports-reviser",
		"golines",

		-- Rust
		"rust-analyzer",

		-- Next/Svelte
		"prettierd",
		"svelte-language-server",
		"tailwindcss-language-server",
		"typescript-language-server",
		"eslint-lsp",
		"cssls",

		-- Erlang
		-- "erlang-ls",
	},
}

M.nvimtree = {
	-- update_focused_file = {
	-- 	enable = true,
	-- 	update_root = true,
	-- },

	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

return M
