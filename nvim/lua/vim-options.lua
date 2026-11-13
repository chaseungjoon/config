vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.cmd("set expandtab")
vim.o.winborder = 'rounded'
vim.cmd("set autoindent")
-- On X11 Linux, use xclip explicitly: the auto-detected xsel can hang reading
-- the clipboard, which froze nvim on startup (blank screen, no input).
-- macOS and Wayland keep nvim's default provider.
if vim.fn.has('mac') == 0 and vim.env.WAYLAND_DISPLAY == nil and vim.fn.executable('xclip') == 1 then
    vim.g.clipboard = {
        name = 'xclip',
        copy = {
            ['+'] = { 'xclip', '-quiet', '-i', '-selection', 'clipboard' },
            ['*'] = { 'xclip', '-quiet', '-i', '-selection', 'primary' },
        },
        paste = {
            ['+'] = { 'xclip', '-o', '-selection', 'clipboard' },
            ['*'] = { 'xclip', '-o', '-selection', 'primary' },
        },
        cache_enabled = 1,
    }
end
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set number")
vim.cmd("set nocursorline")
vim.cmd("set backspace=indent,eol,start")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileencodings = "utf-8"
vim.opt.scrolloff = 15
vim.opt.updatetime = 50

-- Keymap sets
vim.keymap.set("n", "<leader>w", ":close<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>w", ":close<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Popup/completion menu settings
vim.opt.pumblend = 0
vim.opt.winblend = 0
vim.opt.pumheight = 20
vim.opt.completeopt = "menu,menuone,noselect"

-- swp file configs
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.backup = false

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "d", '"_d')
vim.keymap.set({ "n", "v" }, "D", '"_D')
vim.keymap.set("n", "dd", '"_dd')
vim.keymap.set("n", "dG", '"_dG')
