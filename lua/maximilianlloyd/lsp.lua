local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local luasnip = require('luasnip')

luasnip.filetype_extend("javascript", { "javascriptreact" })
luasnip.filetype_extend("javascript", { "html" })
luasnip.filetype_extend("typescript", { "typescriptreact" })
luasnip.filetype_extend("typescriptreact", { "typescriptreact" })

vim.opt.completeopt = { "menu", "menuone", "noselect" }

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
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
  buf_set_keymap('n', '<space>dh', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<space>dl', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>Telescope lsp_code_actions<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end


local lsp_installer_servers = require('nvim-lsp-installer.servers')

local servers = {
    "jsonls",
    "eslint",
    "angularls",
    "vimls",
    "sumneko_lua",
    "tsserver",
    "gopls",
    "html",
    "bashls",
}

-- Loop through the servers listed above.
for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)

    if server_available then
        server:on_ready(function ()
            local opts = {
                on_attach = on_attach,
                capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
            }

            if server_name == "sumneko_lua" then
                opts = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = {'vim'},
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                        on_attach = on_attach,
                        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
                    },
                }
            end

            server:setup(opts)
        end)

        if not server:is_installed() then
            -- Queue the server to be installed.
            server:install()
        end
    end
end

local opts = {
	highlight_hovered_item = true,
	show_guides = true,
}

-- require("symbols-outline").setup(opts)
require("luasnip/loaders/from_vscode").load()
