local cmp = require("cmp")
local source_mapping = {
	nvim_lsp = "[LSP]",
	buffer = "[Buffer]",
	path = "[Path]",
    luasnip = "[Snippet]",
    emoji = "[Emoji]",
}

local lspkind = require("lspkind")
local luasnip = require("luasnip")

lspkind.init()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup {
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end
	},
    mapping = {
       ["<C-k>"] = cmp.mapping.select_prev_item(),
	   ["<C-j>"] = cmp.mapping.select_next_item(),
       ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
       ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
       ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
       ["<C-e>"] = cmp.mapping({
         i = cmp.mapping.abort(),
         c = cmp.mapping.close(),
        }),
        ["<C-y>"] = cmp.config.disable,
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
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
		{ name = "emoji" },
	},
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    documentation = {
        border = { "???", "???", "???", "???", "???", "???", "???", "???" },
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    }
}


require'cmp'.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' }
  }
})


require'cmp'.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})
