return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        event = "InsertEnter",
        opts = function()
            local cmp = require("cmp")
            return {
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
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
                    { name = "git" }, -- For git commit messages, if you have `cmp_git` installed.
                    { name = "buffer" },
                }),
                filetype = {
                    gitcommit = {
                        sources = cmp.config.sources({
                            { name = "cmp_git" },
                        }, {
                            { name = "buffer" },
                        }),
                    },
                },
            }
        end,
        config = function (_, opts)
            local cmp = require("cmp")
            cmp.setup(opts)
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
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })
        end
            -- `/` cmdline setup.
    },
    {
        "petertriho/cmp-git",
        dependencies = { "hrsh7th/nvim-cmp" },
        init = function()
            table.insert(require("cmp").get_config().sources, { name = "git" })
        end,
        opts = {},
    },
}
