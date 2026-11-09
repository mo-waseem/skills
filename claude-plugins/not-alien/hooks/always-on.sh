#!/bin/sh
# SessionStart hook: loads the not-alien rules into every session,
# but only if the user turned always-on on by creating the flag file.
# Never blocks the session: every failure exits 0.

flag="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/.not-alien-always"
[ -f "$flag" ] || exit 0

skill="$(dirname "$0")/../skills/not-alien/SKILL.md"
[ -f "$skill" ] || exit 0

echo "NOT-ALIEN MODE ACTIVE (always-on). Follow these rules in every reply."
echo "Say \"stop not-alien\" to turn it off for this session. Delete $flag to turn always-on off."
echo
# Print SKILL.md without its YAML frontmatter.
awk 'NR==1 && /^---$/ {fm=1; next} fm && /^---$/ {fm=0; next} !fm' "$skill" || true
exit 0
