-- Set up nvim-cmp.
local cmp = require("cmp")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-e>"] = cmp.mapping.abort(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "ultisnips" }, -- For ultisnips users.
    }, {
        { name = "buffer" },
    }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = "buffer" },
    }),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        {
            name = "cmdline",
            option = {
                ignore_cmds = { "Man", "!" },
            },
        },
    }),
})

-- LSP START
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").pyright.setup({ capabilities = capabilities, on_attach = on_attach })
require("lspconfig").clangd.setup({ capabilities = capabilities, on_attach = on_attach })
require("lspconfig").bashls.setup({ capabilities = capabilities, on_attach = on_attach })
require("lspconfig").rust_analyzer.setup({ capabilities = capabilities, on_attach = on_attach })
require("lspconfig").kotlin_language_server.setup({ capabilities = capabilities, on_attach = on_attach })
require("lspconfig").angularls.setup({ capabilities = capabilities, on_attach = on_attach })
require("lspconfig").biome.setup({})
require("lspconfig").vtsls.setup({})
require("lspconfig").cssls.setup({ capabilities = capabilities, on_attach = on_attach })
require("lspconfig").somesass_ls.setup({ capabilities = capabilities, on_attach = on_attach })
require("lspconfig").html.setup({})
require("lspconfig").lemminx.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "xml", "xsd", "xsl", "xslt", "svg", "urdf", "xacro" },
})
require("lspconfig").ltex.setup({ capabilities = capabilities, on_attach = on_attach })
require("lspconfig").texlab.setup({ capabilities = capabilities, on_attach = on_attach })
require("lspconfig").csharp_ls.setup({})
require("lspconfig").terraformls.setup({})
require("lspconfig").tailwindcss.setup({})
require("lspconfig").robotframework_ls.setup({})
require("lspconfig").eslint.setup({})
require("lspconfig").lua_ls.setup({ capabilities = capabilities, on_attach = on_attach })
-- LSP END

-- FORMATTERS START
-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = {
            require("formatter.filetypes.lua").stylua,
        },
        python = {
            require("formatter.filetypes.python").black,
        },
        json = {
            require("formatter.filetypes.json").fixjson,
        },
        typescript = {
            require("formatter.filetypes.typescript").tsfmt,
        },
        typescriptreact = {
            require("formatter.filetypes.typescript").prettier,
        },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    },
})
-- FORMATTERS END
-- LINTERS START
require("lint").linters_by_ft = {
    cpp = { "cpplint" },
}
-- LINTERS END
