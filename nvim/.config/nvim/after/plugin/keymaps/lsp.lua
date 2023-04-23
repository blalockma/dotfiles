local Remap = require("masonblalock.keymap-setup")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

nnoremap("<leader>fu", ":lua require'telescope.builtin'.lsp_references{}<CR>")
nnoremap("<leader>gd", ":lua require'telescope.builtin'.lsp_definitions{}<CR>")
nnoremap("<leader>gi", ":lua require'telescope.builtin'.lsp_implementations{}<CR>")
nnoremap("<leader>fs", ":lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>")
nnoremap("<leader>r", ":lua vim.lsp.buf.rename()<CR>")
