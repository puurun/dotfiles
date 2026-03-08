local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('basedpyright', utils.with_capabilities(capabilities, {
    root_markers = {
      { 'uv.lock', 'pyproject.toml' },
      { '.git' },
    },
    settings = {
      basedpyright = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = 'workspace',
          useLibraryCodeForTypes = true,
          typeCheckingMode = 'basic',
        },
      },
    },
  }))
  vim.lsp.enable('basedpyright')
end

return M
