return {
  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    config = function()
      require("scrollbar").setup({
        show_in_active_only = false,
        max_lines = false,
        handle = {
          highlight = "CursorColumn",
        },
        handlers = {
          cursor = true,
        }
      })
    end,
  },
  {
    "neo-tree.nvim",
    config = function()
      require('neo-tree').setup({
        filesystem = {
          filtered_items = {
            visible = true,
            hide_hidden = true,
            hide_dotfiles = true,
            hide_gitignored = false,
            open_on_setup = true,
            open_on_setup_file = true,
            hide_by_name = {
              "node_modules",
              "obj",
              "bin",
              ".git",
              ".github"
            },
            always_show = {
              -- "user"
            }
          },
          follow_current_file = true,
        },
      })
    end,
  }
}
