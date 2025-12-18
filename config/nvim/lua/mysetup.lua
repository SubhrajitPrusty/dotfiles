-- lspconfig

require'lspconfig'.pyright.setup{}

-- telescope

require('telescope').setup{
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        }
    }
}

-- Vim coverage
require('coverage').setup()

-- neodev
require('neodev').setup()

-- neotest
-- lua require('neotest').setup({'adapters':{}})

function NERDTreeToggleInCurDir()
  -- If NERDTree is open in the current buffer
  if vim.fn.bufname("%") then
    print(vim.fn.bufname("%"))
    -- vim.cmd("NERDTreeFind")
  else
    vim.cmd("NERDTreeCWD")
  end
end


-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
require('lspconfig').ruff_lsp.setup {
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  }
}

