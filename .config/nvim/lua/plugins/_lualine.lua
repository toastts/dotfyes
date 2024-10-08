-- SET UP FOR LAZY
-- NEED TO FIX HOW MESSY IT IS
return {
  "hoob3rt/lualine.nvim",
  lazy = false,
  config = function()
    local lualine = require("lualine")
    -- Color table for highlights
    -- stylua: ignore
    local colors = {
      fg       = "#161615",
      fg1      = "#353431",
      fg2      = "#7f7e77",
      bg       = "#fff9ed",
      bg1      = "#fff4d5",
      bg2      = "#ffecbc",
      yellow   = '#f0c000',
      cyan     = '#389f8f',
      darkblue = '#081633',
      green    = '#63c174',
      orange   = '#ad5700',
      violet   = '#a9a1e1',
      magenta  = '#c678dd',
      blue     = '#70b8ff',
      red      = '#f16a50',
      pink     = '#ffccff'
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = "",
        section_separators = "",
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = colors.bg, bg = colors.fg } },
          inactive = { c = { fg = colors.bg, bg = colors.fg1 } },
        },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x ot right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left({
      -- mode component
      function()
        return "████"
      end,
      color = function()
        -- auto change color according to neovims mode
        local mode_color = {
          n = colors.pink,
          i = colors.yellow,
          v = colors.violet,
          [""] = colors.violet,
          V = colors.magenta,
          c = colors.blue,
          no = colors.bg,
          s = colors.bg,
          S = colors.bg,
          [""] = colors.bg,
          ic = colors.bg,
          R = colors.red,
          Rv = colors.red,
          cv = colors.bg,
          ce = colors.bg,
          r = colors.bg,
          rm = colors.bg,
          ["r?"] = colors.bg,
          ["!"] = colors.bg,
          t = colors.bg,
        }
        return { fg = mode_color[vim.fn.mode()] }
      end,
      padding = { left = 1, right = 1 },
    })

    ins_left({
      -- filesize component
      "filesize",
      cond = conditions.buffer_not_empty,
      color = { fg = colors.fg2 },
    })

    ins_left({
      "filename",
      cond = conditions.buffer_not_empty,
      color = { fg = colors.bg, gui = "bold" },
    })

    ins_left({ "location", color = { fg = colors.fg2 } })

    ins_left({ "progress", color = { fg = colors.fg2 } })

    ins_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = {
        error = ' ',
        warn = ' ',
        hint = ' ',
        info = ' '
      },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.blue },
      },
    })

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    ins_left({
      function()
        return "%="
      end,
    })

    ins_left({
      -- Lsp server name
      function()
        local msg = 'no active lsp!!?! (this might be normal)'
        local clients = vim.lsp.get_clients({ bufnr = 0 })

        if clients == nil or #clients == 0 then
          return msg
        end

        local client_names = {}
        for _, client in pairs(clients) do
          table.insert(client_names, client.name)
        end

        return table.concat(client_names, ', ')
      end,
      color = { fg = '#ffffff', gui = 'bold' },
    })


    -- Add components to right sections
    ins_right({
      "o:encoding",       -- option component same as &encoding in viml
      fmt = string.upper, -- I'm not sure why it's upper case either ;)
      cond = conditions.hide_in_width,
      color = { fg = colors.fg2 },
    })

    ins_right({
      "fileformat",
      fmt = string.upper,
      icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
      color = { fg = colors.bg1, gui = "bold" },
    })

    ins_right({
      "diff",
      -- Is it me or the symbol for modified us really weird
      symbols = { added = "█", modified = "█", removed = "█" },
      diff_color = {
        added = 'LuaLineDiffAdd',
        modified = 'LuaLineDiffChange',
        removed = 'LuaLineDiffDelete',
      },
      cond = conditions.hide_in_width,
      source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end,
    })

    ins_right({
      "branch",
      icon = "",
      color = { fg = colors.bg, gui = "bold" },
    })


    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end,
}
