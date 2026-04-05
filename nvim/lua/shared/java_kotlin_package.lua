local M = {}

local group = vim.api.nvim_create_augroup("JavaKotlinPackage", { clear = true })

local function infer_package_name(path)
  local normalized = path:gsub("\\", "/")
  local package_path = normalized:match("/src/main/java/(.+)/[^/]+$")
    or normalized:match("/src/main/kotlin/(.+)/[^/]+$")
    or normalized:match("/src/test/java/(.+)/[^/]+$")
    or normalized:match("/src/test/kotlin/(.+)/[^/]+$")

  if not package_path then
    return nil
  end

  return package_path:gsub("/", ".")
end

function M.setup()
  vim.api.nvim_create_autocmd("BufNewFile", {
    group = group,
    pattern = { "*.java", "*.kt" },
    callback = function(event)
      local package_name = infer_package_name(event.match)
      if not package_name then
        return
      end

      local lines = vim.api.nvim_buf_get_lines(event.buf, 0, -1, false)
      if #lines > 1 or lines[1] ~= "" then
        return
      end

      vim.api.nvim_buf_set_lines(event.buf, 0, -1, false, {
        ("package %s"):format(package_name),
        "",
      })
      vim.api.nvim_win_set_cursor(0, { 3, 0 })
    end,
  })
end

return M
