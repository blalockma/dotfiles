local Remap = require("masonblalock.keymap-setup")
local nnoremap = Remap.nnoremap
local utils = require('telescope.utils')
local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.setup({
    pickers = {
        diagnostics = {
            wrap_results = true
        }
    }
})

telescope.load_extension('fzf')
telescope.load_extension "file_browser"

nnoremap("<C-p>", function()
    local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' }) 
    if ret == 0 then 
        builtin.git_files() 
    else
        builtin.find_files()
    end
end)

nnoremap("<leader>e", ":Telescope file_browser path=%:p:h<CR>")
nnoremap("<leader>lg", ":Telescope live_grep<CR>")
nnoremap("<leader>lb", ":Telescope buffers<CR>")
nnoremap("<leader>dd", ":Telescope diagnostics bufnr=0<CR>")
nnoremap("<leader>dw", ":Telescope diagnostics<CR>")
