# professor-brodo

Design-crit skills by Adam Brodowski. They work in **ChatGPT, Claude and Codex**: each skill is a plain folder with a `SKILL.md`, in the open Agent Skills format.

Pairs well with [Professor Bunker](https://github.com/clarajoybunker/professor-bunker) by Clara Bunker. Brodo looks at visual craft, Bunker looks at the thinking behind it: framing, evidence, strategy, process and planning. Install both and call in whichever fits.

## Install

**Download:** [professor-brodo.zip](https://raw.githubusercontent.com/Adbro/professor-brodo/main/dist/professor-brodo.zip). Don't unzip it.

### ChatGPT
1. In the sidebar, open **Skills**, then **Create** → **Upload from your computer**.
2. Choose `professor-brodo.zip`. ChatGPT scans it, then it's ready.
3. In any chat: "Professor Brodo, look at this" plus screenshots, a PDF or a link.

On a work or school workspace, an admin may need to allow skill uploads.

### Claude (claude.ai and the desktop app)
Open Claude's settings, find **Skills**, and upload `professor-brodo.zip` as a custom skill. Then ask for a crit the same way.

### Claude Code
```
/plugin marketplace add Adbro/professor-brodo
/plugin install professor-brodo@professor-brodo
/plugin install major-studio-crit@professor-brodo   # optional, Adam's class wrapper
```
Update later with `/plugin marketplace update professor-brodo`.

### Codex
Ask `$skill-installer` to install `https://github.com/Adbro/professor-brodo/tree/main/plugins/professor-brodo/skills/professor-brodo`, or copy that folder into your Codex skills folder. To give a single project the skill, put the folder in that repo's `.agents/skills/`.

**What changes by app:** in Claude Code the crit runs its specialist reviewers in parallel (flow, visual, craft and design-system use, copy, accessibility, platform, interaction, data viz, AI slop, precedent; decks get a story reviewer) and can read Figma files directly. In ChatGPT and the Claude app, Professor Brodo runs the same reviews one after another, and works best when you upload screenshots or a PDF.

## professor-brodo

Tap in Professor Brodo to look at your work: "Professor Brodo, look at this", "get the professor on this". Or just ask for a crit on a Figma link, deck, PDF, screenshots, or a live prototype URL: "crit this", "review my design", "does this look AI-made".

Professor Brodo talks like a studio professor at the crit wall: a one-line verdict up top, pointed questions on the findings that matter, and an "Office hours" close with the one thing to fix first. Nits stay terse. Set `voice: plain` to turn the persona off.

See a full example: [a crit of inspofolder.com](examples/inspofolder-crit.md).

Defaults are set for reviewing your own work: a direct punch list, the AI-slop report up top, and a paste-ready fix prompt for the Claude session that built it.

**Your settings live outside the plugin** (Claude Code and Codex; in chat apps, just say what you want in the request), so updates never overwrite them. Create `~/.claude/professor-brodo/config.md` with any keys you want to change:

```
audience:     self
voice:        plain
volume:       12-20
platform:     web
```

Keys and options are listed at the top of the skill. If you keep a `~/.claude/professor-brodo/calibration.md`, the skill reads it before writing and appends what you keep, cut and add after each crit, so it learns your taste.

**Want a named variant** (a crit for one course, client or team, with its own trigger and rules)? See [WRAPPER.md](WRAPPER.md). Hand it to your agent and it will set one up with you.

Optional connectors: Figma (to read Figma files), Mobbin (for shipped-app references).

## major-studio-crit

Adam's own wrapper for Major Studio: drafts instructor comments on student Figma files and decks, gets his OK on a review page, then posts them pinned to frames. Runs on professor-brodo and needs the `adam-voice` skill, the figma-comments MCP server and his course files, so it's mostly here as a worked example of a wrapper.
