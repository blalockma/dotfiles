local Remap = require("mason.keymap-setup")
local nnoremap = Remap.nnoremap

require('telescope').load_extension('fzf')

nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)

nnoremap("<leader>pf", function()
    require('telescope.builtin').find_files()
end)
