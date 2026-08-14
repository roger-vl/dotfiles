# Dotfiles

Tools cross configuration

![exam2](https://github.com/user-attachments/assets/ad47f327-762f-49b8-8c5c-f1ebb9b096d1)

## Setup on a new machine

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Clone into `~/dotfiles`, then stow each package:

```sh
cd ~/dotfiles
stow --no-folding aerospace fish ghostty nvim skhd yabai starship \
  git karabiner mise zed zellij wezterm gh-dash ccstatusline worktrunk television tmux
```

### Commit identity

Commits use `Roger vl <roger23vel@gmail.com>`. This lives in the repo-local
`.git/config` (not tracked), so a fresh clone inherits the machine's global
git identity instead. On a new machine, set it per-repo:

```sh
git config user.name "Roger vl"
git config user.email "roger23vel@gmail.com"
```

The remote uses the `roger.github.com` SSH alias; add a `Host roger.github.com`
block pointing `HostName github.com`, `IdentityFile ~/.ssh/id_roger`, and
`IdentitiesOnly yes` so it doesn't fall back to another account's key.

### External dependencies (not in this repo)

- **`~/.config/local/paths.fish`** — machine-local env/secrets; `fish` sources it
  only if present (`test -f`). Create it per machine.
- **tmux** — config lives at `~/.config/tmux/tmux.conf` (XDG; tmux ≥ 3.1). Install
  [TPM](https://github.com/tmux-plugins/tpm) at `~/.tmux/plugins/tpm`, then
  `prefix + I` to fetch plugins (catppuccin, etc.).
- **zellij** — plugin `*.wasm` files are re-fetched on first run.
- **gh-dash** — the `melisource/*` repo mapping is work-specific; harmless elsewhere.
