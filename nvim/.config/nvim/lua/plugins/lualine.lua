return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          { "filename", path = 1 },
        },
        lualine_c = { "branch", "diff", },
        lualine_x = {},
        lualine_y = { "diagnostics" },
        lualine_z = { "location" },
      }
    })
  end,
}
