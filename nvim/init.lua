local stdin_mode = false

for _, arg in pairs(vim.v.argv) do
  if arg == '-' then
    stdin_mode = true
  end
end

if stdin_mode then
  vim.g.startup_disable_on_startup = 1
end

require('rainer')
