require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"pyright",
		"clangd",
		"bashls",
		"rust_analyzer",
		"kotlin_language_server",
		"angularls",
		"biome",
		"vtsls",
		"cssls",
		"html",
		"lemminx",
		"ltex",
		"texlab",
		"csharp_ls",
		"terraformls",
		"tailwindcss",
		"robotframework_ls",
		"lua_ls",
		"eslint",
		"harper_ls",
	},
    automatic_enable = false,
	automatic_installation = true,
})

-- TODO: Currently incompatible with Mason v2.0.0
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/77
-- Activate once compatible

-- require("mason-tool-installer").setup({
-- 	ensure_installed = {
-- 		"stylua",
-- 		"cpplint",
-- 		"black",
-- 		"fixjson",
-- 		"prettier",
-- 	},
-- 	auto_update = true,
-- 	run_on_start = true,
-- })
