require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

lspconfig.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = { command = "cargo check" },  -- Использование clippy для быстрой проверки
      assist = { importMerge = "last" },     -- Мержим импорты в последнем месте
      cargo = { allFeatures = true },        -- Включение всех фич в Cargo
    },
  },
  flags = {
    debounce_text_changes = 0, 
  },
}

lspconfig.clangd.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  flags = {
    debounce_text_changes = 0,  
  },
}
