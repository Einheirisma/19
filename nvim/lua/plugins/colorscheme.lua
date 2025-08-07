return {
	-- 'vague2k/vague.nvim',
	-- config = function()
	-- 	require('vague').setup({ transparent = true })
	-- 	vim.cmd(':hi statusline guibg=NONE')
	-- end,

	'RRethy/base16-nvim',
	config = function()
		require('base16-colorscheme').setup()
		vim.cmd.colorscheme('base16-black-metal-gorgoroth')
		vim.cmd(':hi statusline guibg=NONE')
	end,
}
