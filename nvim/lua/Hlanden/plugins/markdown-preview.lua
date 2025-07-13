return {
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = { "markdown" },
        config = function()
            vim.fn["mkdp#util#install"]()
        end
    }
}
