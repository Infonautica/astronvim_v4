-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        swapfile = false, -- disable swapfile
        scroll = 10,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        -- L = {
        --   function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        --   desc = "Next buffer",
        -- },
        -- H = {
        --   function() require("atsrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        --   desc = "Previous buffer",
        -- },

        -- These keys will be used by window manager
        ["<C-S-h>"] = { "<Nop>" },
        ["<C-S-j>"] = { "<Nop>" },
        ["<C-S-k>"] = { "<Nop>" },
        ["<C-S-l>"] = { "<Nop>" },
        ["<C-S-m>"] = { "<Nop>" },

        -- mappings seen under group name "Buffer"
        ["<leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

        -- Disable shift based navigation to favor <C-u> and <C-d>
        ["<S-Up>"] = { "<Nop>" },
        ["<S-Down>"] = { "<Nop>" },

        -- Disable arrows navigation
        ["<Up>"] = { "<Nop>" },
        ["<Down>"] = { "<Nop>" },
        ["<Left>"] = { "<Nop>" },
        ["<Right>"] = { "<Nop>" },

        ["<C-u>"] = { "10k", desc = "Jump 10 rows up" },
        ["<C-d>"] = { "10j", desc = "Jump 10 rows down" },

        -- Jump to the end of line
        ["<C-e>"] = { "$" },

        -- Navigate splits
        ["<Tab>"] = { ":wincmd w<CR>", desc = "Switch to next window" },
        ["<C-Left>"] = { "<C-W>h", desc = "Jump to the left split" },
        ["<C-Right>"] = { "<C-W>l", desc = "Jump to the right split" },
        ["<C-Up>"] = { "<C-W>k", desc = "Jump to the up split" },
        ["<C-Down>"] = { "<C-W>j", desc = "Jump to the down split" },

        -- Create splits
        ["\\"] = { "<Nop>" },
        ["\\\\"] = { ":vsplit<CR>", desc = "Split vertically" },
        ["--"] = { "<cmd>split<CR>", desc = "Split horizontally" },

        -- Resize splits
        ["<C-S-Left>"] = { ":vertical :resize -2<CR>", desc = "Increase width of the split" },
        ["<C-S-Right>"] = { ":vertical :resize +2<CR>", desc = "Decrease width of the split" },
        ["<C-S-Up>"] = { ":resize +2<CR>", desc = "Increase height of the split" },
        ["<C-S-Down>"] = { ":resize -2<CR>", desc = "Decrease height of the split" },

        -- Horizontal scroll
        ["<z-Left>"] = { ":normal 5zh", desc = "Scroll left" },
        ["<z-Right>"] = { ":normal 5zl", desc = "Scroll right" },

        -- Quick scope and jumping to a char
        -- ["<leader>j"]  = { "<plug>(QuickScopeToggle)" },
      },
      v = {
        ["<C-e>"] = { "$" },

        -- Disable shift based navigation to favor <C-u> and <C-d>
        ["<S-Up>"] = { "<Nop>" },
        ["<S-Down>"] = { "<Nop>" },
      },
      i = {
        ["<F1>"] = { 'copilot#Accept("<CR>")', silent = true, expr = true, replace_keycodes = false },
        ["<F2>"] = { "copilot#Next()", silent = true, expr = true },
        ["<F3>"] = { "copilot#Previous()", silent = true, expr = true },
      },
    },
  },
}
