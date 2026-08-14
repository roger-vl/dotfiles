#!/usr/bin/env bash

# pcwd — "parent cwd" plugin for tmux2k.
# Shows a compact hint of where you are by surfacing only the *parent*
# directory of the current path, e.g.
#   /Users/me/Documents/repos/melisource/fury_credits-credit-lines-lifecycle/feature-LPL-601
# becomes
#   ~/fury_credits-credit-lines-lifecycle
#
# Self-contained: no dependency on tmux2k's lib/utils.sh, so it can live
# outside the plugin repo and survive `tpm` updates. It is symlinked into
# ~/.tmux/plugins/tmux2k/plugins/pcwd.sh so tmux2k discovers it by name.

get_tmux_option() {
    local option=$1
    local default_value=$2
    local option_value
    option_value=$(tmux show-option -gqv "$option")
    if [ -z "$option_value" ]; then
        echo "$default_value"
    else
        echo "$option_value"
    fi
}

get_pane_dir() {
    tmux display-message -p -F "#{pane_current_path}" 2>/dev/null
}

main() {
    path=$(get_pane_dir)
    [ -z "$path" ] && return

    icon=$(get_tmux_option "@tmux2k-pcwd-icon" "")

    local parent_path parent_name prefix
    parent_path=$(dirname "$path")
    parent_name=$(basename "$parent_path")

    # Tilde-collapsed path, used for the shallow fallback.
    local cwd="${path/#$HOME/\~}"

    # A meaningful parent exists only when the parent directory is itself
    # nested (i.e. not $HOME, / or a direct child of either). Otherwise fall
    # back to showing the plain tilde path.
    if [ "$parent_path" = "/" ] || [ "$parent_path" = "$HOME" ] \
        || [ "$(dirname "$parent_path")" = "/" ]; then
        echo "$icon $cwd"
        return
    fi

    # Prefix reflects reality: "~/" under $HOME, "/" elsewhere.
    prefix=$(get_tmux_option "@tmux2k-pcwd-prefix" "")
    if [ -z "$prefix" ]; then
        case "$path" in
            "$HOME"/*) prefix="~/" ;;
            *) prefix="/" ;;
        esac
    fi

    echo "$icon $prefix$parent_name"
}

main
