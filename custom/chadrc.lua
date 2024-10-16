---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "tokyonight",

  nvdash = {
    load_on_startup = true,
  },

  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = true,
      silent = true, -- silences 'no signature help available' message from appearing
    },
  },
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
