local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>pw', function()
    require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
