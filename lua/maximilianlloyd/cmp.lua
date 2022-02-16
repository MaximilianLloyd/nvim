local cmp = require("cmp")
local source_mapping = {
	nvim_lsp = "[LSP]",
	buffer = "[Buffer]",
	path = "[Path]",
    luasnip = "[Snippet]",
    cmndline = "[CMD]",
}


local lspkind = require("lspkind")

lspkind.init()

cmp.setup {
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end
	},
    mapping = {
       ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
       ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
       ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
       ['<C-e>'] = cmp.mapping({
         i = cmp.mapping.abort(),
         c = cmp.mapping.close(),
        }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = true },
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = source_mapping,
        },
    },
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 5 },
		{ name = "path" },
		{ name = "cmdline" },
	},
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    }
}
