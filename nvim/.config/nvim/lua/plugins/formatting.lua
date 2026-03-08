return {
  {
    -- Formatter runner with format-on-save.
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      format_on_save = nil,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_format' },
        rust = { 'rustfmt' },
      },
    },
  },
}
