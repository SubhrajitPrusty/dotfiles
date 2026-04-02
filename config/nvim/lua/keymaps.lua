local M = {}

function M.setup()
	---@diagnostic disable-next-line: undefined-global
	local opts = { noremap = true, silent = true, buffer = bufnr }

	local telescope_builtin = require("telescope.builtin")
	local telescope_ext_projects = require("telescope").extensions.projects
	local telescope_emoji = require("telescope").extensions.emoji

	-- emoji
	vim.keymap.set(
		"n",
		"<leader>se",
		telescope_emoji.emoji,
		vim.tbl_extend("force", opts, { desc = "Telescope: Emoji" })
	)

	vim.keymap.set(
		"n",
		"<leader>ff",
		telescope_builtin.find_files,
		vim.tbl_extend("force", opts, { desc = "Telescope: Find files" })
	)
	vim.keymap.set(
		"n",
		"<leader>fg",
		telescope_builtin.live_grep,
		vim.tbl_extend("force", opts, { desc = "Telescope: Live grep" })
	)
	vim.keymap.set(
		"n",
		"<leader>fb",
		telescope_builtin.buffers,
		vim.tbl_extend("force", opts, { desc = "Telescope: Buffers" })
	)
	vim.keymap.set(
		"n",
		"<leader>fh",
		telescope_builtin.help_tags,
		vim.tbl_extend("force", opts, { desc = "Telescope: Help tags" })
	)
	vim.keymap.set(
		"n",
		"<leader>fk",
		telescope_builtin.keymaps,
		vim.tbl_extend("force", opts, { desc = "Telescope: Keymaps" })
	)
	vim.keymap.set(
		"n",
		"<leader>fp",
		telescope_ext_projects.projects,
		vim.tbl_extend("force", opts, { desc = "Telescope: Projects" })
	)
	vim.keymap.set(
		"n",
		"<leader>fc",
		telescope_builtin.commands,
		vim.tbl_extend("force", opts, { desc = "Telescope: Commands" })
	)
	vim.keymap.set(
		"n",
		"gd",
		telescope_builtin.lsp_definitions,
		vim.tbl_extend("force", opts, { desc = "Telescope: LSP Definitions" })
	)
	-- vim.keymap.set("n", "gD", telescope_builtin.lsp_declarations, opts) -- doesnt exist?
	vim.keymap.set(
		"n",
		"gi",
		telescope_builtin.lsp_implementations,
		vim.tbl_extend("force", opts, { desc = "Telescope: LSP Implementations" })
	)
	vim.keymap.set(
		"n",
		"gr",
		telescope_builtin.lsp_references,
		vim.tbl_extend("force", opts, { desc = "Telescope: LSP References" })
	)
	vim.keymap.set(
		"n",
		"<space>D",
		telescope_builtin.lsp_type_definitions,
		vim.tbl_extend("force", opts, { desc = "Telescope: LSP Type Definitions" })
	)
	vim.keymap.set(
		"n",
		"<space>ds",
		telescope_builtin.lsp_document_symbols,
		vim.tbl_extend("force", opts, { desc = "Telescope: LSP Document Symbols" })
	)
	vim.keymap.set(
		"n",
		"<space>ws",
		telescope_builtin.lsp_workspace_symbols,
		vim.tbl_extend("force", opts, { desc = "Telescope: LSP Workspace Symbols" })
	)
	vim.keymap.set(
		"n",
		"<space>e",
		telescope_builtin.diagnostics,
		vim.tbl_extend("force", opts, { desc = "Telescope: Diagnostics" })
	)
	vim.keymap.set(
		"n",
		"<leader>fr",
		telescope_builtin.oldfiles,
		vim.tbl_extend("force", opts, { desc = "Telescope: Oldfiles" })
	)
	vim.keymap.set(
		"n",
		"<leader>fj",
		telescope_builtin.jumplist,
		vim.tbl_extend("force", opts, { desc = "Telescope: Jumplist" })
	)
	vim.keymap.set(
		"n",
		"<leader>fm",
		telescope_builtin.marks,
		vim.tbl_extend("force", opts, { desc = "Telescope: Marks" })
	)
	vim.keymap.set(
		"n",
		"<leader>fR",
		telescope_builtin.registers,
		vim.tbl_extend("force", opts, { desc = "Telescope: Registers" })
	)
	vim.keymap.set(
		"n",
		"<leader>f:",
		telescope_builtin.command_history,
		vim.tbl_extend("force", opts, { desc = "Telescope: Command History" })
	)
	vim.keymap.set(
		"n",
		"<leader>f/",
		telescope_builtin.search_history,
		vim.tbl_extend("force", opts, { desc = "Telescope: Search History" })
	)
	vim.keymap.set(
		"n",
		"<leader>f.",
		telescope_builtin.resume,
		vim.tbl_extend("force", opts, { desc = "Telescope: Resume" })
	)
	vim.keymap.set(
		"n",
		"<leader>gs",
		telescope_builtin.git_status,
		vim.tbl_extend("force", opts, { desc = "Telescope: Git Status" })
	)
	vim.keymap.set(
		"n",
		"<leader>gb",
		telescope_builtin.git_branches,
		vim.tbl_extend("force", opts, { desc = "Telescope: Git Branches" })
	)
	vim.keymap.set(
		"n",
		"<leader>gc",
		telescope_builtin.git_commits,
		vim.tbl_extend("force", opts, { desc = "Telescope: Git Commits" })
	)
	vim.keymap.set(
		"n",
		"<leader>gC",
		telescope_builtin.git_bcommits,
		vim.tbl_extend("force", opts, { desc = "Telescope: Git Buffer Commits" })
	)
	vim.keymap.set(
		"n",
		"<leader>fq",
		telescope_builtin.quickfix,
		vim.tbl_extend("force", opts, { desc = "Telescope: Quickfix" })
	)
	vim.keymap.set(
		"n",
		"<leader>fl",
		telescope_builtin.loclist,
		vim.tbl_extend("force", opts, { desc = "Telescope: Location List" })
	)
	vim.keymap.set(
		"n",
		"<leader>fw",
		telescope_builtin.grep_string,
		vim.tbl_extend("force", opts, { desc = "Telescope: Grep String" })
	)
	vim.keymap.set(
		"n",
		"<C-k>",
		vim.lsp.buf.signature_help,
		vim.tbl_extend("force", opts, { desc = "LSP: Signature help" })
	)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP: Rename" }))
	vim.keymap.set(
		"n",
		"<space>wa",
		vim.lsp.buf.add_workspace_folder,
		vim.tbl_extend("force", opts, { desc = "LSP: Add workspace folder" })
	)
	vim.keymap.set(
		"n",
		"<space>wr",
		vim.lsp.buf.remove_workspace_folder,
		vim.tbl_extend("force", opts, { desc = "LSP: Remove workspace folder" })
	)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP: Hover information" }))
	vim.keymap.set(
		"n",
		"[d",
		vim.diagnostic.goto_prev,
		vim.tbl_extend("force", opts, { desc = "Diagnostics: Go to previous" })
	)
	vim.keymap.set(
		"n",
		"]d",
		vim.diagnostic.goto_next,
		vim.tbl_extend("force", opts, { desc = "Diagnostics: Go to next" })
	)
	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP: Code action" }))

	-- generic format
	vim.keymap.set("n", "<space>ff", function()
		vim.lsp.buf.format({ async = true })
	end, vim.tbl_extend("force", opts, { desc = "LSP: Format" }))

	-- add obsidian shortcuts nvim
	vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", vim.tbl_extend("force", opts, { desc = "Obsidian: Today" }))
	vim.keymap.set(
		"n",
		"<leader>oy",
		":ObsidianYesterday<CR>",
		vim.tbl_extend("force", opts, { desc = "Obsidian: Yesterday" })
	)
	vim.keymap.set(
		"n",
		"<leader>os",
		":ObsidianSearch<CR>",
		vim.tbl_extend("force", opts, { desc = "Obsidian: Search" })
	)
	vim.keymap.set(
		"n",
		"<leader>od",
		":ObsidianDailies<CR>",
		vim.tbl_extend("force", opts, { desc = "Obsidian: Dailies" })
	)
	vim.keymap.set(
		"n",
		"<leader>oq",
		":ObsidianQuickSwitch<CR>",
		vim.tbl_extend("force", opts, { desc = "Obsidian: Quick Switch" })
	)

	-- dap config
	local dap = require("dap")
	local dapui = pcall(require, "dapui") and require("dapui") or nil
	local widgets_ok, _ = pcall(require, "dap.ui.widgets")

	-- Signs (optional)
	vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "Error", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "▶", texthl = "WarningMsg", linehl = "", numhl = "" })

	-- DAP Core controls
	vim.api.nvim_set_keymap("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts) -- start / continue
	vim.api.nvim_set_keymap("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts) -- step over
	vim.api.nvim_set_keymap("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts) -- step into
	vim.api.nvim_set_keymap("n", "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts) -- step out}

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
	vim.api.nvim_set_keymap("n", "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts) -- run last config
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

	-- misc
	vim.keymap.set(
		"n",
		"<C-L>",
		":nohlsearch<CR><C-L>",
		vim.tbl_extend("force", opts, { desc = "Clear search highlight" })
	)

	--  Search and Replace
	vim.keymap.set(
		"n",
		"<Leader>s",
		":%s//g<Left><Left>",
		vim.tbl_extend("force", opts, { desc = "Search and replace" })
	)

	-- Relative numbering
	vim.keymap.set("n", "<leader>rn", function()
		if vim.wo.relativenumber then
			vim.wo.relativenumber = false
		else
			vim.wo.relativenumber = true
		end
	end, vim.tbl_extend("force", opts, { desc = "Toggle relative numbering" }))

	-- File History
	vim.keymap.set("n", "<C-H>", ":History<cr>", vim.tbl_extend("force", opts, { desc = "File History" }))

	-- code action
	vim.keymap.set(
		"n",
		"ca",
		"<cmd>lua vim.lsp.buf.code_action()<CR>",
		vim.tbl_extend("force", opts, { desc = "Code Action" })
	)

	-- Git
	vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", vim.tbl_extend("force", opts, { desc = "Git Blame" }))
	vim.keymap.set(
		"n",
		"<leader>gcp",
		":term git commit -p<cr>i",
		vim.tbl_extend("force", opts, { desc = "Git Commit -p" })
	)
	vim.keymap.set("n", "<leader>gg", ":Neogit<cr>", vim.tbl_extend("force", opts, { desc = "Neogit" }))
	vim.keymap.set("n", "<leader>n", ":NERDTreeToggle %<cr>", vim.tbl_extend("force", opts, { desc = "NERDTree" }))

	-- Buffers
	vim.keymap.set("n", "<M-d>", ":bdelete!<cr>", vim.tbl_extend("force", opts, { desc = "Buffers" }))

	-- old traditional binds, replaced by telescope
	-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
	-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
	-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
	-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

	-- Cloak
	vim.keymap.set("n", "<leader>ct", ":CloakToggle<cr>", vim.tbl_extend("force", opts, { desc = "Cloak Toggle" }))
	vim.keymap.set(
		"n",
		"<leader>cl",
		":CloakPreviewLine<cr>",
		vim.tbl_extend("force", opts, { desc = "Cloak Preview Line" })
	)

	-- Spectre
	vim.keymap.set(
		"n",
		"<leader>S",
		'<cmd>lua require("spectre").toggle()<CR>',
		vim.tbl_extend("force", opts, { desc = "Toggle Spectre" })
	)
	vim.keymap.set(
		"n",
		"<leader>sw",
		'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
		vim.tbl_extend("force", opts, { desc = "Search current word" })
	)
	vim.keymap.set(
		"v",
		"<leader>sw",
		'<esc><cmd>lua require("spectre").open_visual()<CR>',
		vim.tbl_extend("force", opts, { desc = "Search current word" })
	)
	vim.keymap.set(
		"n",
		"<leader>sp",
		'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
		vim.tbl_extend("force", opts, { desc = "Search on current file" })
	)

	-- Toggle between loguru and configure_logger for bolna project
	vim.keymap.set("n", "<leader>tl", function()
		local s = require("spectre")
		local in_bolna = vim.fn.system("grep -rl 'configure_logger(__name__)' --include='*.py' .") ~= ""
		local search_text, replace_text
		if in_bolna then
			search_text = "logger = configure_logger\\(__name__\\)"
			replace_text = "from loguru import logger"
		else
			search_text = "from loguru import logger"
			replace_text = "logger = configure_logger(__name__)"
		end
		s.open({ search_text = search_text, replace_text = replace_text, path = "**/*.py" })
	end)
end

return M
