local nix = require("nix_paths")

return {
  name = "nvim-treesitter",
  dir = nix.treesitter,
  lazy = false,
  priority = 1000,
  config = function()
    local treesitter = require("nvim-treesitter")

    for _, path in ipairs(nix.treesitter_parsers or {}) do
      vim.opt.rtp:append(path)
    end

    treesitter.setup({})

    local group = vim.api.nvim_create_augroup("NvimTreesitter", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      callback = function(event)
        local ok = pcall(vim.treesitter.start, event.buf)
        if not ok then
          return
        end

        vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
