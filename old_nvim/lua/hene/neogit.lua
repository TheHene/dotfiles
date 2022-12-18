local neogit = require('neogit')
local nnoremap = require('hene.keymap').nnoremap


neogit.setup {}

nnoremap("<leader>gs", function()
    neogit.open({ })
end);
