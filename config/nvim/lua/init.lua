local opts = { noremap = true, silent = true, buffer = bufnr }

-- for auto-session issues
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- cursor in last position
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    desc = "return cursor to where it was last time closing the file",
    pattern = "*",
    command = 'silent! normal! g`"zv',
})

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
require("nvim-treesitter").setup({
    ensure_installed = { "go", "python", "lua" },
    highlight = { enable = true },
})

-- Gitsigns
require("gitsigns").setup()

-- Comment
require("Comment").setup()

-- UI
require("which-key").setup()

require("auto-session").setup({
    git_use_branch_name = true,
    log_level = "error",
    post_restore_cmds = {
        'tabdo windo if &ft != "" | exe "setlocal foldmethod=" . getbufvar(bufnr(), "&fdm", "syntax") | endif',
        "tabdo windo normal! zx",
    },
    pre_save_cmds = { "tabdo windo set foldmethod=manual | normal! zE" },
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    lazy = true,
})

require("avante_lib").load()
require("avante").setup({
    provider = "copilot",
    -- mode = "legacy",
    -- auto_suggestions_provider = "openai",
    behaviour = {
        auto_suggestions = false,
    },
    lazy = true,
})

require("copilot").setup({
    lazy = true,
})

require("supermaven-nvim").setup({
    disable = true,
})

-- NeoGit
require("neogit").setup({
    -- kind = "floating"
    kind = "replace",
})

require("dashboard").setup({
    theme = "hyper",
})

require("project_nvim").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
})

local telescope_builtin = require("telescope.builtin")
local telescope = require("telescope")
local telescope_ext_projects = require("telescope").extensions.projects

telescope.load_extension("projects")

-- telescope
telescope.setup({
    lazy = true,
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
    },
})

vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, opts)
vim.keymap.set("n", "<leader>fk", telescope_builtin.keymaps, opts)
vim.keymap.set("n", "<leader>fp", telescope_ext_projects.projects, opts)
vim.keymap.set("n", "<leader>fc", telescope_builtin.commands, opts)
vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, opts)
-- vim.keymap.set("n", "gD", telescope_builtin.lsp_declarations, opts) -- doesnt exist?
vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, opts)
vim.keymap.set("n", "gr", telescope_builtin.lsp_references, opts)
vim.keymap.set("n", "<space>D", telescope_builtin.lsp_type_definitions, opts)

vim.keymap.set("n", "<space>ds", telescope_builtin.lsp_document_symbols, opts)
vim.keymap.set("n", "<space>ws", telescope_builtin.lsp_workspace_symbols, opts)
vim.keymap.set("n", "<space>e", telescope_builtin.diagnostics, opts)

vim.keymap.set("n", "<leader>fr", telescope_builtin.oldfiles, opts)
vim.keymap.set("n", "<leader>fj", telescope_builtin.jumplist, opts)
vim.keymap.set("n", "<leader>fm", telescope_builtin.marks, opts)
vim.keymap.set("n", "<leader>fR", telescope_builtin.registers, opts)
vim.keymap.set("n", "<leader>f:", telescope_builtin.command_history, opts)
vim.keymap.set("n", "<leader>f/", telescope_builtin.search_history, opts)
vim.keymap.set("n", "<leader>f.", telescope_builtin.resume, opts)

vim.keymap.set("n", "<leader>gs", telescope_builtin.git_status, opts)
vim.keymap.set("n", "<leader>gb", telescope_builtin.git_branches, opts)
vim.keymap.set("n", "<leader>gc", telescope_builtin.git_commits, opts)
vim.keymap.set("n", "<leader>gC", telescope_builtin.git_bcommits, opts)

vim.keymap.set("n", "<leader>fq", telescope_builtin.quickfix, opts)
vim.keymap.set("n", "<leader>fl", telescope_builtin.loclist, opts)

vim.keymap.set("n", "<leader>fw", telescope_builtin.grep_string, opts)

-- old traditional binds

-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<space>ff", function()
    vim.lsp.buf.format({ async = true })
end, opts)



-- DAP config
local dap = require("dap")

-- Adapter: debugpy
dap.adapters.python = {
    type = "executable",
    command = "/usr/bin/env",
    args = { "python", "-m", "debugpy.adapter" },
}

-- Configurations: two options. Use one, remove the other.
dap.configurations.python = {
    -- Runs `python -m uvicorn server:app ...`
    {
        type = "python",
        request = "launch",
        name = "Uvicorn (no-reload) - server:app",
        module = "uvicorn",
        args = { "server:app", "--host", "0.0.0.0", "--port", "5001" },
        cwd = vim.fn.getcwd(),
        console = "integratedTerminal",
        pythonPath = function()
            local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
            if venv then
                return venv .. "/bin/python"
            end
            return "/usr/bin/python"
        end,
    },
}

local dapui = pcall(require, "dapui") and require("dapui") or nil
local widgets_ok, widgets = pcall(require, "dap.ui.widgets")

-- Signs (optional)
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "Error", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "WarningMsg", linehl = "", numhl = "" })

-- DAP Core controls
vim.api.nvim_set_keymap("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)   -- start / continue
vim.api.nvim_set_keymap("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts) -- step over
vim.api.nvim_set_keymap("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts) -- step into
vim.api.nvim_set_keymap("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)  -- step out}

-- Breakpoints
vim.api.nvim_set_keymap("n", "<Leader>db", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>dB",
    "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Condition: '))<CR>",
    opts
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>dp",
    "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log message: '))<CR>",
    opts
)

-- Run / stop / detach
vim.api.nvim_set_keymap("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)                             -- run last config
vim.api.nvim_set_keymap("n", "<Leader>dq", "<Cmd>lua require'dap'.terminate(); require'dap'.disconnect()<CR>", opts) -- stop and detach

-- REPL / eval / run-to-cursor
vim.api.nvim_set_keymap("n", "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
vim.api.nvim_set_keymap("v", "<Leader>de", "<Cmd>lua require'dap'.eval(require('vim.fn').getline('.'))<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>dc", "<Cmd>lua require'dap'.run_to_cursor()<CR>", opts)

-- UI widgets (if available)
if widgets_ok then
    vim.api.nvim_set_keymap("n", "<Leader>dh", "<Cmd>lua require('dap.ui.widgets').hover()<CR>", opts)
    vim.api.nvim_set_keymap(
        "n",
        "<Leader>df",
        "<Cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').frames)<CR>",
        opts
    )
    vim.api.nvim_set_keymap(
        "n",
        "<Leader>ds",
        "<Cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<CR>",
        opts
    )
end

-- Optional: automatically open/close dapui if installed
if dapui then
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
end

-- obsidian
require("obsidian").setup({
    workspaces = {
        {
            name = "work",
            path = os.getenv("HOME") .. "/Documents/work",
        },
    },
    daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
        template = nil,
    },
    ui = {
        enable = true,
    },
})

-- add obsidian shortcuts
vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>")
vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>")
vim.keymap.set("n", "<leader>od", ":ObsidianDailies<CR>")

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
