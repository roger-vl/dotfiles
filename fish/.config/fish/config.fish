if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Setup initials
## evals
eval "$(/opt/homebrew/bin/brew shellenv)"
## sources
test -f ~/.config/local/paths.fish; and source ~/.config/local/paths.fish

## Claude Code: force Opus 4.8 as default model (overrides org default Sonnet 4.6)
set -gx ANTHROPIC_MODEL claude-opus-4-8

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
# default nvim vi="NVIM_APPNAME=nvim nvim"
alias vi="NVIM_APPNAME=nvim nvim"
alias d=docker
alias g=git
alias lg=lazygit
alias f=fury
alias ls='lsd -lah'
alias dcd='cd ~/dotfiles'
alias fas='fury ai assets'

# Abbreviations
## `ls` → `ls -laG` abbreviation
abbr -a -g ls ls -laG
## alias test
abbr goc 'docker stop local-spanner && go fmt ./... && goimports -w . && SCOPE=local GO_ENVIRONMENT=development gotestsum --format-hivis --format-hide-empty-pkg -- -p=1 -count=1 ./...'
abbr got 'go fmt ./... && goimports -w . && gotestsum --format-hivis --format-hide-empty-pkg -- -count=1 ./...'
abbr gor 'gotestsum --format-hivis --format-hide-empty-pkg -- -count=1 ./...'
abbr zd 'zellij delete-all-sessions && zellij kill-all-sessions && zellij delete-all-sessions'

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
# config.fish
zoxide init fish | source
~/.local/bin/mise activate fish | source
# starship
starship init fish | source
function starship_transient_prompt_func
    # tput cuu1 # Move cursor up one line to remove newline after transient prompt
    set_color 35312c
    echo "❯ "
end
function prompt_newline --on-event fish_postexec
    echo
end
alias clear "command clear; commandline -f clear-screen"

# Unset the default fish greeting text which messes up Zellij
# set fish_greeting

# Check if we're in an interactive shell
# if status is-interactive
#
#     # At this point, specify the Zellij config dir, so we can launch it manually if we want to
#     export ZELLIJ_CONFIG_DIR=$HOME/.config/zellij
#     # Check if our Terminal emulator is Ghostty
#     if [ "$TERM" = xterm-ghostty ]
#         set ZELLIJ_AUTO_ATTACH true
#         # Launch zellij
#         # eval (zellij setup --generate-auto-start fish | string collect)
#         zellij attach --create none
#     end
# end

# television
tv init fish | source

# >>> es-wrapper initialize >>>
# Agregado automáticamente por el instalador de es-wrapper
# Para desinstalar, ejecuta: ~/.es-wrapper/uninstall.sh
set -gx PATH "$HOME/.es-wrapper/bin" $PATH

functions --erase source 2>/dev/null
function source --wraps source
    builtin source $argv
    set -l ret $status
    if set -q VIRTUAL_ENV
        set -gx PATH "$HOME/.es-wrapper/bin" $PATH
    end
    return $ret
end

# <<< es-wrapper initialize <<<



























