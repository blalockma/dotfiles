local Remap = require("masonblalock.keymap-setup")
local inoremap = Remap.inoremap

inoremap("<C-e>", "copilot#Accept('<CR>')", { expr = true, silent = true, replace_keycodes = false })

vim.g.copilot_no_tab_map = true
