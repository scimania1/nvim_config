return {
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {
      dimInactive = true,
      keywordStyle = { italic = false, bold = true },
      statementStyle = { bold = false, italic = true },
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      require("kanagawa").load()
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "storm",
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = {
      no_italic = false,
      dim_inactive = {
        enabled = true,
        percentage = 0.3,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd("colorscheme catppuccin")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    opts = {
      disable_italics = true,
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "ribru17/bamboo.nvim",
    lazy = true,
    config = function(_, _)
      require("bamboo").load()
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    opts = {
      options = {
        transparent = false,
      },
    },
    config = function(_, opts)
      require("nightfox").setup(opts)
      vim.cmd("colorscheme nightfox")
    end,
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    opts = {
      style = "darker",
    },
    config = function(_, _)
      -- require("onedark").setup(opts)
      require("onedark").load()
    end,
  },
}
