if status is-interactive
    # Commands to run in interactive sessions can go here
end

# A way to reload the shell à la "zsh"
function fish
    source ~/.config/fish/config.fish
end

# Disable the fish greeting message
set fish_greeting ""

# Print a new line after any command
# source ~/.config/fish/functions/postexec_newline.fish

# Setup brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# alias
alias vi=nvim

# Pyenv setup
# Requires `brew install pyenv`
if type -q pyenv
    status --is-interactive; and source (pyenv init -|psub)
end

# `ls` → `ls -laG` abbreviation
abbr -a -g ls ls -laG

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

starship init fish | source
