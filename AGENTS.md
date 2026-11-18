# AGENTS.md

Instructions for any coding agent (Codex, Claude Code, Cursor, and others) working in this repo, or asked to install or use Professor Brodo.

## What this repo is

Design-crit skills by Adam Brodowski, in the open Agent Skills format: a folder with a `SKILL.md` (YAML frontmatter with `name` and `description`, then instructions) plus the files it references. The same folder works in Claude, ChatGPT and Codex.

| Path | What it is |
|---|---|
| `plugins/professor-brodo/skills/professor-brodo/` | **The skill.** `SKILL.md` + `professor-voice.md`. This folder is the single source of truth. |
| `dist/professor-brodo.zip` | That folder zipped for upload (ChatGPT, claude.ai). Built by `scripts/package.sh`; never edit it by hand. |
| `plugins/major-studio-crit/` | Adam's course wrapper. Depends on his own skills and course files; an example, not for general use. |
| `.claude-plugin/`, `plugins/*/.claude-plugin/` | Claude Code plugin marketplace metadata. |
| `WRAPPER.md` | How to build a named variant (a crit for one course, client or team). |
| `examples/` | A sample crit. |

## If you're asked to install Professor Brodo

- **Codex:** use `$skill-installer` with `https://github.com/Adbro/professor-brodo/tree/main/plugins/professor-brodo/skills/professor-brodo`, or copy that folder into the person's Codex skills folder. To share it with one project, copy it into that repo's `.agents/skills/professor-brodo/`.
- **Claude Code:** `/plugin marketplace add Adbro/professor-brodo`, then `/plugin install professor-brodo@professor-brodo`.
- **ChatGPT or the Claude app:** they upload `dist/professor-brodo.zip` themselves (see README). You can't do this for them; point them to the file.

Copy the whole folder, never just `SKILL.md`: it reads `professor-voice.md` from the same folder.

## If you're asked to run a crit

Read `plugins/professor-brodo/skills/professor-brodo/SKILL.md` and follow it. Its "Where you're running" section says what to do without subagents, connectors or a browser.

## If you're editing the skill

- Keep `SKILL.md` tool-agnostic. Claude-specific tools (the Agent tool, Artifacts, Figma and Mobbin connectors) must stay optional, each with a fallback for environments without them.
- Frontmatter has only `name` and `description`. `name` must match the folder name. Keep `description` under 1024 characters: it's what makes ChatGPT, Claude and Codex pick the skill.
- After any change under `plugins/professor-brodo/skills/`, run `./scripts/package.sh` and commit the rebuilt zip in the same commit.
- Bump `version` in `plugins/professor-brodo/.claude-plugin/plugin.json` and add a `CHANGELOG.md` entry.
- This repo is **public**. Never commit student names, student work, grades, private course material, or anything from someone's config or calibration file.
