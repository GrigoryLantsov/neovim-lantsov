require "nvchad.mappings"

vim.g.mapleader = " "

-- Quit
vim.keymap.set('n', '<C-q>', '<cmd>:q<CR>')

-- Copy all text
vim.keymap.set('n', '<C-a>', '<cmd>%y+<CR>')

-- Saving a file via Ctrl+S
vim.keymap.set('i', '<C-s>', '<cmd>:w<CR>')
vim.keymap.set('n', '<C-s>', '<cmd>:w<CR>')

-- NvimTree
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>tf', ':NvimTreeFocus<CR>')

-- BufferLine
vim.keymap.set('n','<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n','<S-Tab>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<C-l>', ':BufferLineCloseOthers<CR>')

-- TodoList
vim.keymap.set('n', '<leader>nl', ':TodoTelescope<CR>')

-- ToggleTerm
vim.keymap.set('n', '<leader>s', ':ToggleTerm direction=float<CR>')

-- Map Tab to indent
vim.keymap.set('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })

-- Kubectl
vim.keymap.set("n", "<leader>k", '<cmd>lua require("kubectl").toggle()<cr>', { noremap = true, silent = true })

-- ToogleGoLangCommands
vim.api.nvim_set_keymap('n', '<leader>gor', ':lua GoRun()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gob', ':lua GoBuild()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>got', ':lua GoTest()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gof', ':lua GoFmt()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gol', ':lua GoLint()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>god', ':lua GoDebug()<CR>', { noremap = true, silent = true })


-- Define GoRun function
function GoRun()
local file = vim.fn.expand('%:p')  -- Get the full path of the current file
if file == '' then
  print("No Go file found!")
  return
end
vim.fn.system({'go', 'run', file})
print("Running Go file: " .. file)
end

-- Build Go file
function GoBuild()
local file = vim.fn.expand('%:p')  -- Get the full path of the current file
if file == '' then
  print("No Go file found!")
  return
end
vim.fn.system({'go', 'build', file})
print("Building Go file: " .. file)
end

-- Run Go tests
function GoTest()
local file = vim.fn.expand('%:p')  -- Get the full path of the current file
if file == '' then
  print("No Go file found!")
  return
end
vim.fn.system({'go', 'test', file})
print("Running tests on: " .. file)
end

-- Format Go file
function GoFmt()
vim.cmd("silent! write")  -- Save the file
vim.fn.system({'go', 'fmt', vim.fn.expand('%:p')})
print("Formatted Go file")
vim.cmd("edit")  -- Reload the file to apply formatting changes
end

-- Lint Go file
function GoLint()
vim.cmd("silent! write")  -- Save the file
vim.fn.system({'golint', vim.fn.expand('%:p')})
print("Linted Go file")
end

-- Debug Go file
function GoDebug()
local file = vim.fn.expand('%:p')  -- Get the full path of the current file
if file == '' then
  print("No Go file found!")
  return
end
vim.fn.system({'dlv', 'debug', file})
print("Debugging Go file: " .. file)
end


-- add yours here
local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}
return M

