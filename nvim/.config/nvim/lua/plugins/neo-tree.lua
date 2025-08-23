return {
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
        never_show = {
          ".DS_Store",
        }
      },
    },
    window = {
      position = "float"
    },
  },
}
