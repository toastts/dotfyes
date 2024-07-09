return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      ui = {
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "rounded",
        winblend = 0,
        expand = ">",
        collapse = "-",
        code_action = "💡",
        incoming = "↓",
        outgoing = "↑",
        hover = "◌",
        kind = nil,
      },
      symbol_in_winbar = {
        enable = false,
        separator = "",
        color_mode = false,
      },
      code_action = {
        show_server_name = true,
        extend_gitsigns = false,
        keys = {
          -- string | table type
          quit = { "q", "<ESC>" },
        },
      },
      definition = {
        edit = "e",
        vsplit = "v",
        split = "s",
        quit = { "q", "<ESC>" },
      },
    })
    local map = vim.keymap.set
    map("n", "<Leader>ft", "<cmd>Lspsaga term_toggle<CR>")
    map("t", "<Leader>ft", "<cmd>Lspsaga term_toggle<CR>")
  end,
  dependencies = {
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
  },
}
