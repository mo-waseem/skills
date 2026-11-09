# Claude Code plugins

Plugins add things a plain skill can't, such as hooks. Each plugin wraps a skill from `skills/`.

| Plugin | What it adds |
| --- | --- |
| [not-alien](not-alien) | The `not-alien` skill, plus an optional always-on mode |

## Install

```bash
claude plugin marketplace add mo-waseem/skills
claude plugin install not-alien@mo-waseem-skills
```

## Layout

```text
.claude-plugin/
  marketplace.json         # lists every plugin in this folder
claude-plugins/
  <plugin-name>/
    .claude-plugin/
      plugin.json          # manifest
    hooks/                 # optional
    skills/
      <skill-name>/
        SKILL.md           # copy of skills/<skill-name>/SKILL.md
```

## Keep the skill copies in sync

Each plugin has a copy of its `SKILL.md`. When you change `skills/<name>/SKILL.md`, copy it into the plugin and bump `version` in `plugin.json`:

```bash
cp skills/not-alien/SKILL.md claude-plugins/not-alien/skills/not-alien/SKILL.md
```

Check that the copies match:

```bash
diff skills/not-alien/SKILL.md claude-plugins/not-alien/skills/not-alien/SKILL.md
```

Users get the change with `claude plugin update not-alien@mo-waseem-skills`. Claude Code skips the update if `version` didn't change.
