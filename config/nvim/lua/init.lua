require("keymaps").setup()

-- Mason
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
	windows = {
		input = {
			height = 12,
		},
		ask = {
			floating = true, -- Open the 'AvanteAsk' prompt in a floating window
			start_insert = true, -- Start insert mode when opening the ask window
			---@type "ours" | "theirs"
			focus_on_apply = "ours", -- which diff to focus after applying
		},
	},
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

local telescope = require("telescope")
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

-- for auto-session issues
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- cursor in last position
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	desc = "return cursor to where it was last time closing the file",
	pattern = "*",
	command = 'silent! normal! g`"zv',
})

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
