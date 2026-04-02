M = {}

M.setup = function()
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.go",
		callback = function()
			vim.lsp.buf.format()
		end,
	})

	-- autocmd BufLeave,FocusLost * wall
	vim.api.nvim_create_autocmd("BufLeave", {
		callback = function()
			vim.cmd("wall")
		end,
	})

	-- cursor in last position
	vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
		desc = "return cursor to where it was last time closing the file",
		pattern = "*",
		command = 'silent! normal! g`"zv',
	})

	-- autoformat on save for yaml
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = { "*.yaml", "*.yml" },
		callback = function()
			local fileName = vim.api.nvim_buf_get_name(0)
			vim.cmd(":%!yq")
		end,
	})
end

return M
