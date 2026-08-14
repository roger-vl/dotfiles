-- Kill the sidekick CLI sessions (e.g. Claude) spawned by THIS Neovim
-- instance when it exits. `M.terminals` is per-process Lua state, so
-- Terminal.sessions() only returns sessions this instance started —
-- Claude in other Neovim instances is untouched.
--
-- Must be synchronous: on VimLeavePre `vim.schedule` callbacks never run,
-- so sidekick.cli.close() (which is schedule_wrapped) is a no-op here.
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local ok, Terminal = pcall(require, "sidekick.cli.terminal")
    if not ok then
      return
    end
    for _, term in ipairs(Terminal.sessions()) do
      -- Only act on jobs still alive in this instance; this also avoids
      -- signaling a recycled PID. Claude detaches into its own process
      -- group, so `kill` the actual child PID directly.
      if term.job and term:is_running() then
        for _, pid in ipairs(term.pids or {}) do
          pcall(vim.fn.system, { "kill", tostring(pid) })
        end
      end
    end
  end,
})

-- When launched from the gh-dash `C` binding (which sets SIDEKICK_REV=1),
-- open the sidekick Claude CLI and fire `/rev` at it. We boot Claude first
-- and defer the send so its TUI is ready — sending immediately can drop the
-- input as type-ahead during startup. Unset the env var right away so child
-- nvim instances (e.g. files opened from within Claude) don't re-trigger.
--
-- IMPORTANT: do NOT use a VimEnter autocmd here. LazyVim loads
-- lua/config/autocmds.lua on the VeryLazy event when nvim starts with no file
-- args (our case — `wt -x nvim` opens the dashboard), which is *after*
-- VimEnter. A VimEnter autocmd registered from this file is created too late
-- and never fires. So run the logic at module-load time instead, deferred a
-- beat so sidekick's CLI/tmux mux is ready. Steps are logged to
-- /tmp/sidekick_rev.log to diagnose a failing launch.
local function sk_log(m)
  local f = io.open("/tmp/sidekick_rev.log", "a")
  if f then
    f:write(os.date("%H:%M:%S ") .. m .. "\n")
    f:close()
  end
end

if vim.env.SIDEKICK_REV == "1" then
  sk_log("C launch: argc=" .. tostring(vim.fn.argc(-1)))
  -- Unset right away so child nvim instances (e.g. files opened from within
  -- Claude) don't re-trigger.
  vim.env.SIDEKICK_REV = nil
  vim.defer_fn(function()
    local ok, cli = pcall(require, "sidekick.cli")
    sk_log("require sidekick.cli ok=" .. tostring(ok))
    if not ok then
      sk_log("  require err=" .. tostring(cli))
      return
    end
    local o, e = pcall(cli.show, { name = "claude", focus = true })
    sk_log("cli.show ok=" .. tostring(o) .. " err=" .. tostring(e))
    -- Defer the send so Claude's TUI is ready — sending immediately can drop
    -- the input as type-ahead during startup.
    vim.defer_fn(function()
      local s, se = pcall(cli.send, { name = "claude", msg = "/rev", submit = true, focus = true })
      sk_log("cli.send ok=" .. tostring(s) .. " err=" .. tostring(se))
    end, 2000)
  end, 500)
end
