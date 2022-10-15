local Remap = require("mason.keymap-setup")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

inoremap("kj", "<Esc>")
nnoremap("<CR>", ":nohlsearch<CR>")
