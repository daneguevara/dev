for _, arg in pairs(vim.v.argv) do
  if arg == '-' then
    vim.g.startup_disable_on_startup = 1
  end
end

require('rainer')
require('local')

