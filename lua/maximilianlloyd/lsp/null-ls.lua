local null_ls = require("null-ls")

-- register any number of sources simultaneously
formatting = null_ls.builtins.formatting

local sources = {
    formatting.prettier.with({
            extra_filetypes = { "html" },
    }),
    formatting.stylua,
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({ debug = false, sources = sources })
