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
}
