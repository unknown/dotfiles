return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = { 
    { "<leader>ff", ":Telescope find_files<cr>" },
    { "<leader>fg", ":Telescope live_grep<cr>" },
    { "<leader>fo", ":Telescope oldfiles<cr>" },
  },
}
