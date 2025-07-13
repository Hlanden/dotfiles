require("mason").setup()

local arch = vim.loop.os_uname().machine
local is_arm = string.find(arch:lower(), "arm") or string.find(arch:lower(), "aarch64")

local base_packages = {
	"pyright",
	"bashls",
	"rust_analyzer",
	"kotlin_language_server",
	"angularls",
	"biome",
	"vtsls",
	"cssls",
	"html",
	"ltex",
	"texlab",
	"terraformls",
	"tailwindcss",
	"powershell_es",
	-- "robotframework_ls",
	"lua_ls",
	"eslint",
	"harper_ls",
	"omnisharp",
}

-- Packages that only exists on AMD
local non_arm_packages = {
	"clangd",
	"lemminx",
}

local mason_packages = base_packages

if not is_arm then
	for _, pkg in ipairs(non_arm_packages) do
		mason_packages[#mason_packages + 1] = pkg
	end
end

require("mason-lspconfig").setup({
	ensure_installed = mason_packages,
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
