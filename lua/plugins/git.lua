return {
  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, desc_)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, {desc = desc_})
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end, 'GoTo next change')

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end, 'GoTo previous change')

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, 'Git [h]unk [s]tage')
        map('n', '<leader>hr', gitsigns.reset_hunk, 'Git [h]unk [r]eset')

        map('v', '<leader>hs', function()
          gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, 'Git [h]unk [s]tage')

        map('v', '<leader>hr', function()
          gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, 'Git [h]unk [r]eset')

        map('n', '<leader>bs', gitsigns.stage_buffer, 'Git [b]uffer [s]tage')
        map('n', '<leader>br', gitsigns.reset_buffer, 'Git [b]uffer [r]eset')
        map('n', '<leader>hp', gitsigns.preview_hunk, 'Git [h]unk [p]review')
        map('n', '<leader>hi', gitsigns.preview_hunk_inline, 'Git [h]unk preview [i]nline')

        map('n', '<leader>hb', function()
          gitsigns.blame_line({ full = true })
        end, 'Git [h]unk [b]lame')

        map('n', '<leader>hd', gitsigns.diffthis, 'Git [h]unk [d]iff')

        map('n', '<leader>bd', function()
          gitsigns.diffthis('~')
        end, 'Git [b]uffer [d]iff')

        map('n', '<leader>qr', function() gitsigns.setqflist('all') end, 'Git [q]uick fix [r]epo')
        map('n', '<leader>qa', gitsigns.setqflist,  'Git [q]uick fix [a]ttached')

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, 'Git [t]oggle [b]lame')
        map('n', '<leader>tw', gitsigns.toggle_word_diff, 'Git [t]oggle [w]ord diff')

      -- Text object
      map({'o', 'x'}, 'ih', gitsigns.select_hunk, 'Git select [h]unk')
    end
    },
    event = "UIEnter"
  },
  {
    'tpope/vim-fugitive',
    event = "VeryLazy"
  },
  {
    'tpope/vim-rhubarb',
    event = "VeryLazy"
  }
}
