local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd
local g = vim.g

-------------------------------------- options ------------------------------------------
-- set relative line number
opt.relativenumber = true

-- Update cwd when entering a buffer
-- autocmd("BufEnter", {
-- 	pattern = "*",
-- 	command = "silent! lcd %:p:h",
-- })

-- Update cwd when nvim is entered
autocmd("VimEnter", {
	desc = "Update working directory when starting",
	pattern = "*",
	command = "silent! lcd %:p:h",
})

-- Change tab width for .sh files
-- autocmd("BufEnter", {
-- 	pattern = "*.sh",
-- 	command = "set tabstop=4 | set softtabstop=0 noexpandtab | set shiftwidth=4",
-- })

-- Set copilot to not use tab
g.copilot_no_tab_map = true
