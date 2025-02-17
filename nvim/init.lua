for _, arg in pairs(vim.v.argv) do
  if arg == "-" then
    vim.g.startup_disable_on_startup = 1
  end
end

require("rainer")

function import_local()
  require("local")
end

if pcall(import_local) then
  print("Local config loaded")
else
  print("No local config found")
end
