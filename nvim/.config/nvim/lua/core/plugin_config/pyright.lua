
require("lspconfig").pyright.setup {
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly", -- Cambia a "workspace" si quieres diagnósticos en todo el proyecto
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic", -- Puede ser "off", "basic" o "strict"
      },
    },
  },
}
