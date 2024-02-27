return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.rust_analyzer.setup {
        settings = {
          cmd = {"/home/raul/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer"},
          ["rust-analyzer"] = {
            workspace = {
              symbol = {
                search = {
                  kind = "all_symbols"
                }
              }
            }
          },
        }
    }

      vim.keymap.set("n", "gh", vim.lsp.buf.hover, {}) 
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {})
    end,
  },
}
