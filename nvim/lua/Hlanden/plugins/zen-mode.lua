return {
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup()
        end,
        keys = {
            { "<leader>zz", "<cmd>ZenMode<cr>", mode = { "n" }, desc = "Toggle Zen Mode" },
        },
    }
}
