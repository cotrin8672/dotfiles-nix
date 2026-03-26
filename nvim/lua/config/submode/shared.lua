local M = {}

local window_hint_ns = vim.api.nvim_create_namespace("window_submode_hint")
local debug_hint_ns = vim.api.nvim_create_namespace("debug_submode_hint")

local window_hint_buf = nil
local window_hint_win = nil
local debug_hint_buf = nil
local debug_hint_win = nil

function M.refresh_ui()
  local ok_cursor, cursor_mode = pcall(require, "ui.cursor_mode")
  if ok_cursor and type(cursor_mode.refresh) == "function" then
    cursor_mode.refresh()
  end

  vim.schedule(function()
    local ok, lualine = pcall(require, "lualine")
    if ok then
      lualine.refresh()
    end
  end)
end

function M.close_window_hint()
  if window_hint_win and vim.api.nvim_win_is_valid(window_hint_win) then
    vim.api.nvim_win_close(window_hint_win, true)
  end
  window_hint_win = nil
  window_hint_buf = nil
end

function M.open_window_hint()
  M.close_window_hint()

  local lines = {
    " h │ Focus left",
    " j │ Focus down",
    " k │ Focus up",
    " l │ Focus right",
    " s │ Split (horizontal)",
    " v │ Split (vertical)",
    " + │ Increase height",
    " - │ Decrease height",
    " > │ Increase width",
    " < │ Decrease width",
    " x │ Close window",
    " q │ Exit WINDOW mode",
  }

  window_hint_buf = vim.api.nvim_create_buf(false, true)
  vim.bo[window_hint_buf].buftype = "nofile"
  vim.bo[window_hint_buf].bufhidden = "wipe"
  vim.bo[window_hint_buf].swapfile = false
  vim.bo[window_hint_buf].modifiable = true
  vim.api.nvim_buf_set_lines(window_hint_buf, 0, -1, false, lines)
  for i = 1, #lines do
    vim.api.nvim_buf_add_highlight(window_hint_buf, window_hint_ns, "MiniClueNextKey", i - 1, 1, 2)
    vim.api.nvim_buf_add_highlight(window_hint_buf, window_hint_ns, "MiniClueSeparator", i - 1, 3, 6)
  end
  vim.bo[window_hint_buf].modifiable = false

  local width = 34
  local height = #lines
  local col = math.max(vim.o.columns - width - 2, 0)
  window_hint_win = vim.api.nvim_open_win(window_hint_buf, false, {
    relative = "editor",
    row = 3,
    col = col,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
    title = " WINDOW Mode ",
    title_pos = "center",
  })
end

function M.close_debug_hint()
  if debug_hint_win and vim.api.nvim_win_is_valid(debug_hint_win) then
    vim.api.nvim_win_close(debug_hint_win, true)
  end
  debug_hint_win = nil
  debug_hint_buf = nil
end

function M.open_debug_hint()
  M.close_debug_hint()

  local lines = {
    " c │ Continue / Start",
    " n │ Step over",
    " i │ Step into",
    " o │ Step out",
    " b │ Toggle breakpoint",
    " B │ Conditional breakpoint",
    " l │ Run last",
    " r │ Toggle REPL",
    " t │ Terminate session",
    " u │ Toggle DAP UI",
    " q │ Exit DEBUG mode",
  }

  debug_hint_buf = vim.api.nvim_create_buf(false, true)
  vim.bo[debug_hint_buf].buftype = "nofile"
  vim.bo[debug_hint_buf].bufhidden = "wipe"
  vim.bo[debug_hint_buf].swapfile = false
  vim.bo[debug_hint_buf].modifiable = true
  vim.api.nvim_buf_set_lines(debug_hint_buf, 0, -1, false, lines)
  for i = 1, #lines do
    vim.api.nvim_buf_add_highlight(debug_hint_buf, debug_hint_ns, "MiniClueNextKey", i - 1, 1, 2)
    vim.api.nvim_buf_add_highlight(debug_hint_buf, debug_hint_ns, "MiniClueSeparator", i - 1, 3, 6)
  end
  vim.bo[debug_hint_buf].modifiable = false

  local width = 38
  local height = #lines
  local col = math.max(vim.o.columns - width - 2, 0)
  debug_hint_win = vim.api.nvim_open_win(debug_hint_buf, false, {
    relative = "editor",
    row = 3,
    col = col,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
    title = " DEBUG Mode ",
    title_pos = "center",
  })
end

return M
