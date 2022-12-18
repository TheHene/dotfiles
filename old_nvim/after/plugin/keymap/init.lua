local Remap = require("hene.keymap")
local nnoremap = Remap.nnoremap
local xnoremap = Remap.xnoremap

-- Buffer switching
nnoremap("<leader>l", ":bn<CR>")
nnoremap("<leader>h", ":bp<CR>")
nnoremap("<leader>bd", ":bd<CR>")

-- Tab
nnoremap("<leader>nt", ":tabnew<CR>")
nnoremap("<leader>tc", ":tabclose<CR>")

-- Paste without overwriting Buffer
xnoremap("<leader>p", "\"_dP")
