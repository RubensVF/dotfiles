return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = true,
        -- otras opciones que quieras configurar
      })
      vim.cmd.colorscheme("kanagawa")
      -- Función para establecer grupos de resaltado transparentes
      local function set_transparent_bg(group)
        vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
      end
      -- Lista de grupos para hacer transparentes
      local groups = {
        "Normal",
        "NormalFloat",
        "NormalNC",
        "SignColumn",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "TelescopeNormal",
        "TelescopeBorder",
        "StatusLine",
        "StatusLineNC",
        "Folded",
        "VertSplit",
        "LineNr",
        "CursorLineNr",
        "EndOfBuffer",
        "Pmenu",
      }
      for _, group in ipairs(groups) do
        set_transparent_bg(group)
      end
      -- Asegúrate de que LineNr y CursorLineNr tengan colores de primer plano
      -- Nota: Estos colores son sugerencias basadas en la paleta de Kanagawa
      vim.api.nvim_set_hl(0, "LineNr", { fg = "#54546D", bg = "NONE" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#C8C093", bg = "NONE" })
    end,
  },
}
