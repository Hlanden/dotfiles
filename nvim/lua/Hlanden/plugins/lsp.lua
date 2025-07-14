return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                dependencies = { "williamboman/mason.nvim" },
            },
            "Hoffs/omnisharp-extended-lsp.nvim",
            "hrsh7th/nvim-cmp"
        },
        config = function()
            local arch = vim.loop.os_uname().machine
            local is_arm = string.find(arch:lower(), "arm") or string.find(arch:lower(), "aarch64")
            local base_packages = {
                "pyright",
                "bashls",
                "rust_analyzer",
                "kotlin_language_server",
                "angularls",
                "biome",
                "vtsls",
                "cssls",
                "html",
                "ltex",
                "texlab",
                "terraformls",
                "tailwindcss",
                "powershell_es",
                -- "robotframework_ls",
                "lua_ls",
                "eslint",
                "harper_ls",
                "omnisharp",
            }

            -- Packages that only exists on AMD
            local non_arm_packages = {
                "clangd",
                "lemminx",
            }
            local mason_packages = base_packages

            if not is_arm then
                for _, pkg in ipairs(non_arm_packages) do
                    mason_packages[#mason_packages + 1] = pkg
                end
            end
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = mason_packages,
                automatic_enable = false,
                automatic_installation = true,
            })
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "stylua",
                    "cpplint",
                    "black",
                    "fixjson",
                    "prettier",
                    "csharpier",
                },
                auto_update = true,
                run_on_start = true,
            })

            local cmp_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities())

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
        end,
    }
}
