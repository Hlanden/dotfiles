return {
    {
        "deathbeam/CopilotChat.nvim",
        dependencies = {
            { "github/copilot.vim" },
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        branch = "tools",
        build = "make tiktoken",
        init = function()
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_hide_during_completion = false
            vim.g.copilot_proxy_strict_ssl = false
            vim.g.copilot_settings = { selectedCompletionModel = "gpt-4o-copilot" }
            vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false,
            })
        end,
        event = "VeryLazy",
        opts = {
            model = "gpt-4.1",
            debug = true,
            temperature = 0,
            question_header = "Question",
            answer_header = "Answer",
            error_header = "> Error",
            log_level = "debug",
            mappings = {
                complete = {
                    insert = "<Tab>",
                },
                close = {
                    normal = "q",
                    insert = "<C-c>",
                },
                reset = {
                    normal = "<C-l>",
                    insert = "<C-l>",
                },
                submit_prompt = {
                    normal = "<CR>",
                    insert = "<C-s>",
                },
                toggle_sticky = {
                    normal = "grr",
                },
                clear_stickies = {
                    normal = "grx",
                },
                accept_diff = {
                    normal = "<C-y>",
                    insert = "<C-y>",
                },
                jump_to_diff = {
                    normal = "gj",
                },
                quickfix_answers = {
                    normal = "gqa",
                },
                quickfix_diffs = {
                    normal = "<leader>al",
                },
                yank_diff = {
                    normal = "gy",
                    register = '"', -- Default register to use for yanking
                },
                show_diff = {
                    normal = "gd",
                    full_diff = false, -- Show full diff instead of unified diff when showing diff window
                },
                show_info = {
                    normal = "gi",
                },
                show_context = {
                    normal = "gc",
                },
                show_help = {
                    normal = "gh",
                },
            },
            contexts = {
                keymaps = {
                    description = "Show all globally defined keymaps",
                    resolve = function()
                        local maps = vim.api.nvim_get_keymap("n")
                        local lines = {}

                        for _, map in ipairs(maps) do
                            table.insert(
                                lines,
                                string.format("%-10s -> %s [%s]", map.lhs, map.rhs or "", map.desc or "")
                            )
                        end

                        return {
                            {
                                content = table.concat(lines, "\n"),
                                filename = "keymaps.txt",
                                filetype = "text",
                            },
                        }
                    end,
                },
            },
        },
        keys = {
            { "<leader>aa", "<cmd>CopilotChatToggle<cr>",  mode = {"n", "v"}, desc = "AI Toggle" },
            { "<leader>ae", "<cmd>CopilotChatExplain<cr>",  desc = "AI Explain" },
            { "<leader>ar", "<cmd>CopilotChatReview<cr>",   desc = "AI Review" },
            { "<leader>at", "<cmd>CopilotChatTests<cr>",    desc = "AI Tests" },
            { "<leader>af", "<cmd>CopilotChatFix<cr>",      desc = "AI Fix" },
            { "<leader>ao", "<cmd>CopilotChatOptimize<cr>", desc = "AI Optimize" },
            { "<leader>ad", "<cmd>CopilotChatDocs<cr>",     desc = "AI Documentation" },
            { "<leader>ac", "<cmd>CopilotChatCommit<cr>",   desc = "AI Generate Commit" },
            { "<leader>ap", "<cmd>CopilotChatPlan<cr>",     desc = "AI Development Plan" },
        },
    },
}
