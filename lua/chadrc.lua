---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula-evondev",

  hl_override = {
    ["@comment"] = { fg = "#7f848e", italic = true },
    ["@doc"] = { fg = "#66fcf1", italic = true },
  },
}

vim.api.nvim_set_hl(0, "RustDocComment", { fg = "#66fcf1", italic = true })
vim.api.nvim_set_hl(0, "RustNormalComment", { fg = "#7f848e", italic = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.cmd("syntax clear")
    vim.fn.matchadd("RustNormalComment", [[\v^\s*//[^/].*$]])
    vim.fn.matchadd("RustDocComment", [[\v^\s*///.*$]])
  end,
})

return M

