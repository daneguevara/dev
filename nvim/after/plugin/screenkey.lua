local screenkey = require("screenkey")
local notify = require("notify")

local function toggle_screenkey()
  vim.cmd("Screenkey toggle")
  notify.setup({
    top_down = screenkey.is_active(),
  })
end

vim.keymap.set("n", "<leader>sk", toggle_screenkey, { desc = "Toggle Screenkey" })
