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
}
