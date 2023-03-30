return {
  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    config = function()
      require("scrollbar").setup()
    end,
  },
  {
    "neo-tree.nvim",
    config = function()
      require('neo-tree').setup({
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            open_on_setup = true,
            open_on_setup_file = false,
            -- hide_by_name = {
            --   "node_modules",
            --   "obj",
            --   "bin",
            -- },
          },
        }
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            "obj",
            "obj",
            "bin",
          }
        },
      })
    end
  },
}
