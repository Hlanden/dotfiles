return{
    {
        "SirVer/ultisnips",
        init = function()
            vim.g.UltiSnipsSnippetDirectories = { "UltiSnips" }
            vim.g.UltiSnipsExpandTrigger = "<tab>"
            vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
            vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
            vim.g.UltiSnipsEnableSnipMate = 0
        end,
    }
}
