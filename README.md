# Mo Waseem Skills

Reusable skills for AI coding agents that follow the open Agent Skills format.

## Available skills

### RightArch

Helps an agent answer:

> What is the minimum architecture this software deserves?

It assesses project complexity, assigns an architecture budget, avoids premature abstractions, and preserves necessary engineering quality such as testing, security, validation, transactions, and reliability.

## Install

Install interactively and choose the target agents:

```bash
npx skills add mo-waseem/skills
```

Install only the RightArch skill:

```bash
npx skills add mo-waseem/skills \
  --skill right-arch
```

Install it globally for Claude Code, OpenCode, Codex, and Hermes Agent:

```bash
npx skills add mo-waseem/skills \
  --skill right-arch \
  --agent claude-code \
  --agent opencode \
  --agent codex \
  --agent hermes-agent \
  --global
```

For non-interactive installation, add `--yes`.

## Supported agents

Skills in this repository can be installed for any of these agents:

| Agent | `--agent` | Project path | Global path |
| --- | --- | --- | --- |
| Claude Code | `claude-code` | `.claude/skills/` | `~/.claude/skills/` |
| OpenCode | `opencode` | `.agents/skills/` | `~/.config/opencode/skills/` |
| Codex | `codex` | `.agents/skills/` | `~/.codex/skills/` |
| Hermes Agent | `hermes-agent` | `.hermes/skills/` | `~/.hermes/skills/` |

The `skills` CLI automatically detects installed agents. You can also target one or more agents explicitly with the `--agent` option.

## Use

Explicit invocation varies by agent:

```text
Claude Code: /right-arch
Codex:       $right-arch
Hermes:      /right-arch
OpenCode:    Use the right-arch skill.
```

Example request:

```text
Use the right-arch skill to assess this project before implementing the feature.
```

The skill can also be selected automatically when a request concerns software architecture, project structure, code simplification, or overengineering.

## Update

```bash
npx skills update right-arch
```

## Repository structure

```text
skills/
└── right-arch/
    ├── SKILL.md
    └── agents/
        └── openai.yaml
```
