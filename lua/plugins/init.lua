local function default_header()
    return {
        '', '', '',
        '██╗      █████╗ ███╗   ██╗████████╗███████╗ ██████╗ ██╗   ██╗',
        '██║     ██╔══██╗████╗  ██║╚══██╔══╝██╔════╝██╔═══██╗██║   ██║',
        '██║     ███████║██╔██╗ ██║   ██║   ███████╗██║   ██║██║   ██║',
        '██║     ██╔══██║██║╚██╗██║   ██║   ╚════██║██║   ██║╚██╗ ██╔╝',
        '███████╗██║  ██║██║ ╚████║   ██║   ███████║╚██████╔╝ ╚████╔╝',
        '╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝ ╚═════╝   ╚═══╝ ',
        '', '', ''
    }
end

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "akinsho/bufferline.nvim",
    require'bufferline'.setup{}
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
        require("configs.cmp")
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "towolf/vim-helm",
    lazy = true,
    ft = 'helm',
  },
  {
    "ramilito/kubectl.nvim",
    config = function()
      require("kubectl").setup{
        log_level = vim.log.levels.INFO,
        auto_refresh = {
          enabled = true,
          interval = 300, -- milliseconds
        },
        diff = {
          bin = "kubediff" -- or any other binary
        },
        kubectl_cmd = { cmd = "kubectl", env = {}, args = {} },
        namespace = "All",
        namespace_fallback = {}, -- If you have limited access you can list all the namespaces here
        hints = true,
        context = true,
        heartbeat = true,
        lineage = {
          enabled = false, -- This feature is in beta at the moment
        },
        logs = {
          prefix = true,
          timestamps = true,
          since = "5m"
        },
        alias = {
          apply_on_select_from_history = true,
          max_history = 5,
        },
        filter = {
          apply_on_select_from_history = true,
          max_history = 10,
        },
        float_size = {
          -- Almost fullscreen:
          -- width = 1.0,
          -- height = 0.95, -- Setting it to 1 will cause bottom to be cutoff by statuscolumn

          -- For more context aware size:
          width = 0.9,
          height = 0.8,

          -- Might need to tweak these to get it centered when float is smaller
          col = 10,
          row = 5,
        },
        obj_fresh = 5, -- highlight if creation newer than number (in minutes)
        skew = {
          enabled = true,
          log_level = vim.log.levels.INFO,
        }
      }
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
      require'nvim-web-devicons'.setup {
        -- your personnal icons can go here (to override)
        -- you can specify color or cterm_color instead of specifying both of them
        -- DevIcon will be appended to `name`
        override = {
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh"
        }
        };
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        color_icons = true;
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true;
        -- globally enable "strict" selection of icons - icon will be looked up in
        -- different tables, first by filename, and if not found by extension; this
        -- prevents cases when file doesn't have any extension but still gets some icon
        -- because its name happened to match some extension (default to false)
        strict = true;
        -- set the light or dark variant manually, instead of relying on `background`
        -- (default to nil)
        variant = "light|dark";
        -- same as `override` but specifically for overrides by filename
        -- takes effect when `strict` is true
        override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore"
        }
        };
        -- same as `override` but specifically for overrides by extension
        -- takes effect when `strict` is true
        override_by_extension = {
        ["log"] = {
          icon = "",
          color = "#81e043",
          name = "Log"
        }
        };
        -- same as `override` but specifically for operating system
        -- takes effect when `strict` is true
        override_by_operating_system = {
        ["apple"] = {
          icon = "",
          color = "#A2AAAD",
          cterm_color = "248",
          name = "Apple",
        },
        };
      }
  },
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim",
        "vimdoc",
        "html",
        "css",
        "bash",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "json5",
        "lua",
        "python",
        "vim",
        "yaml",
        "c",
        "go",
        "rust",
      },
  	},
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "yaml-language-server",
        "terraform-ls",
        "tflint",
        "ansible-language-server",
        "bash-language-server"
      },
    },
  },
  {
    "mfussenegger/nvim-dap"
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function()
      require("gopher").setup {
        commands = {
          go = "go",
          gomodifytags = "gomodifytags",
          gotests = "gotests",
          impl = "impl",
          iferr = "iferr",
          dlv = "dlv",
        },
      }
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "nvimdev/dashboard-nvim",
      require('dashboard').setup {
        theme = 'doom',
        config = {
            header = default_header(),
            center = {
                {
                    icon = '󰈞 ',
                    icon_hl = 'Title',
                    desc = 'Find files',
                    desc_hl = 'String',
                    key = 'f',
                    keymap = 'SPC f f',
                    key_hl = 'Number',
                    action = ':Telescope find_files'
                }, {
				    icon = '󰱾 ',
                    icon_hl = 'Title',
                    desc = 'Open recently',
                    desc_hl = 'String',
                    key = 'r',
                    keymap = 'SPC f r',
                    key_hl = 'Number',
                    action = ':Telescope oldfiles'
                }, {
                    icon = ' ',
                    icon_hl = 'Title',
                    desc = 'Find text',
                    desc_hl = 'String',
                    key = 'w',
                    keymap = 'SPC f w',
                    key_hl = 'Number',
                    action = ':Telescope live_grep'
                }, {
                    icon = ' ',
                    icon_hl = 'Title',
                    desc = 'Git Braches',
                    desc_hl = 'String',
                    key = 'b',
                    keymap = 'SPC g b',
                    key_hl = 'Number',
                    action = ':Telescope git_branches'
                }

            }
        }
    }
  }
}
