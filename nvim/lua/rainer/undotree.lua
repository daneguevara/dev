vim.keymap.set("n", "<leader>u", function()
  vim.cmd.UndoTreeToggle()
end, { desc = "Toggle [U]ndo Tree" })
