return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    lazy = true,
    config = false,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },

  -- Pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Autocompletion
  {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    opts = {
      keymap = {
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },

        ["<Cr>"] = {
          function(cmp)
            if cmp.is_in_snippet() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback"
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },
      highlight = {
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = "mono",
      -- experimental features
      trigger = { signature_help = { enabled = true } },
    },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    opts = {
      autoformat = true,
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      -- lsp_attach is where you enable features that only work
      -- if there is a language server active in the file
      local lsp_attach = function(_, bufnr)
        local opts = { buffer = bufnr }

        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        vim.keymap.set("n", "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
      end

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
      })

      -- `format_on_save` should run only once, before the language servers are active.
      lsp_zero.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ["lua_ls"] = { "lua" },
          ["ruff_lsp"] = { "python" },
          ["biome"] = { "javascript", "typescript", "json", "svelte" },
          ["rust_analyzer"] = { "rust" },
          ["gopls"] = { "go" },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "biome",
          "lua_ls",
          "pyright",
          "ruff_lsp",
          "typos_lsp",
        },
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,

          lua_ls = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = {
                    -- get the LSP to recognize the `vim` global
                    globals = { "vim" },
                  },
                },
              },
            })
          end,

          -- use Ruff for linting, formatting, and organizing imports
          pyright = function()
            require("lspconfig").pyright.setup({
              settings = {
                pyright = {
                  -- using Ruff's import organizer
                  disableOrganizeImports = true,
                },
                python = {
                  analysis = {
                    -- ignore all files for analysis to exclusively use Ruff for linting
                    ignore = { "*" },
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },
}
