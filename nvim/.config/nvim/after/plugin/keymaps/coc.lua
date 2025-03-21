local Remap = require("masonblalock.keymap-setup")
local inoremap = Remap.inoremap


inoremap("<Tab>", "coc#pum#visible() ? coc#pum#next(1) : \"<Tab>\"", {expr = true})
inoremap("<s-Tab>", "coc#pum#visible() ? coc#pum#prev(1) : \"<s-Tab>\"", {expr = true})
inoremap("<CR>", "coc#pum#visible() ? coc#pum#confirm() : \"<CR>\"", {expr = true})
