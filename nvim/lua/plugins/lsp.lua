local lsp = vim.lsp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.config.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
})

lsp.config.nil_ls.setup({ capabilities = capabilities })
