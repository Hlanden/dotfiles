return {
    {
        "pwntester/octo.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
        keys = {
            { "<leader>oo", "<cmd>Octo pr list<cr>", mode = { "n" }, desc = "Open PR list" },
            { "<leader>op", "<cmd>Octo pr create<cr>", mode = { "n" }, desc = "Create PR" },
        },
    }
}
