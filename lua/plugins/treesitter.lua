return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  opts = {
    ensure_installed = {"help", "javascript", "typescript", "cpp", "python", "c", "lua", "rust" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { "python" } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-Space>", -- set to `false` to disable one of the mappings
        node_incremental = "<C-Space>",
        scope_incremental = "<C-s>",
        node_decremental = "<C-backspace>",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.install").update({ with_sync = true })
    require("nvim-treesitter.configs").setup(opts)
  end,
}
