local opt = vim.opt

opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.cursorline = true                                   -- Enable highlighting of the current line
opt.expandtab = true                                    -- Use spaces instead of tabs
opt.ignorecase = true                                   -- Ignore case
opt.number = true                                       -- Print line number
opt.relativenumber = true                               -- Relative line numbers
opt.scrolloff = 4                                       -- Lines of context
opt.shiftwidth = 2                                      -- Size of an indent
opt.sidescrolloff = 8                                   -- Columns of context
opt.smartcase = true                                    -- Don't ignore case with capitalscontext
opt.smartindent = true                                  -- Insert indents automatically
opt.tabstop = 4                                         -- Number of spaces tabs count for
opt.termguicolors = true                                -- True color support

local function is_ssh()
  return os.getenv("SSH_CONNECTION") ~= nil
end

if is_ssh() then
  local osc52 = require("vim.ui.clipboard.osc52")
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = osc52.copy("+"),
      ["*"] = osc52.copy("*"),
    },
    paste = {
      ["+"] = osc52.paste("+"),
      ["*"] = osc52.paste("*"),
    },
  }
end

local function is_tmux()
  return os.getenv("TMUX") ~= nil
end

if is_tmux() and is_ssh() then
  vim.g.clipboard = {
    name = "TmuxClipboard",
    copy = {
      ["+"] = "tmux load-buffer -w -",
      ["*"] = "tmux load-buffer -w -",
    },
    paste = {
      ["+"] = "tmux save-buffer -",
      ["*"] = "tmux save-buffer -",
    },
  }
end
