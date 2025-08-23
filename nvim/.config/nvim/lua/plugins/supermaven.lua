return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  config = function()
    require("supermaven-nvim").setup({
      log_level = "off",
    })
  end,
  keys = {
    { "<leader>sm", "<cmd>SupermavenToggle<cr>" },
  },
}
