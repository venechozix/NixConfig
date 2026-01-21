local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
})

-- Nix
vim.lsp.config("nil_ls", { capabilities = capabilities })

-- Enable servers
vim.lsp.enable({
  "lua_ls",
  "nil_ls",
})

