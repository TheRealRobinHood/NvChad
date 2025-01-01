-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "cmake" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities

lspconfig.clangd.setup {
  cmd = { "clangd", "--clang-tidy" },
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  settings = { clangd = { checkOptions = { "clang-tidy", "--clang-tidy-checks=*" } } },
  init_options = { clangdFileStatus = true },
}
