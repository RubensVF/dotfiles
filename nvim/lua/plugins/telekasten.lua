return {
  -- Otros plugins...

  {
    "renerocksai/telekasten.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telekasten").setup({
        home = vim.fn.expand("~/path/to/your/zettelkasten"), -- Cambia esto a la ruta de tu carpeta de notas
        take_over_my_home = true,
        auto_set_filetype = true,
        dailies = vim.fn.expand("~/path/to/your/zettelkasten/daily"), -- Cambia esto si usas una carpeta diferente para tus notas diarias
        weeklies = vim.fn.expand("~/path/to/your/zettelkasten/weekly"), -- Cambia esto si usas una carpeta diferente para tus notas semanales
        template_new_note = vim.fn.expand("~/path/to/your/templates/new_note.md"), -- Cambia esto si usas una plantilla para tus nuevas notas
        template_new_daily = vim.fn.expand("~/path/to/your/templates/daily.md"), -- Cambia esto si usas una plantilla para tus notas diarias
        template_new_weekly = vim.fn.expand("~/path/to/your/templates/weekly.md"), -- Cambia esto si usas una plantilla para tus notas semanales
        -- Otras configuraciones opcionales
      })
    end,
  },
  {
    "npxbr/glow.nvim",
    cmd = "Glow",
    config = function()
      require("glow")
    end,
  },

  -- Otros plugins...
}
