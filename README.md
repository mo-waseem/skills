# Mo Waseem Skills

Reusable skills for AI coding agents that follow the open Agent Skills format.

## Available skills

### Minimum Sufficient Architecture

Helps an agent answer:

> What is the minimum architecture this software deserves?

It assesses project complexity, assigns an architecture budget, avoids premature abstractions, and preserves necessary engineering quality such as testing, security, validation, transactions, and reliability.

## Install

Install interactively and choose the target agents:

```bash
npx skills add mo-waseem/skills
```

Install only the Minimum Sufficient Architecture skill:

```bash
npx skills add mo-waseem/skills \
  --skill minimum-sufficient-architecture
```

Install it globally for Claude Code, OpenCode, Codex, and Hermes Agent:

```bash
npx skills add mo-waseem/skills \
  --skill minimum-sufficient-architecture \
  --agent claude-code \
  --agent opencode \
  --agent codex \
  --agent hermes-agent \
  --global
```

For non-interactive installation, add `--yes`.

## Use

Explicit invocation varies by agent:

```text
Claude Code: /minimum-sufficient-architecture
Codex:       $minimum-sufficient-architecture
Hermes:      /minimum-sufficient-architecture
OpenCode:    Use the minimum-sufficient-architecture skill.
```

Example request:

```text
Use the minimum-sufficient-architecture skill to assess this project before implementing the feature.
```

The skill can also be selected automatically when a request concerns software architecture, project structure, code simplification, or overengineering.

## Update

```bash
npx skills update minimum-sufficient-architecture
```

## Repository structure

```text
skills/
└── minimum-sufficient-architecture/
    ├── SKILL.md
    └── agents/
        └── openai.yaml
```
