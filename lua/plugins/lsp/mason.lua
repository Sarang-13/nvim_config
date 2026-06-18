return {
  {
    "williamboman/mason-lspconfig.nvim",

    opts = {
      ensure_installed = {
        "lua_ls",
        "clangd",
      },
    },

    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },

      "neovim/nvim-lspconfig",
    },

    config = function()
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("clangd")

      vim.opt.signcolumn = "yes"

    vim.diagnostic.config({
	virtual_text = true,
	 signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN]  = "▲",
            [vim.diagnostic.severity.INFO]  = "»",
            [vim.diagnostic.severity.HINT]  = "⚑",
        },
    },
	underline = true,
	update_in_insert = false,
	--        severity_sort = true,
    })


--      vim.fn.sign_define("DiagnosticSignError", { text = "✘" })
--      vim.fn.sign_define("DiagnosticSignWarn",  { text = "▲" })
--      vim.fn.sign_define("DiagnosticSignInfo",  { text = "»" })
--      vim.fn.sign_define("DiagnosticSignHint",  { text = "⚑" })

      vim.o.updatetime = 1000

      vim.api.nvim_create_autocmd("CursorHold" ,{
	  callback = function()
	      if #vim.diagnostic.get(0) > 0 then
		  vim.diagnostic.open_float(nil, {
		      focusable = false,
		      border = "rounded",
		  })
	      end
	  end,
      })
  end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    opts = {
      ensure_installed = {
        "prettier",
        "stylua",
        -- "clang-format",
      },
    },

    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
