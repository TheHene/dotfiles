vim.g.my_colorscheme = "gruvbox"

function ColorMyPencils()
    vim.g.gruvbox_contrast_dark = 'hard'
    vim.g.tokyonight_transparent_sidebar = true
    vim.g.tokyonight_transparent = true
    vim.g.gruvbox_invert_selection = '0'
    vim.opt.background = "dark"

    vim.cmd("colorscheme " .. vim.g.my_colorscheme)

    local hl = function(thing, opts)
        vim.api.nvim_set_hl(0, thing, opts)
    end

    hl("SignColumn", {
        bg = "none",
    })

    hl("CursorLineNR", {
        bg = "None"
    })

    hl("Normal", {
        bg = "none"
    })
end
ColorMyPencils()
