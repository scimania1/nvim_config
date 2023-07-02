return {
  {
    "xeluxee/competitest.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = "cpp",
    config = function(_, _)
      require("competitest").setup()
      vim.keymap.set("n", "<leader>ta", "<cmd>CompetiTestAdd<CR>")
      vim.keymap.set("n", "<leader>te", "<cmd>CompetiTestEdit<CR>")
      vim.keymap.set("n", "<leader>tr", "<cmd>CompetiTestRun<CR>")
    end,
  },
}
