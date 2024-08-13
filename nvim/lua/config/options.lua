local opt = vim.opt

opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.cursorline = true                                   -- Enable highlighting of the current line
opt.expandtab = true                                    -- Use spaces instead of tabs
opt.ignorecase = true                                   -- Ignore case
opt.relativenumber = true                               -- Relative line numbers
opt.scrolloff = 4                                       -- Lines of context
opt.shiftwidth = 2                                      -- Size of an indent
opt.sidescrolloff = 8                                   -- Columns of context
opt.smartcase = true                                    -- Don't ignore case with capitalscontext
opt.smartindent = true                                  -- Insert indents automatically
opt.tabstop = 2                                         -- Number of spaces tabs count for
opt.termguicolors = true                                -- True color support
