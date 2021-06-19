-- vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

local opts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', '<space>ff', function() vim.lsp.buf.format { async = true } end, opts)

-- Mason + LSP
local lspconfig = require("lspconfig")


require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = true,
    ensure_installed = { "gopls", "ruff", "jedi_language_server", "lua_ls" },
})

-- nvim-cmp
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
    },
})

-- Treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = { "go", "python", "lua" },
    highlight = { enable = true },
})

-- Gitsigns
require("gitsigns").setup()

-- Comment
require("Comment").setup()

-- UI
require("which-key").setup()

require("auto-session").setup {
    use_git_branch = true,
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    pre_save_cmds = { 'tabdo windo set foldmethod=manual | normal! zE' },
    post_restore_cmds = { 'tabdo windo if &ft != "" | exe "setlocal foldmethod=" . getbufvar(bufnr(), "&fdm", "syntax") | endif', 'tabdo windo normal! zx' },
}

-- telescope
require('telescope').setup {
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        }
    }
}

require("auto-session").setup {
    use_git_branch = true,
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    pre_save_cmds = { 'tabdo windo set foldmethod=manual | normal! zE' },
    post_restore_cmds = { 'tabdo windo if &ft != "" | exe "setlocal foldmethod=" . getbufvar(bufnr(), "&fdm", "syntax") | endif', 'tabdo windo normal! zx' },
}

require('avante_lib').load()
require('avante').setup({
    provider = "openai",
    mode = "legacy",
    -- auto_suggestions_provider = "openai",
    behaviour = {
        auto_suggestions = false,
    }
})

require("supermaven-nvim").setup({})

-- NeoGit
require('neogit').setup {
    -- kind = "floating"
    kind = "replace"
}

-- telescope
require('telescope').setup {
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        }
    }
}

require('dashboard').setup {
    theme = 'hyper'

}

-- NOTE: Disabled because it conflicts with Mason
-- require('navigator').setup({
--     mason = true
-- })


---------------------


-- -- lspconfig.gopls.setup{
-- -- 	cmd = {'gopls', '--remote=auto'},
-- -- 	-- for postfix snippets and analyzers
-- -- 	capabilities = capabilities,
-- -- 	    settings = {
-- -- 	      gopls = {
-- -- 		      experimentalPostfixCompletions = true,
-- -- 		      analyses = {
-- -- 		        unusedparams = true,
-- -- 		        shadow = true,
-- -- 		     },
-- -- 		     staticcheck = true,
-- -- 		    },
-- -- 	    },
-- -- 	on_attach = on_attach,
-- -- }
--
-- -- ruff is python language server + linter
-- lspconfig.ruff.setup {
--     on_attach = on_attach,
--     filetypes = { 'python' },
--     cmd = { "ruff", "server" },
--     settings = {},
-- }
--
--
-- lspconfig.jedi_language_server.setup{
--     cmd = { "/home/subhrajit/.pyenv/versions/3.12.7/bin/jedi-language-server" },
--     -- on_attach = on_attach,
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false -- Disable formatting
--         client.server_capabilities.documentRangeFormattingProvider = false -- Disable range formatting
--
--         -- Ensure `on_attach` runs correctly
--         if on_attach then
--             on_attach(client, bufnr)
--         end
--     end,
--     filetypes = { "python" },
-- }
--

--
--
-- require("coverage").setup({
-- commands = true, -- create commands
-- highlights = {
--     -- customize highlight groups created by the plugin
--     covered = { fg = "#C3E88D" },   -- supports style, fg, bg, sp (see :h highlight-gui)
--     uncovered = { fg = "#F07178" },
-- },
-- signs = {
--     -- use your own highlight groups or text markers
--     covered = { hl = "CoverageCovered", text = "▎" },
--     uncovered = { hl = "CoverageUncovered", text = "▎" },
-- },
-- summary = {
--     -- customize the summary pop-up
--     min_coverage = 80.0,      -- minimum coverage threshold (used for highlighting)
-- },
-- lang = {
--     -- customize language specific settings
-- },
-- })
--
--
--
--
-- -- require('gentags').setup{
-- --   autostart = true,
-- --   root_dir = vim.g.gentags_root_dir or vim.loop.cwd(),
-- -- }
