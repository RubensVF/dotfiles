return {
  "mistweaverco/kulala.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local kulala = require("kulala")
    local M = {}
    local indicator_win = nil
    local indicator_buf = nil

    local function is_http_file()
      local current_buf = vim.api.nvim_get_current_buf()
      local file_type = vim.bo[current_buf].filetype
      return file_type == "http"
    end

    local function get_buffer_dimensions()
      local win = vim.api.nvim_get_current_win()
      local width = vim.api.nvim_win_get_width(win)
      local height = vim.api.nvim_win_get_height(win)
      return width, height
    end

    local function create_indicator()
      if not is_http_file() then
        return
      end

      local width = 7
      local height = 1
      local buf_width, buf_height = get_buffer_dimensions()
      local row = math.floor((buf_height - height) / 2)
      local col = math.floor((buf_width - width) / 2)

      indicator_buf = vim.api.nvim_create_buf(false, true)
      local current_env = string.lower(vim.g.kulala_selected_env or "unknown")
      if current_env == "local" then
        current_env = "localhost"
      end
      local env_config = {
        localhost = { emoji = "🏠", text = "LOCAL", fg = "#7E9CD8", bg = "#223249" }, -- springViolet1, sumiInk3
        dev = { emoji = "🛠️", text = "DEV", fg = "#98BB6C", bg = "#2D4F67" }, -- springGreen, winterGreen
        prod = { emoji = "🚨", text = "PROD", fg = "#FF5D62", bg = "#43242B" }, -- peachRed, autumnRed
      }
      local env_info = env_config[current_env]
        or { emoji = "❓", text = string.upper(current_env), fg = "#DCD7BA", bg = "#1F1F28" } -- fujiWhite, sumiInk0

      local indicator_text = env_info.emoji .. " " .. env_info.text
      local padded_text = string.rep(" ", math.floor((width - #indicator_text) / 2))
        .. indicator_text
        .. string.rep(" ", math.ceil((width - #indicator_text) / 2))

      vim.api.nvim_buf_set_lines(indicator_buf, 0, -1, false, { padded_text })

      local win = vim.api.nvim_get_current_win()
      indicator_win = vim.api.nvim_open_win(indicator_buf, false, {
        relative = "win",
        win = win,
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        focusable = false,
      })

      -- Aplicar colores
      vim.api.nvim_set_hl(0, "CustomEnvColor", { fg = env_info.fg, bg = env_info.bg, bold = true })

      -- Usar vim.wo para establecer el resaltado de la ventana
      vim.wo[indicator_win].winhighlight = "Normal:CustomEnvColor"

      -- Aplicar resaltado al texto
      vim.api.nvim_buf_add_highlight(indicator_buf, -1, "CustomEnvColor", 0, 0, -1)

      -- Hacer el fondo semi-transparente
      vim.wo[indicator_win].winblend = 30
    end

    function M.update_indicator()
      if indicator_win and vim.api.nvim_win_is_valid(indicator_win) then
        vim.api.nvim_win_close(indicator_win, true)
      end
      if is_http_file() then
        create_indicator()
      end
    end

    local function switch_environment()
      kulala.set_selected_env()
    end

    vim.keymap.set("n", "<leader>Re", switch_environment, { desc = "Cambiar entorno" })

    kulala.setup({
      default_env = "dev",
      additional_curl_options = {
        "--insecure",
      },
      on_change = function(env)
        vim.notify("Cambiado al entorno: " .. env)
        M.update_indicator()
      end,
    })

    -- Actualizar el indicador cuando se cambia de buffer, se inicia Neovim, se cambia el tamaño de la ventana o se mueve el cursor
    vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter", "VimResized", "CursorMoved", "CursorMovedI" }, {
      callback = function()
        M.update_indicator()
      end,
    })

    -- Actualizar el indicador cuando se cambia el tipo de archivo
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        M.update_indicator()
      end,
    })
  end,
}
