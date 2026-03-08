-- Initialize lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local result = vim.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }):wait()

  if result.code ~= 0 then
    error('Failed to clone lazy.nvim: ' .. (result.stderr or 'unknown error'))
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
  {
    spec = { import = 'plugins' },
    change_detection = { notify = false }
  }
)
