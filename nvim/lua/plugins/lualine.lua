return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    local colors = require("dracula").colors()
    opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
      theme = {
        normal = {
          a = { bg = colors.purple, fg = colors.black, gui = "bold" },
          b = { bg = "NONE", fg = colors.fg },
          c = { bg = "NONE", fg = colors.fg },
        },
        insert = { a = { bg = colors.green, fg = colors.black, gui = "bold" } },
        visual = { a = { bg = colors.pink, fg = colors.black, gui = "bold" } },
        replace = { a = { bg = colors.red, fg = colors.black, gui = "bold" } },
        command = { a = { bg = colors.orange, fg = colors.black, gui = "bold" } },
        inactive = {
          a = { bg = "NONE", fg = colors.comment },
          b = { bg = "NONE", fg = colors.comment },
          c = { bg = "NONE", fg = colors.comment },
        },
      },
    })

    -- Añadir la ruta del archivo a la sección central de lualine
    opts.sections = vim.tbl_deep_extend("force", opts.sections or {}, {
      lualine_c = {
        { "filename", path = 1, file_status = true }, -- Muestra la ruta completa
      },
    })

    return opts
  end,
}
