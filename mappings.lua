-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- Override J behavior
    ["J"] = { "mzJ`z", desc = "Join lines" },
    -- Move selection up or down
    -- ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line down" },
    -- ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line up" },
    --
    -- RUST Debug
    ["<C-Space>"] = {
      require("rust-tools").hover_actions.hover_actions,
      desc = "Rust Hover actions",
    },

    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- Close current buffer
    ["<leader>q"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },

    -- Switch active buffer
    ["<S-l>"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc =
    "Next buffer" },
    ["<S-h>"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc =
    "Previous buffer" }
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-s>"] = { "<esc>:w!<cr>", desc = "Save File" }, -- Save and exit insert
  },
  v = {
    -- Move selection up or down
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line up" },
  }
}
