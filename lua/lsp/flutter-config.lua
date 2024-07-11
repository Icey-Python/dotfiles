require('flutter-tools').setup({
  flutter_path = "/home/kelly/snap/flutter/common/flutter/bin/flutter", -- <-- this is the path to your flutter installation

  lsp = {
    on_attach = function(client, bufnr)
      -- This callback is called when the LSP is started
      -- (useful in case where a language server refuses to start).
      -- Add your on_attach callback here
    end
  }
})
