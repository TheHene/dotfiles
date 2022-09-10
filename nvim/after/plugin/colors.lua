local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
    return 
end

require("catppuccin").setup({
	transparent_background = true
})

vim.cmd [[colorscheme catppuccin]]
