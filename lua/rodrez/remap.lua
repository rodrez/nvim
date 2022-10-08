local nnoremap = require("rodrez.keymap").nnoremap
require("telescope.builtin").find_files()
require("telescope.builtin").live_grep()
require("telescope.builtin").buffers()
require("telescope.builtin").help_tags()

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>pc", "<cmd>w %:d<CR>")
nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<CR>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<CR>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<CR>")
nnoremap("<leader>f", ":Neoformat<CR>")
nnoremap("<leader>fe", ":silent exec '!npx next lint --fix'<CR>")
nnoremap("<C-c>", "<Esc>")

