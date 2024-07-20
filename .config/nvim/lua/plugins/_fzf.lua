local map = vim.keymap.set

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      'telescope',
      fzf_colors = true,
      defaults = { file_icons = false, prompt = " " },
      hls = {
        dir_part = "Normal",
        file_part = "Normal",
        header_bind = "Normal",
        header_text = "Bold",
      },
      fzf = {
        cursorline = "CursorLine",
        normal = "Normal",
        match = "Bold"
      }
    })
  end
}
