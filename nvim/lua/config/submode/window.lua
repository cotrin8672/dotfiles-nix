return function(sm)
  local shared = require("config.submode.shared")

  local window_sm = sm.build_submode({
    name = "WINDOW",
    display_name = "WINDOW",
    color = "#7DAEA3",
    timeoutlen = vim.o.timeoutlen,
    after_enter = function()
      shared.refresh_ui()
      shared.open_window_hint()
    end,
    after_leave = function()
      shared.refresh_ui()
      shared.close_window_hint()
    end,
  }, {
    { "h", "<C-w>h" },
    { "j", "<C-w>j" },
    { "k", "<C-w>k" },
    { "l", "<C-w>l" },
    { "s", "<C-w>s" },
    { "v", "<C-w>v" },
    { "+", "<C-w>+" },
    { "-", "<C-w>-" },
    { ">", "<C-w>>" },
    { "<", "<C-w><" },
    { "x", "<C-w>c" },
    {
      "q",
      function()
        return "", sm.EXIT_SUBMODE
      end,
    },
    {
      "<Esc>",
      function()
        return "", sm.EXIT_SUBMODE
      end,
    },
  })

  vim.keymap.set("n", "<leader>w", function()
    sm.enable(window_sm)
  end, { desc = "Window submode" })
end
