return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = "VeryLazy",
    opts = {
      spelling = {
        enabled = true,
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "UIEnter",
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_x = {
          'status',
          'encoding',
          'fileformat',
          'filetype'
        },
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },
}
