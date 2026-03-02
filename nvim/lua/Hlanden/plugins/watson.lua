return {
  dir  = vim.fn.expand("~/dev/personal/watson.nvim"),
  name = "watson.nvim",
  -- No external dependencies — pure Lua, uses vim.fn.jobstart
  opts = {
    server_bin = "watson-server",
    mode       = "stdio",
    chat_win   = {
      split = "right",
      width = 80,
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
      "<leader>ws",
      "<cmd>WatsonSidebar<CR>",
      desc = "Toggle Watson sidebar",
      mode = { "n" },
    },
  },
  config = function(_, opts)
    require("watson").setup(opts)
  end,
}
