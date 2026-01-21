return {
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = { "markdown" },
        config = function()
            vim.g.mkdp_theme = 'light'
            vim.fn["mkdp#util#install"]()
        end
    }
}

