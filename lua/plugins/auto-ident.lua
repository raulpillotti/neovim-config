return {
  {
    'vidocqh/auto-indent.nvim',
    config = function()
      require("auto-indent").setup({
        lightmode = true,
        indentexpr = nil,
        ignore_filetype = {},
      })
    end
  }
}
