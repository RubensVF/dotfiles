return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function(_, opts)
    -- Asegúrate de que los grupos de resaltado existan antes de configurar ibl
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#6272A4" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F1FA8C" })

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

    vim.api.nvim_set_hl(0, "IblScope", { fg = "#BD93F9" })
  end,
}
