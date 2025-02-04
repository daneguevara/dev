local notify = require("notify")

notify.setup({
  timeout = 3000,
  render = "minimal",
  stages = "fade_in_slide_out",
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { focusable = false })
  end,
})
