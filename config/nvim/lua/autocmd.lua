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
end

return M
