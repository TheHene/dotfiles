local Remap = require("hene.keymap")
local nnoremap = Remap.nnoremap

-- Buffer switching
nnoremap("<C-l>", ":bn<CR>")
nnoremap("<C-h>", ":bp<CR>")
nnoremap("<leader>bd", ":bd<CR>")

-- Tab
nnoremap("<leader>nt", ":tabnew<CR>")
nnoremap("<leader>tc", ":tabclose<CR>")
