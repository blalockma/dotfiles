local Remap = require("mason.keymap-setup")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

nnoremap("<leader>fu", ":lua require'telescope.builtin'.lsp_references{}<CR>")
nnoremap("<leader>gd", ":lua require'telescope.builtin'.lsp_definitions{}<CR>")
nnoremap("<leader>gi", ":lua require'telescope.builtin'.lsp_implementations{}<CR>")
nnoremap("<leader>r", ":lua vim.lsp.buf.rename()<CR>")

nnoremap("<leader>xx", ":lua vim.lsp.buf.code_action()<CR>")
vnoremap("<leader>xx", ":lua vim.lsp.buf.code_action()<CR>")

nnoremap("<leader>dd", ":Telescope diagnostics bufnr=0<CR>")
