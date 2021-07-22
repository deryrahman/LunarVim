local keymap = require "keymappings.keymap"
local default_keys = require "keymappings.preset.default"
local core_keys = require "keymappings.preset.core"
local lsp_keys = require "keymappings.preset.lsp"

local mode = {
  normal = "n",
  insert = "i",
  visual = "v",
  visual_block = "x",
  term = "t",
  s = "s",
}

-- Set default keys
keymap.set_group(mode.normal, default_keys.normal_mode)
keymap.set_group(mode.insert, default_keys.insert_mode)
keymap.set_group(mode.visual, default_keys.visual_mode)
keymap.set_group(mode.visual_block, default_keys.visual_block_mode)
keymap.set_group(mode.term, default_keys.term_mode)

-- Set core plugins specific keys
keymap.set_group(mode.insert, core_keys.compe.insert_mode)
keymap.set_group(mode.s, core_keys.compe.s_mode)
keymap.set_group(mode.normal, core_keys.telescope.normal_mode)

-- Set lsp
keymap.set_group(mode.normal, lsp_keys.normal_mode)

-- Set leader
if O.keys.leader_key == " " or O.keys.leader_key == "space" then
  vim.g.mapleader = " "
else
  vim.g.mapleader = O.keys.leader_key
end
