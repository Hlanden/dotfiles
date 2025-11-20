return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- Required adapters
			{"Hlanden/neotest-vitest", branch="bug/run-all"},
            "Issafalcon/neotest-dotnet",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-vitest"),
					require("neotest-dotnet"),
				},
			})
		end,
		keys = {
			{
				"<leader>tn",
				function()
					require("neotest").run.run()
				end,
				desc = "neotest: Run nearest test",
			},

			{
				"<leader>tf",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
			},

			{
				"<leader>ta",
				function()
					require("neotest").run.run(vim.fn.getcwd())
				end,
				desc = "neotest: Run all tests",
			},

			{
				"<leader>ts",
				function()
					require("neotest").run.stop()
				end,
				desc = "neotest: Stop test",
			},

			-- Toggle test summary
			{
				"<leader>to",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "neotest: Toggle test summary",
			},

			-- Toggle test output panel
			{
				"<leader>tp",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "neotest: Toggle output panel",
			},

			-- Show output of the nearest test
			{
				"<leader>tO",
				function()
					require("neotest").output.open({ enter = true })
				end,
				desc = "neotest: Show test output",
			},

			-- Jump to next failed test
			{
				"]t",
				function()
					require("neotest").jump.next({ status = "failed" })
				end,
				desc = "neotest: Next failed test",
			},

			-- Jump to previous failed test
			{
				"[t",
				function()
					require("neotest").jump.prev({ status = "failed" })
				end,
				desc = "neotest: Previous failed test",
			},

			-- Debug the nearest test (requires nvim-dap)
			{
				"<leader>td",
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				desc = "neotest: Debug nearest test",
			},

			-- Watch the current file
			{
				"<leader>tw",
				function()
					require("neotest").watch.toggle(vim.fn.expand("%"))
				end,
				desc = "neotest: Watch current file",
			},
		},
	},
}
