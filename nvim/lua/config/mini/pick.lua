return function()
  local function pick_quickfix()
    local qf = vim.fn.getqflist({ id = 0, items = 1, title = 0 })
    local items = qf.items or {}
    if vim.tbl_isempty(items) then
      vim.notify("Quickfix list is empty", vim.log.levels.INFO)
      return
    end

    local entries = vim.tbl_map(function(item)
      local filename = item.bufnr > 0 and vim.api.nvim_buf_get_name(item.bufnr) or item.filename or ""
      filename = filename ~= "" and vim.fn.fnamemodify(filename, ":.") or "[No Name]"
      local text = (item.text or ""):gsub("^%s+", "")
      return {
        bufnr = item.bufnr,
        col = item.col,
        filename = filename,
        lnum = item.lnum,
        text = text,
      }
    end, items)

    MiniPick.start({
      source = {
        name = qf.title ~= "" and ("Quickfix: " .. qf.title) or "Quickfix",
        items = entries,
        choose = function(item)
          local target = item.bufnr > 0 and vim.api.nvim_buf_get_name(item.bufnr) or item.filename
          if target == nil or target == "" then
            return
          end

          vim.cmd("edit " .. vim.fn.fnameescape(target))
          vim.api.nvim_win_set_cursor(0, { item.lnum, math.max((item.col or 1) - 1, 0) })
        end,
      },
      format = function(item)
        return string.format("%s:%d:%d %s", item.filename, item.lnum or 1, item.col or 1, item.text)
      end,
    })
  end

  require("mini.pick").setup()

  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      vim.api.nvim_set_hl(0, "MiniPickNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "MiniPickBorder", { bg = "none" })
      vim.api.nvim_set_hl(0, "MiniPickPrompt", { bg = "none" })
      vim.api.nvim_set_hl(0, "MiniPickPreviewLine", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    end,
  })

  vim.api.nvim_exec_autocmds("ColorScheme", { pattern = vim.g.colors_name })

  vim.keymap.set("n", "<leader>pf", function()
    MiniExtra.pickers.git_files()
  end, { noremap = true, silent = true, desc = "Pick git files" })

  vim.keymap.set("n", "<leader>pg", function()
    MiniPick.builtin.grep_live()
  end, { noremap = true, silent = true, desc = "Live grep" })

  vim.keymap.set("n", "<leader>pb", function()
    MiniExtra.pickers.git_branches()
  end, { noremap = true, silent = true, desc = "Pick git branches" })

  vim.keymap.set("n", "<leader>pd", function()
    MiniExtra.pickers.diagnostic({ scope = "all" })
  end, { noremap = true, silent = true, desc = "Pick diagnostics" })

  vim.keymap.set("n", "<leader>ps", function()
    MiniExtra.pickers.lsp({ scope = "document_symbol" })
  end, { noremap = true, silent = true, desc = "Pick document symbols" })

  vim.keymap.set("n", "<leader>pS", function()
    MiniExtra.pickers.lsp({ scope = "workspace_symbol" })
  end, { noremap = true, silent = true, desc = "Pick workspace symbols" })

  vim.keymap.set("n", "<leader>pq", pick_quickfix, {
    noremap = true,
    silent = true,
    desc = "Pick quickfix items",
  })
end
