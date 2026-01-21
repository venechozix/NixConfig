require("config.keymaps")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.format")
-- General Configurations

vim.cmd("colorscheme catppuccin_macchiato")

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.number = true

-- CLipboard bs
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    float = {
        source = "always",
    },
})
