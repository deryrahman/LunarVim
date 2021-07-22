local keymap = require "keymappings.keymap"
local default_keys = require "keymappings.preset.default"
local core_keys = require "keymappings.preset.core"

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

if O.keys.leader_key == " " or O.keys.leader_key == "space" then
  vim.g.mapleader = " "
else
  vim.g.mapleader = O.keys.leader_key
end

-- navigate tab completion with <c-j> and <c-k>
-- runs conditionally
vim.cmd 'inoremap <expr> <C-j> pumvisible() ? "\\<C-n>" : "\\<C-j>"'
vim.cmd 'inoremap <expr> <C-k> pumvisible() ? "\\<C-p>" : "\\<C-k>"'
