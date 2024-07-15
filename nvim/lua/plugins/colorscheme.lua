return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup({
        transparent_bg = true,
        -- otras opciones que quieras configurar
      })

      vim.cmd.colorscheme("dracula")

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
      vim.api.nvim_set_hl(0, "LineNr", { fg = "#6272A4", bg = "NONE" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F1FA8C", bg = "NONE" })
    end,
  },
}
