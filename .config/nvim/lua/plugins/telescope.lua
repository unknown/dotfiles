return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader><space>", "<cmd>Telescope find_files<cr>" },
    { "<leader>ff",      "<cmd>Telescope find_files<cr>" },
    { "<leader>fg",      "<cmd>Telescope live_grep<cr>" },
    { "<leader>fb",      "<cmd>Telescope buffers<cr>" },
    { "<leader>fo",      "<cmd>Telescope oldfiles<cr>" },
  },
}
