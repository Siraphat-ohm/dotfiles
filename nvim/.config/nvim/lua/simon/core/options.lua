vim.cmd("let g:netrw_liststyle     = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

--search settings
opt.ignorecase = true
opt.smartcase = true

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

-- auto-load CP template for new .cpp files
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.cpp",
    command = "0r ~/.config/nvim/templates/cp.cpp",
})
