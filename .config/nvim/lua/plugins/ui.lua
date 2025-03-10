return {
  -- Set up theme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- transparent = true,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
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
      { "<leader>1",  "<cmd>BufferLineGoToBuffer 1<cr>" },
      { "<leader>2",  "<cmd>BufferLineGoToBuffer 2<cr>" },
      { "<leader>3",  "<cmd>BufferLineGoToBuffer 3<cr>" },
      { "<leader>4",  "<cmd>BufferLineGoToBuffer 4<cr>" },
      { "<leader>5",  "<cmd>BufferLineGoToBuffer 5<cr>" },
      { "<leader>6",  "<cmd>BufferLineGoToBuffer 6<cr>" },
      { "<leader>7",  "<cmd>BufferLineGoToBuffer 7<cr>" },
      { "<leader>8",  "<cmd>BufferLineGoToBuffer 8<cr>" },
      { "<leader>9",  "<cmd>BufferLineGoToBuffer 9<cr>" },
      { "<leader>-",  "<cmd>BufferLineGoToBuffer -1<cr>" },
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
  -- Vertical rulers
  {
    "lukas-reineke/virt-column.nvim",
    opts = {
      char = "▕",
      virtcolumn = "100",
    }
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = {
          -- disable separators
          component_separators = "",
          section_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            { "filename", path = 1 },
          },
          lualine_x = {},
          lualine_y = { "diff", "diagnostics" },
          lualine_z = { "location" },
        }
      })
    end,
  },
}
