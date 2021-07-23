local M = {}

function M.set_group(mode, keymaps)
  for key, val in pairs(keymaps) do
    vim.api.nvim_set_keymap(mode, key, val[1], val[2])
  end
end

return M
