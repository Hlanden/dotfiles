-- Copilot autosuggestions
vim.g.copilot_no_tab_map = true
vim.g.copilot_hide_during_completion = false
vim.g.copilot_proxy_strict_ssl = false
vim.g.copilot_settings = { selectedCompletionModel = "gpt-4o-copilot" }
vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
})

-- Copilot chat
local chat = require("CopilotChat")
local prompts = require("CopilotChat.config.prompts")
local select = require("CopilotChat.select")
local utils = require("CopilotChat.utils")

local COPILOT_PLAN = [[
You are a software architect and technical planner focused on clear, actionable development plans.
]] .. prompts.COPILOT_BASE.system_prompt .. [[

When creating development plans:
- Start with a high-level overview
- Break down into concrete implementation steps
- Identify potential challenges and their solutions
- Consider architectural impacts
- Note required dependencies or prerequisites
- Estimate complexity and effort levels
- Track confidence percentage (0-100%)
- Format in markdown with clear sections

Always end with:
"Current Confidence Level: X%"
"Would you like to proceed with implementation?" (only if confidence >= 90%)
]]

chat.setup({
    model = "gpt-4.1",
    debug = true,
    temperature = 0,
    question_header = "Question",
    answer_header = "Answer",
    error_header = "> Error",
    log_level = 'debug',
    mappings = {
        reset = false,
        show_diff = {
            full_diff = true,
        },
    },
    contexts = {
        keymaps = {
            description = "Show all globally defined keymaps",
            resolve = function()
                local maps = vim.api.nvim_get_keymap("n")
                local lines = {}

                for _, map in ipairs(maps) do
                    table.insert(lines, string.format("%-10s -> %s [%s]", map.lhs, map.rhs or "", map.desc or ""))
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
    prompts = {
        Explain = {
            mapping = "<leader>ae",
            description = "AI Explain",
        },
        Review = {
            mapping = "<leader>ar",
            description = "AI Review",
        },
        Tests = {
            mapping = "<leader>at",
            description = "AI Tests",
        },
        Fix = {
            mapping = "<leader>af",
            description = "AI Fix",
        },
        Optimize = {
            mapping = "<leader>ao",
            description = "AI Optimize",
        },
        Docs = {
            mapping = "<leader>ad",
            description = "AI Documentation",
        },
        Commit = {
            mapping = "<leader>ac",
            description = "AI Generate Commit",
            selection = select.buffer,
        },
        Plan = {
            prompt =
            "Create or update the development plan for the selected code. Focus on architecture, implementation steps, and potential challenges.",
            system_prompt = COPILOT_PLAN,
            context = "file:.copilot/plan.md",
            progress = function()
                return false
            end,
            callback = function(response, source)
                chat.chat:append("Plan updated successfully!", source.winnr)
                local plan_file = source.cwd() .. "/.copilot/plan.md"
                local dir = vim.fn.fnamemodify(plan_file, ":h")
                vim.fn.mkdir(dir, "p")
                local file = io.open(plan_file, "w")
                if file then
                    file:write(response)
                    file:close()
                end
            end,
        },
    },
})

-- MCP hub
local mcp = require("mcphub")
mcp.on({ "servers_updated", "tool_list_changed", "resource_list_changed" }, function()
    if not chat.config.functions then
        return
    end

    local hub = mcp.get_hub_instance()
    if not hub then
        return
    end

    local async = require("plenary.async")
    local call_tool = async.wrap(function(server, tool, input, callback)
        hub:call_tool(server, tool, input, {
            callback = function(res, err)
                callback(res, err)
            end,
        })
    end, 4)

    local access_resource = async.wrap(function(server, uri, callback)
        hub:access_resource(server, uri, {
            callback = function(res, err)
                callback(res, err)
            end,
        })
    end, 3)

    local resources = hub:get_resources()
    local resource_templates = hub:get_resource_templates()
    vim.list_extend(resources, resource_templates)
    for _, resource in ipairs(resources) do
        local name = resource.name:lower():gsub(" ", "_"):gsub(":", "")
        chat.config.functions[name] = {
            uri = resource.uri or resource.uriTemplate,
            description = type(resource.description) == "string" and resource.description or "",
            resolve = function()
                local res, err = access_resource(resource.server_name, resource.uri)
                if err then
                    error(err)
                end

                res = res or {}
                local result = res.result or {}
                local content = result.contents or {}

                local out = {}

                for _, message in ipairs(content) do
                    if message.text then
                        table.insert(out, {
                            uri = message.uri,
                            data = message.text,
                            mimetype = message.mimeType,
                        })
                    end
                end

                return out
            end,
        }
    end

    local tools = hub:get_tools()
    for _, tool in ipairs(tools) do
        chat.config.functions[tool.name] = {

            group = tool.server_name,
            description = tool.description,
            schema = tool.inputSchema,
            resolve = function(input)
                local res, err = call_tool(tool.server_name, tool.name, input)

                if err then
                    error(err)
                end

                res = res or {}
                local result = res.result or {}
                local content = result.content or {}
                local out = {}

                for _, message in ipairs(content) do
                    if message.type == "text" then
                        table.insert(out, {

                            data = message.text,
                        })
                    elseif message.type == "resource" and message.resource and message.resource.text then
                        table.insert(out, {
                            uri = message.resource.uri,

                            data = message.resource.text,
                            mimetype = message.resource.mimeType,
                        })
                    end
                end

                return out
            end,
        }
    end
end)
mcp.setup({
    log = {
        level = vim.log.levels.DEBUG,
        to_file = true,
        file_path = vim.fn.expand("~/mcphub.log"),
    }
})
