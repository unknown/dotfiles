if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr vim "nvim"
abbr lg "lazygit"
set -gx EDITOR nvim

set -gx XDG_CONFIG_HOME $HOME/.config

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"
# brew end

# pnpm
set -gx PNPM_HOME "/Users/dmo/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set -gx PATH $PATH /Users/dmo/.bun/bin
# bun end

# astral
uv generate-shell-completion fish | source
uvx --generate-shell-completion fish | source
# astral end

# go
set -gx PATH $PATH (go env GOPATH)/bin
# go end

# mpl
set -gx PATH $PATH /dev/mpl-switch
set -gx PATH $PATH $HOME/.mpl/bin
# mpl end

# rust
set -gx PATH $HOME/.cargo/bin $PATH
# rust end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/Users/dmo/.opam/opam-init/init.fish' && source '/Users/dmo/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration

starship init fish | source
