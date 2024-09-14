return {
  -- Set up theme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme kanagawa]])
    end,
  },
  -- File tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      { "<leader>t", "<cmd>Neotree toggle<cr>" },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
      window = {
        position = "float"
      },
    },
  },
  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<cr>" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<cr>" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<cr>" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<cr>" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<cr>" },
      { "[b",         "<cmd>BufferLineCyclePrev<cr>" },
      { "]b",         "<cmd>BufferLineCycleNext<cr>" },
      { "[B",         "<cmd>BufferLineMovePrev<cr>" },
      { "]B",         "<cmd>BufferLineMoveNext<cr>" },
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
    end,
  },
  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  -- Vertical rulers
  {
    "lukas-reineke/virt-column.nvim",
    opts = {
      char = "▕",
      virtcolumn = "80,120",
    }
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      sections = {
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        }
      }
    },
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
}
