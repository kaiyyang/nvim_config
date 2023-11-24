-- Setup language servers.
local lspconfig = require('lspconfig')
-- lspconfig.tsserver.setup {}

lspconfig.clangd.setup {}
lspconfig.pyright.setup {}
lspconfig.gopls.setup {}
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>de', vim.diagnostic.open_float, { desc="show error" })
vim.keymap.set('n', '<space>dn', vim.diagnostic.goto_prev, { desc="go to next error" })
vim.keymap.set('n', '<space>dN', vim.diagnostic.goto_next, { desc="go to prev error" })
vim.keymap.set('n', '<space>dq', vim.diagnostic.setloclist, { desc="add diags to loc list"})
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
--  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover,{ buffer = ev.buf , desc = "hover"})
--  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = ev.buf , desc="signature help"})
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.add_workspace_folder, { buffer = ev.buf , desc="add workspace folder"})
    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.remove_workspace_folder,{ buffer = ev.buf, desc="remove workspace folder"})
    vim.keymap.set('n', '<leader>ll', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = ev.buf , desc="list workspace folders"})
--  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename,{ buffer = ev.buf , desc="rename symbol"})
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf , desc="code action"})
--  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>lf', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = ev.buf , desc="format code"})
  end,
})
