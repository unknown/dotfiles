return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader><space>", "<cmd>Telescope find_files<cr>" },
    { "<leader>fg",      "<cmd>Telescope live_grep<cr>" },
    { "<leader>fb",      "<cmd>Telescope buffers<cr>" },
    { "<leader>fo",      "<cmd>Telescope oldfiles<cr>" },
  },
  config = function()
    require("telescope").setup({
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        live_grep = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      },
    })
  end,
}
