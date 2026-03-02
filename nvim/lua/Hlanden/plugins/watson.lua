-- ── Fidget spinner for Watson ────────────────────────────────────────────────
local function setup_spinner()
  local ok, progress = pcall(require, "fidget.progress")
  if not ok then return end

  local handles = {}

  local group = vim.api.nvim_create_augroup("watson.spinner", { clear = true })

  vim.api.nvim_create_autocmd("User", {
    pattern = "WatsonRequestStarted",
    group   = group,
    callback = function(args)
      local id    = args.data and args.data.id    or 0
      local model = args.data and args.data.model or "watson"
      local handle = progress.handle.create({
        title   = "",
        message = "  Thinking…",
        lsp_client = { name = model ~= "" and model or "watson" },
      })
      handles[id] = handle
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "WatsonRequestFinished",
    group   = group,
    callback = function(args)
      local id     = args.data and args.data.id     or 0
      local status = args.data and args.data.status or "success"
      local handle = handles[id]
      handles[id] = nil
      if handle then
        if status == "success" then
          handle.message = "󰗡 Done"
        elseif status == "error" then
          handle.message = " Error"
        else
          handle.message = "󰜺 Cancelled"
        end
        handle:finish()
      end
    end,
  })
end

return {
  dir  = vim.fn.expand("~/dev/personal/watson.nvim"),
  name = "watson.nvim",
  dependencies = {
    "j-hui/fidget.nvim",
  },
  opts = {
    server_bin = "watson-server",
    mode       = "stdio",
    chat_win   = {
      split = "full",
    },
    sidebar_win = {
      split = "left",
      width = 30,
    },
  },
  keys = {
    {
      "<leader>ww",
      "<cmd>WatsonToggle<CR>",
      desc = "Toggle Watson",
      mode = { "n" },
    },
    {
      "<leader>wp",
      function()
        local port = vim.fn.input("Watson port: ")
        if port == "" then return end
        local n = tonumber(port)
        if not n then
          vim.notify("[watson] Invalid port: " .. port, vim.log.levels.WARN)
          return
        end
        require("watson").open({ port = n })
      end,
      desc = "Watson: open at port",
      mode = { "n" },
    },
    {
      "<leader>ws",
      "<cmd>WatsonNewSession<CR>",
      desc = "Watson: new session",
      mode = { "n" },
    },
    {
      "<leader>wa",
      "<cmd>WatsonNewAgent<CR>",
      desc = "Watson: new agent",
      mode = { "n" },
    },
    {
      "<leader>wd",
      "<cmd>WatsonDeleteAgent<CR>",
      desc = "Watson: delete/reset agent",
      mode = { "n" },
    },
    {
      "<leader>wS",
      "<cmd>WatsonSidebar<CR>",
      desc = "Watson: toggle sidebar",
      mode = { "n" },
    },
    {
      "<leader>wc",
      "<cmd>WatsonCompact<CR>",
      desc = "Watson: compact context",
      mode = { "n" },
    },
    {
      "<leader>wv",
      "<cmd>WatsonSave<CR>",
      desc = "Watson: save session",
      mode = { "n" },
    },
  },
  config = function(_, opts)
    require("watson").setup(opts)
    setup_spinner()
  end,
}
