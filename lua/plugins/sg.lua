return {
  {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
      require('sg').setup()
    end,
  },
}
