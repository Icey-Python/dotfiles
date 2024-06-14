require("conform").setup({
  formatters_on_save = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
