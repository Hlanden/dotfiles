return {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/nvim-cmp" },
    {
        "petertriho/cmp-git",
        dependencies = { "hrsh7th/nvim-cmp" },
        init = function()
            table.insert(require("cmp").get_config().sources, { name = "git" })
        end,
    }
}
