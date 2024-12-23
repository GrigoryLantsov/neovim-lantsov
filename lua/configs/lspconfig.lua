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

lspconfig.terraformls.setup({
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "hcl" },
  capabilities = capabilities,
})

lspconfig.tflint.setup({
  cmd = { "tflint", "--langserver"},
  filetypes = { "terraform", "hcl" },
  capabilities = capabilities,
})

lspconfig.bashls.setup({
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh" },
  capabilities = capabilities,
})

lspconfig.helm_ls.setup({
  cmd = { "helm_ls" },
  filetypes = { "helm" },
  root_dir = util.root_pattern("Chart.yaml", "helm-charts"),
  settings = {
    ['helm_ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
})

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

lspconfig.yamlls.setup({
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yml" },
  settings = {
    yaml = {
      schemas = {
        kubernetes = "*.yaml",
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
        ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
        ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
      }
    }
  },
  capabilities = capabilities
})
