return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    debug = false,
    sources = {
      require("null-ls").builtins.formatting.prettier.with({ extra_args = {} }),
      require("null-ls").builtins.formatting.stylua,
    },
  },
}