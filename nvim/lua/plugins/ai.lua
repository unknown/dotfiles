return {
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = {
  --         auto_trigger = true,
  --       },
  --     })
  --   end,
  -- },
  {
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
  },
}
