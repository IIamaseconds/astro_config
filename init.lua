return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "astrodark",
  -- default_theme = {
  --   colors = {
  --     bg = "red",
  --   },
  -- },
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }

    -- Styling
    vim.cmd "set winblend=10"

    -- Reset neotree size on close
    local dap = require "dap"

    local events = require "neo-tree.events"
    events.subscribe {
      event = events.NEO_TREE_WINDOW_AFTER_CLOSE,
      handler = function()
        if require("dap").session() then
          require("dapui").open {
            reset = true
          }
        end
      end
    }
    dap.listeners.before.event_initialized["place-neotree-edge"] = function()
      vim.cmd ":Neotree close"
      vim.cmd ":Neotree reveal"
    end
    dap.listeners.after.event_terminated["reset-neotree"] = function()
      vim.cmd ":Neotree focus"
      vim.cmd "wincmd 45|"
      vim.cmd "wincmd p"
    end

    -- Temp fix for OmniSharp not supporting camelCase
    -- vim.api.nvim_create_autocmd("LspAttach", {
    --   callback = function(ev)
    --     local client = vim.lsp.get_client_by_id(ev.data.client_id)
    --     local function toSnakeCase(str)
    --       return string.gsub(str, "%s*[- ]%s*", "_")
    --     end
    --
    --     if client.name == 'omnisharp' then
    --       local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
    --       for i, v in ipairs(tokenModifiers) do
    --         tokenModifiers[i] = toSnakeCase(v)
    --       end
    --       local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
    --       for i, v in ipairs(tokenTypes) do
    --         tokenTypes[i] = toSnakeCase(v)
    --       end
    --     end
    --   end,
    -- })
  end,
}
