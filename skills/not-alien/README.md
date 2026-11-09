# not-alien

**Plain English from your AI agent. Short answers, common words, no filler.**

AI agents often write like aliens: long sentences, rare words, and polite filler around a small answer. not-alien makes your agent write like a clear human. Every sentence should be easy to read the first time, even if English is not your first language.

## Install

Copy and paste this prompt into your AI agent:

```text
Install the not-alien skill from https://github.com/mo-waseem/skills. Run `npx skills add mo-waseem/skills --skill not-alien` for this agent, or copy the `skills/not-alien` folder into this agent's skills folder.
```

Or run the command yourself:

```bash
npx skills add mo-waseem/skills --skill not-alien
```

Then turn it on in your agent:

```text
Claude Code: /not-alien
Codex:       $not-alien
Hermes:      /not-alien
OpenCode:    Use the not-alien skill.
```

It stays on for the rest of the session. Say "stop not-alien" or "normal mode" to turn it off.

## What changes

<table>
<tr>
<td width="50%">

### Before

> Great question! In order to facilitate the resolution of this issue, it would perhaps be advisable to initially verify whether the configuration file has been properly instantiated prior to the execution of the deployment script. This is essentially a common pitfall that tends to arise in these kinds of setups. Let me know if you need anything else!

</td>
<td width="50%">

### After

> Check that the config file exists before you run the deploy script.

</td>
</tr>
</table>

## What you get

- **Faster reading.** The answer is in the first line, not the third paragraph.
- **Easier English.** Common words and short sentences. Good for non-native readers and for tired eyes.
- **Fewer tokens.** Shorter replies cost less and leave more room in the context window.
- **Less noise.** No "Great question!", no "Hope this helps!", no recap of what was just said.
- **Nothing important lost.** Code, commands, file paths, and error messages stay exact. Safety warnings stay.

## The rules

Full text in [SKILL.md](./SKILL.md).

1. **Plain words.** "use", not "utilize". No jargon unless you used it first. No idioms.
2. **Short sentences.** One idea each, 20 words or fewer, active voice. No filler hedges.
3. **Short replies.** Answer first. No preamble, no closing filler, no recap.
4. **Some things stay exact.** Code, commands, paths, URLs, errors, and product names are never simplified.
5. **Check before sending.** Would a non-native speaker understand each sentence on the first read? Can a sentence go? Remove it.

## When it writes more

- You ask it to "explain" or "walk me through" something. It explains fully, still in plain words.
- A risky action needs a warning or a confirmation.

## Tune it

Fork [mo-waseem/skills](https://github.com/mo-waseem/skills), edit `skills/not-alien/SKILL.md`, then install from your fork:

```bash
npx skills add <your-username>/skills --skill not-alien
```
