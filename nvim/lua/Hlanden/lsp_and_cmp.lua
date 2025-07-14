-- LSP START
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").pyright.setup({ capabilities = capabilities })
require("lspconfig").clangd.setup({ capabilities = capabilities })
require("lspconfig").bashls.setup({ capabilities = capabilities })
require("lspconfig").rust_analyzer.setup({ capabilities = capabilities })
require("lspconfig").kotlin_language_server.setup({ capabilities = capabilities })
require("lspconfig").angularls.setup({ capabilities = capabilities })
require("lspconfig").biome.setup({ capabilities = capabilities })
require("lspconfig").vtsls.setup({ capabilities = capabilities })
require("lspconfig").cssls.setup({ capabilities = capabilities })
require("lspconfig").somesass_ls.setup({ capabilities = capabilities })
require("lspconfig").html.setup({ capabilities = capabilities })
require("lspconfig").lemminx.setup({
	capabilities = capabilities,
	filetypes = { "xml", "xsd", "xsl", "xslt", "svg", "urdf", "xacro" },
})
require("lspconfig").ltex.setup({ capabilities = capabilities, filetypes = { "tex" } })
require("lspconfig").texlab.setup({ capabilities = capabilities, filetypes = { "tex" } })
require("lspconfig").omnisharp.setup({
    capabilities = capabilities,
    cmd = { "OmniSharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    on_attach = function(client, bufnr)
        local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
        end

        map("n", "gd", "<cmd>lua require('omnisharp_extended').telescope_lsp_definition()<cr>")
        map("n", "<leader>D", "<cmd>lua require('omnisharp_extended').telescope_lsp_type_definition()<cr>")
        map("n", "gr", "<cmd>lua require('omnisharp_extended').telescope_lsp_references()<cr>")
        map("n", "gi", "<cmd>lua require('omnisharp_extended').telescope_lsp_implementation()<cr>")
    end,
    settings = {
        RoslynExtensionsOptions = {
            enableDecompilationSupport = true,
        },
    },
})
require("lspconfig").terraformls.setup({ capabilities = capabilities })
require("lspconfig").tailwindcss.setup({ capabilities = capabilities })
require("lspconfig").robotframework_ls.setup({ capabilities = capabilities })
require("lspconfig").eslint.setup({ capabilities = capabilities })
require("lspconfig").lua_ls.setup({ capabilities = capabilities })
require("lspconfig").harper_ls.setup({ capabilities = capabilities })
require("lspconfig").powershell_es.setup({ capabilities = capabilities })
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
            require("formatter.filetypes.json").prettier,
        },
        yaml = {
            require("formatter.filetypes.yaml").prettier,
        },
        typescript = {
            require("formatter.filetypes.typescript").tsfmt,
        },
        typescriptreact = {
            require("formatter.filetypes.typescript").prettier,
        },
        sh = {
            require("formatter.filetypes.sh").shfmt,
        },
        terraform = {
            require("formatter.filetypes.terraform").terraform,
        },
        cs = {
            function()
                return {
                    exe = "csharpier",
                    args = {
                        "format",
                        "--write-stdout"
                    },
                    stdin = true,
                }
            end,
        },
        markdown = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                        "--prose-wrap=always",
                        "--print-width=80",
                    },
                    stdin = true,
                }
            end,
        },
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- Don't remove trailing whitespace for Octo buffers
            function()
                local bufname = vim.api.nvim_buf_get_name(0)
                if string.match(bufname, "octo://") or vim.bo.filetype == "octo" then
                    return nil
                else
                    return require("formatter.filetypes.any").remove_trailing_whitespace()
                end
            end,
        },
    },
})
-- FORMATTERS END
-- LINTERS START
require("lint").linters_by_ft = {
	cpp = { "cpplint" },
}
-- LINTERS END
