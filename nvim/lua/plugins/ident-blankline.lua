return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function(_, opts)
    local colors = require("kanagawa.colors").setup()

    vim.api.nvim_set_hl(0, "LineNr", { fg = colors.theme.ui.nontext })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.theme.ui.special })

    require("ibl").setup(vim.tbl_deep_extend("force", opts, {
      indent = {
        highlight = {
          "LineNr",
          "CursorLineNr",
        },
      },
      scope = {
        highlight = "IblScope",
      },
    }))

    vim.api.nvim_set_hl(0, "IblScope", { fg = colors.theme.syn.identifier })
  end,
}
