vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<Plug>(DBUI_JumpToForeignKey)', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('BufWinEnter', {
  buffer = 0,
  callback = function()
    local width = vim.api.nvim_win_get_width(0)

    -- if width > 100 then
    --   vim.cmd('wincmd L')
    -- end
  end,
})
