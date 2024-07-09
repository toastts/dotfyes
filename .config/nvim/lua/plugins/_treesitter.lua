-- SET UP FOR LAZY
return {
"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
          ensure_installed = { "c", "lua", "javascript", "html", "rust", "cpp", "diff", "css", "bash", "html", "vim", "vimdoc" },
          highlight = {
            enable = true,
            use_languagetree = true
          },
          indent = { enable = true },
        },
 }
