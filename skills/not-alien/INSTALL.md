# Install not-alien

Steps for an AI agent (or a person) installing not-alien from https://github.com/mo-waseem/skills.

## 1. Pick the mode

If the user did not say, ask once:

- **Always-on:** not-alien is on in every new session. Claude Code only.
- **On demand:** the user turns it on with `/not-alien` when they want it. Works in any agent.

## 2a. Claude Code, always-on

```bash
claude plugin marketplace add mo-waseem/skills
claude plugin install not-alien@mo-waseem-skills
touch "${CLAUDE_CONFIG_DIR:-$HOME/.claude}/.not-alien-always"
```

If `~/.claude/skills/not-alien` exists from an older `npx` install, remove it so `/not-alien` is not listed twice:

```bash
npx skills remove not-alien --global --yes
```

## 2b. Claude Code, on demand

```bash
claude plugin marketplace add mo-waseem/skills
claude plugin install not-alien@mo-waseem-skills
```

The user can switch to always-on later with the `touch` command in 2a.

## 2c. Any other agent, on demand

```bash
npx skills add mo-waseem/skills --skill not-alien --global --yes
```

Add `--agent <name>` to target one agent: `claude-code`, `codex`, `opencode`, or `hermes-agent`.

No `npx`? Clone the repo and copy the `skills/not-alien` folder into the agent's skills folder:

| Agent | Skills folder |
| --- | --- |
| Claude Code | `~/.claude/skills/` |
| Codex | `~/.codex/skills/` |
| OpenCode | `~/.config/opencode/skills/` |
| Hermes Agent | `~/.hermes/skills/` |

## 3. Check

- Plugin: `claude plugin list` shows `not-alien@mo-waseem-skills` as enabled.
- `npx` or copy: `skills/not-alien/SKILL.md` exists in the agent's skills folder.

## 4. Tell the user

- Restart the agent to load the skill.
- On demand: turn it on with `/not-alien` (Codex: `$not-alien`). Say "stop not-alien" to turn it off.
- Always-on: turn it off with `rm ~/.claude/.not-alien-always`.

## Remove

```bash
claude plugin uninstall not-alien@mo-waseem-skills
rm -f ~/.claude/.not-alien-always
npx skills remove not-alien --global --yes
```
