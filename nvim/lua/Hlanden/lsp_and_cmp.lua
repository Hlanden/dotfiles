-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
       vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- LSP settings and key mappings
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n' , 'gD'         , vim.lsp.buf.declaration             , bufopts)
  vim.keymap.set('n' , 'gd'         , vim.lsp.buf.definition              , bufopts)
  vim.keymap.set('n' , 'gr'         , vim.lsp.buf.references              , bufopts)
  vim.keymap.set('n' , 'K'          , vim.lsp.buf.hover                   , bufopts)
  vim.keymap.set('n' , 'gi'         , vim.lsp.buf.implementation          , bufopts)
  vim.keymap.set('n' , 'gs'         , vim.lsp.buf.signature_help          , bufopts)
  vim.keymap.set('n' , 'gt'         , vim.lsp.buf.type_definition         , bufopts)
  vim.keymap.set('n' , '<leader>wa' , vim.lsp.buf.add_workspace_folder    , bufopts)
  vim.keymap.set('n' , '<leader>wr' , vim.lsp.buf.remove_workspace_folder , bufopts)
  vim.keymap.set('n' , '<leader>wl' , function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n' , '<leader>rn' , vim.lsp.buf.rename                                 , bufopts)
  vim.keymap.set('n' , '<leader>ca' , vim.lsp.buf.code_action                            , bufopts)
  vim.keymap.set('n' , 'gf'         , function() vim.lsp.buf.format { async = true } end , bufopts)

  -- Available mappings:
  -- map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
  -- map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
  -- map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
  -- map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
  -- map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
  -- map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
  -- map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
  -- map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  -- map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  -- map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
  -- map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
  -- map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
  -- map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
  -- map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  -- map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
  -- map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig').pyright.setup { capabilities = capabilities, on_attach = on_attach }
require('lspconfig').clangd.setup  { capabilities = capabilities, on_attach = on_attach }
require('lspconfig').bashls.setup  { capabilities = capabilities, on_attach = on_attach }
require('lspconfig').lemminx.setup  { capabilities = capabilities, on_attach = on_attach , filetypes = { "xml", "xsd", "xsl", "xslt", "svg", "urdf", "xacro"}}
