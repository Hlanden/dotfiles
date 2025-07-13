return {
    {
        "deathbeam/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" },                       -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        branch = "tools",
        build = "make tiktoken",                            -- Only on MacOS or Linux
    },
}
