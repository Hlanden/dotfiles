return {
	{
		"stevearc/conform.nvim",
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"gff",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",

				desc = "Format buffer",
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
                        local buf = ctx.buf or 0
                        local bufname = vim.api.nvim_buf_get_name(buf)
						if string.match(bufname, "octo://") or vim.bo.filetype == "octo" then
							return nil
						end
						return require("conform.formatters.trim_whitespace")
					end,
				},
				prettier = {
					command = "prettier",
					args = function(ctx)
                        local buf = ctx.buf or 0
						local args = {
							"--stdin-filepath",
							vim.fn.fnameescape(vim.api.nvim_buf_get_name(buf)),
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
