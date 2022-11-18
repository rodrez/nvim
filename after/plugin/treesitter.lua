require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {"c", "lua", "rust", "javascript", "typescript", "python", "tsx"},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false
    },
    	textobjects = {
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
				[']b'] = '@block.outer',
				[']a'] = '@parameter.inner',
				[']k'] = '@call.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
				[']B'] = '@block.outer',
				[']A'] = '@parameter.inner',
				[']K'] = '@call.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
				['[b'] = '@block.outer',
				['[a'] = '@parameter.inner',
				['[k'] = '@call.inner',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
				['[B'] = '@block.outer',
				['[A'] = '@parameter.inner',
				['[K'] = '@call.inner',
			},
		},
		select = {
			enable = true,
			lookahead = true,
			include_surrounding_whitespace = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
				['ab'] = '@block.outer',
				['ib'] = '@block.inner',
				['al'] = '@loop.outer',
				['il'] = '@loop.inner',
				['a/'] = '@comment.outer',
				['i/'] = '@comment.outer', -- no inner for comment
				['aa'] = '@parameter.outer', -- parameter -> argument
				['ia'] = '@parameter.inner',
				['ak'] = '@call.outer',
				['ik'] = '@call.inner',
				['ai'] = '@conditional.outer', -- i as if
				['ii'] = '@conditional.inner',
			},
		},
	},
}
