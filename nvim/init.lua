require("config.keymaps")
require("plugins.telescope")


-- General Configurations
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.number = true

-- CLipboard bs
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Show diagnostics as virtual text and in floating windows

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true, -- <-- this is what enables diagnostics while typing
  severity_sort = true,
  float = {
    source = "always", -- show source of the diagnostic (like pyright)
  },
})
