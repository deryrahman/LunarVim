local keys = {}

local opts = {
  nnoremap = { noremap = true, silent = true },
  inoremap = { noremap = true, silent = true },
  vnoremap = { noremap = true, silent = true },
  xnoremap = { noremap = true, silent = true },
  generic = { silent = true },
}

keys.insert_mode = {}
-- I hate escape
keys.insert_mode["jk"] = { "<ESC>", opts.inoremap }
keys.insert_mode["kj"] = { "<ESC>", opts.inoremap }
keys.insert_mode["jj"] = { "<ESC>", opts.inoremap }
-- Move current line / block with Alt-j/k ala vscode.
keys.insert_mode["<A-j>"] = { "<Esc>:m .+1<CR>==gi", opts.inoremap }
keys.insert_mode["<A-k>"] = { "<Esc>:m .-2<CR>==gi", opts.inoremap }
-- navigation
keys.insert_mode["<A-Up>"] = { "<C-\\><C-N><C-w>h", opts.inoremap }
keys.insert_mode["<A-Down>"] = { "<C-\\><C-N><C-w>j", opts.inoremap }
keys.insert_mode["<A-Left>"] = { "<C-\\><C-N><C-w>k", opts.inoremap }
keys.insert_mode["<A-Right>"] = { "<C-\\><C-N><C-w>l", opts.inoremap }

keys.normal_mode = {}
-- Better window movement
keys.normal_mode["<C-h>"] = { "<C-w>h", opts.nnoremap }
keys.normal_mode["<C-j>"] = { "<C-w>j", opts.nnoremap }
keys.normal_mode["<C-k>"] = { "<C-w>k", opts.nnoremap }
keys.normal_mode["<C-l>"] = { "<C-w>l", opts.nnoremap }
-- Resize with arrows
keys.normal_mode["<C-Up>"] = { ":resize -2<CR>", opts.nnoremap }
keys.normal_mode["<C-Down>"] = { ":resize +2<CR>", opts.nnoremap }
keys.normal_mode["<C-Left>"] = { ":vertical resize -2<CR>", opts.nnoremap }
keys.normal_mode["<C-Right>"] = { ":vertical resize +2<CR>", opts.nnoremap }
if vim.fn.has "mac" == 1 then
  -- TODO: fix this
  keys.normal_mode["<A-Up>"] = { ":resize -2<CR>", opts.nnoremap }
  keys.normal_mode["<A-Down>"] = { ":resize +2<CR>", opts.nnoremap }
  keys.normal_mode["<A-Left>"] = { ":vertical resize -2<CR>", opts.nnoremap }
  keys.normal_mode["<A-Right>"] = { ":vertical resize +2<CR>", opts.nnoremap }
end
-- Buffer control
keys.normal_mode["<S-x>"] = { ":BufferClose<CR>", opts.nnoremap }
keys.normal_mode["<S-l>"] = { ":BufferNext<CR>", opts.nnoremap }
keys.normal_mode["<S-h>"] = { ":BufferPrevious<CR>", opts.nnoremap }
keys.normal_mode["<leader>c"] = { ":BufferClose<CR>", opts.nnoremap }
-- Move current line / block with Alt-j/k a la vscode.
keys.normal_mode["<A-j>"] = { ":m .+1<CR>==", opts.nnoremap }
keys.normal_mode["<A-k>"] = { ":m .-2<CR>==", opts.nnoremap }
-- QuickFix
keys.normal_mode["]q"] = { ":cnext<CR>", opts.nnoremap }
keys.normal_mode["[q"] = { ":cprev<CR>", opts.nnoremap }
keys.normal_mode["<C-q>"] = { ":call QuickFixToggle()<CR>", opts.nnoremap }

keys.term_mode = {}
-- Terminal window navigation
keys.term_mode["<C-h>"] = { "<C-\\><C-N><C-w>h", opts.generic }
keys.term_mode["<C-j>"] = { "<C-\\><C-N><C-w>j", opts.generic }
keys.term_mode["<C-k>"] = { "<C-\\><C-N><C-w>k", opts.generic }
keys.term_mode["<C-l>"] = { "<C-\\><C-N><C-w>l", opts.generic }

keys.visual_mode = {}
-- Better indenting
keys.visual_mode["<"] = { "<gv", opts.vnoremap }
keys.visual_mode[">"] = { ">gv", opts.vnoremap }

keys.visual_block_mode = {}
-- Move selected line / block of text in visual mode
keys.visual_block_mode["K"] = { ":move '<-2<CR>gv-gv", opts.xnoremap }
keys.visual_block_mode["J"] = { ":move '>+1<CR>gv-gv", opts.xnoremap }
-- Move current line / block with Alt-j/k ala vscode.
keys.visual_block_mode["<A-j>"] = { ":m '>+1<CR>gv-gv", opts.xnoremap }
keys.visual_block_mode["<A-k>"] = { ":m '<-2<CR>gv-gv", opts.xnoremap }

return keys
