return {
  -- Тема оформления
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },

  -- Git: графы и индикация
  { "kdheepak/lazygit.nvim", cmd = "LazyGit" },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
      })
    end,
  },

  -- Подсветка синтаксиса (Treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "python", "javascript", "typescript",
          "rust", "go", "c", "cpp", "json", "markdown", "html", "css"
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Проводник файлов
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { { "<C-e>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle Explorer" } },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
        renderer = { icons = { enabled = true } },
        actions = { open_file = { resize_window = true } },
      })
    end,
  },

  -- LSP + Автодополнение (Neovim 0.11+ API)
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Загрузка сниппетов
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Список языковых серверов
      local servers = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "rust_analyzer",
        "gopls",
        "html",
        "cssls",
        "jsonls",
        "eslint"
      }

      -- Настройка Mason для установки серверов
      require("mason").setup({
        PATH = "append",
        ensure_installed = servers,
      })

      -- Получение возможностей для автодополнения
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Нативная настройка LSP через vim.lsp.config (Neovim 0.11+)
      for _, server in ipairs(servers) do
        vim.lsp.config[server] = {
          capabilities = capabilities,
        }
        vim.lsp.enable(server)
      end

      -- Настройка автодополнения
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<C-e>"]     = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer", keyword_length = 3 },
          { name = "path" },
        }),
      })
    end,
  },
}
