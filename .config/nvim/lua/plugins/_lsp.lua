local map = vim.keymap.set

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        map('n', 'K', ':Lspsaga hover_doc<CR>', opts)
        map('n', '<leader>rn', ':Lspsaga rename<CR>', opts)
        map('n', '<leader>fm', ':lua vim.lsp.buf.format()<CR>', opts)
        map('n', '<leader>ca', ':Lspsaga code_action<CR>', opts)
        map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
        map('n', 'gt', ':Lspsaga peek_type_definition<CR>', opts)
        map('n', 'gT', ':Lspsaga goto_type_definition<CR>', opts)
        map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
        map('n', 'gd', ':Lspsaga peek_definition<CR>', opts)
        map('n', 'gD', ':Lspsaga goto_definition<CR>', opts)
        map('n', 'gs', ':lua vim.lsp.buf.signature_help()<CR>', opts)
        map('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>', opts)
        map('n', ']d', ':Lspsaga diagnostic_jump_next<CR>', opts)
      end)

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { 'tsserver', 'rust_analyzer', 'lua_ls', 'clangd', 'cssls', 'tailwindcss', 'pyright', 'gopls' },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        },
      })
    end
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
  },

  {
    'williamboman/mason-lspconfig.nvim'
  },

  {
    'neovim/nvim-lspconfig',
    event = "BufReadPre",
  }
}
