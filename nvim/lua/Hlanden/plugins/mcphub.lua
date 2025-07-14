return {
    {
        "ravitemer/mcphub.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "deathbeam/CopilotChat.nvim",
        },
        build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
        event = "VeryLazy",
        config = function()
            mcp =require("mcphub")
            mcp.setup({
                log = {
                    level = vim.log.levels.DEBUG,
                    to_file = true,
                    file_path = vim.fn.expand("~/mcphub.log"),
                },
            })
            mcp.on({ "servers_updated", "tool_list_changed", "resource_list_changed" }, function()
                local chat = require("CopilotChat")
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
        end,
    },
}
