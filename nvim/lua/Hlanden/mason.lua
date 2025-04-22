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
	automatic_installation = true,
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"cpplint",
		"black",
		"fixjson",
		"prettier",
	},
	auto_update = true,
	run_on_start = true,
})
