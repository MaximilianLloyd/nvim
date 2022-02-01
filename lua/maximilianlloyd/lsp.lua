local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local luasnip = require('luasnip')

luasnip.filetype_extend("javascript", { "javascriptreact" })
luasnip.filetype_extend("javascript", { "html" })
luasnip.filetype_extend("typescript", { "typescriptreact" })
luasnip.filetype_extend("typescriptreact", { "typescriptreact" })

-- 
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	path = "[Path]",
    luasnip = "[Snippet]",
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
      -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
	            buffer = "[Buffer]",
	            nvim_lsp = "[LSP]",
	            path = "[Path]",
                luasnip = "[Snippet]",
            },
        },
    },
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 5 },
	},
    experimental = {
        native_menu = false,
    }
}

 -- Cmnd line stuff 
cmp.setup.cmdline(':', {
    sources = {
        { name = "cmndline" }
    } })

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=false }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  -- Diagnostics
  buf_set_keymap('n', '<leader>dh', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>dl', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

  -- Learn what this does
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end



local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = on_attach,
	}, _config or {})
end

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup(config())
lspconfig.ccls.setup(config())
lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
    on_attach = on_attach,
}
lspconfig.jsonls.setup(config())
lspconfig.eslint.setup(config())
lspconfig.html.setup(config())
lspconfig.cssmodules_ls.setup(config())


local opts = {
	highlight_hovered_item = true,
	show_guides = true,
}

-- require("symbols-outline").setup(opts)
require("symbols-outline").setup(opts)
require("luasnip/loaders/from_vscode").load()

-- Shows diagnostics in a floating window.
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
