return {
  "dmmulroy/tsc.nvim",
  config = function()
    -- Config sample: https://github.com/dmmulroy/tsc.nvim/blob/main/lua/tsc/init.lua

    local utils = require('tsc.utils');
    require('tsc').setup({
      auto_open_qflist = true,
      enable_progress_notifications = true,
      flags = {
        noEmit = true,
        project = function()
          return utils.find_nearest_tsconfig()
        end,
      },
      hide_progress_notifications_from_history = true,
      spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
    });
  end,
  lazy = false
}
