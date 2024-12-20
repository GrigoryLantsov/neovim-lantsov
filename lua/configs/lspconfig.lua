-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.gopls.setup {
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.ansiblels.setup({
  cmd = { "ansible-language-server", "--stdio" },
  filetypes = { "yaml.ansible", "yaml", "yml" },
  settings = {
    ansible = {
      ansible = {
        path = "ansible",
      },
      ansiblelint = {
        path = "ansible-lint",
      }
    }
  },
  capabilities = capabilities
})
