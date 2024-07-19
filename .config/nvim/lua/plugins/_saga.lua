return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    -- make sure to install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
  },
  config = function()
    require("lspsaga").setup({
      ui = {
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "rounded",
        winblend = 0,
        expand = ">",
        collapse = "-",
        code_action = "",
        incoming = "↓",
        outgoing = "↑",
        hover = "◌",
        kind = nil,
      },
      symbol_in_winbar = {
        enable = true,
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
  end,
}
