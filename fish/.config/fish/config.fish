if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Setup initials
## evals
eval "$(/opt/homebrew/bin/brew shellenv)"
## sources
source ~/.config/local/paths.fish

## paths
set -gx PATH $PATH ~/.local/share/bob/nvim-bin

## sets
set -g fish_key_bindings fish_vi_key_bindings
set fish_greeting ""

# A way to reload the shell à la "zsh"
function fish
    source ~/.config/fish/config.fish
end

# Alias
alias vi=nvim
alias d=docker
alias g=git
alias lg=lazygit
alias f=fury
alias ls='lsd -lah'
alias dcd='cd ~/dotfiles'

# Abbreviations
## `ls` → `ls -laG` abbreviation
abbr -a -g ls ls -laG
## alias test
abbr got 'go fmt ./... && goimports -w . && gotestsum --format-hivis --format-hide-empty-pkg'

# Pyenv setup
# Requires `brew install pyenv`
if type -q pyenv
    status --is-interactive; and source (pyenv init -|psub)
end

# `ls` → `exa` abbreviation
# Requires `brew install exa`
if type -q exa
    abbr --add -g ls 'exa --long --classify --all --header --git --no-user --tree --level 1'
end

# `cat` → `bat` abbreviation
# Requires `brew install bat`
if type -q bat
    abbr --add -g cat bat
end

# `rm` → `trash` abbreviation (moves files to the trash instead of deleting them)
# Requires `brew install trash`
if type -q trash
    abbr --add -g rm trash
end

# tools
starship init fish | source
zoxide init fish | source
