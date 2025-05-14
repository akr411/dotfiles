return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "rounded",
          scrollbar = false,
        },
        documentation = {
          window = {
            border = "rounded",
            scrollbar = false,
          },
        },
        ghost_text = {
          enabled = false,
          show_with_menu = false,
        },
      },
      keymap = {
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-p>"] = {},
        ["<C-n>"] = {},
      },
    },
  },
}
