-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "volar", "lua_ls", "ts_ls", "eslint" })

      local lspconfig = require "lspconfig"
      lspconfig["ts_ls"].setup {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/Users/leoniddanilov/.nodenv/versions/20.17.0/lib/node_modules/@vue/typescript-plugin",
              languages = { "javascript", "typescript", "vue" },
            },
          },
        },
        filetypes = {
          "javascript",
          "typescript",
          "vue",
        },
      }
    end,
    -- opts = {
    --   ensure_installed = {
    --     "lua_ls",
    --     "ts_ls",
    --     "eslint",
    --   },
    -- },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "stylua",
        "prettier",
        -- add more arguments for adding more null-ls sources
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        -- "python",
        -- add more arguments for adding more debuggers
      },
    },
  },
}
