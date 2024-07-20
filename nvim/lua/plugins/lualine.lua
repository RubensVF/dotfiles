return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    local colors = require("kanagawa.colors").setup().palette

    opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
      theme = {
        normal = {
          a = { bg = colors.fujiWhite, fg = colors.samuraiRed, gui = "bold" },
          b = { bg = colors.sumiInk1, fg = colors.fujiWhite },
          c = { bg = colors.sumiInk1, fg = colors.fujiWhite },
        },
        insert = { a = { bg = colors.springGreen, fg = colors.samuraiRed, gui = "bold" } },
        visual = { a = { bg = colors.oniViolet, fg = colors.samuraiRed, gui = "bold" } },
        replace = { a = { bg = colors.autumnRed, fg = colors.samuraiRed, gui = "bold" } },
        command = { a = { bg = colors.boatYellow2, fg = colors.samuraiRed, gui = "bold" } },
        inactive = {
          a = { bg = colors.sumiInk4, fg = colors.fujiWhite },
          b = { bg = colors.sumiInk4, fg = colors.fujiWhite },
          c = { bg = colors.sumiInk4, fg = colors.fujiWhite },
        },
      },
    })

    -- Añadir la ruta del archivo a la sección central de lualine
    opts.sections = vim.tbl_deep_extend("force", opts.sections or {}, {
      lualine_c = {
        { "filename", path = 1, file_status = true, color = { fg = colors.fujiWhite, bg = colors.sumiInk1 } }, -- Ajuste de colores para mejorar la visibilidad
      },
    })

    return opts
  end,
}
