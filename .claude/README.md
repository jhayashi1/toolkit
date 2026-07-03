# Claude Code config (`~/.claude`)

Portable Claude Code configuration synced across devices. Copy these files into
`~/.claude` on a new machine.

## What's here

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Global instructions applied to every project |
| `settings.json` | Core settings, permissions, hooks, status line, model |
| `keybindings.json` | Custom key bindings |
| `mcp.json` | MCP server definitions (**secret redacted — see below**) |
| `statusline.sh` | Status line script (needs `jq`) |
| `skills/` | Custom skills |
| `plugins/known_marketplaces.json` | Registered plugin marketplaces |

## Setup on a new device

```sh
cp -r .claude/* ~/.claude/
```

Then:

1. **Authenticate.** Do NOT copy `.credentials.json`. Run Claude Code and log in
   on the new device.
2. **Restore the GitHub PAT.** `mcp.json` ships with a placeholder
   (`REPLACE_WITH_YOUR_GITHUB_PAT`). Paste a valid GitHub personal access token,
   or pull it from your password/secret manager.
3. **Fix machine-specific paths** in `mcp.json` — `chrome-devtools.command`
   points at a Windows `.bun` path; adjust for the target OS/user.
4. **Reinstall plugins** if needed — only the marketplace registry is synced,
   not the cloned plugin repos.

## Deliberately NOT synced

Secrets, machine state, and regenerable caches are excluded:

- `.credentials.json` (auth token — re-auth instead)
- `daemon*`, `session-env/`, `sessions/`, `shell-snapshots/` (runtime/machine state)
- `projects/`, `file-history/`, `history.jsonl` (per-project transcripts & history)
- `cache/`, `paste-cache/`, `usage-data/`, `backups/`, `stats-cache.json` (caches)
