-- SET UP FOR LAZY
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ts = require('nvim-treesitter.configs')
    ts.setup({
      ensure_installed = { "c", "lua", "bash", "cpp", "css", "fish", "git_config", "go", "html", "markdown", "markdown_inline", "norg", "rust", "scss", "verilog", "typescript", "tsx", "javascript" },
      auto_install = true,
      sync_install = false,
      indent = { enable = true },
      highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}
