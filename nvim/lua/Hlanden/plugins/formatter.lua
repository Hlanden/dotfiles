return {
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>=",
				function()
					require("conform").format()
				end,
				mode = { "n", "v" },
				desc = "Format Injected Langs",
			},
		},
		opts = {
			default_format_opts = {
				async = false,
				quiet = false,
				lsp_format = "fallback",
			},
			format_on_save = nil,
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				rust = { "rustfmt", "lsp" },
				javascript = { "prettierd", "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				typescript = { "prettier", "tsfmt" },
				typescriptreact = { "prettier" },
				sh = { "shfmt" },
				terraform = { "terraform_fmt" },
				cs = { "csharpier" },
				markdown = { "prettier" },
				["*"] = { "trim_whitespace" },
			},
			formatters = {
				csharpier = {
					command = "csharpier",
					args = { "format", "--write-stdout" },
					stdin = true,
				},
				terraform_fmt = {
					command = "terraform",
					args = { "fmt", "-" },
					stdin = true,
				},
				trim_whitespace = {
					function(ctx)
						local bufname = vim.api.nvim_buf_get_name(ctx.buf)
						if string.match(bufname, "octo://") or vim.bo.filetype == "octo" then
							return nil
						end
						return require("conform.formatters.trim_whitespace")
					end,
				},
				prettier = {
					command = "prettier",
					args = function(ctx)
						local args = {
							"--stdin-filepath",
							vim.fn.fnameescape(vim.api.nvim_buf_get_name(ctx.buf)),
						}
						if vim.bo.filetype == "markdown" then
							vim.list_extend(args, { "--prose-wrap=always", "--print-width=80" })
						end
						return args
					end,
					stdin = true,
				},
			},
		},
	},
}
