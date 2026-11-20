# Professor Brodo

An AI design critic inspired by Adam Brodowski's studio crits. It is **not** Adam himself.

Professor Brodo looks at **craft**: what's on screen and how it works. Behind the scenes, specialist reviewers each look through one lens. A skeptic then tries to knock down every finding, and only what survives makes it into the crit. You get fewer, truer comments, written like a studio professor at the crit wall.

It pairs well with [Professor Bunker](https://github.com/clarajoybunker/professor-bunker) by Clara Bunker, which looks at the thinking behind the work: framing, evidence, strategy, process and planning. When the thinking is the bigger problem, Professor Brodo will suggest a pass with Professor Bunker. Install both and call in whichever fits.

**Version:** 0.8

## What it helps with

- **Crits** of Figma files, screenshots, decks, PDFs and live prototype URLs
- **Flow and usability:** missing states, dead ends, data that disagrees between screens
- **Visual design:** hierarchy, composition, type, color, density, point of view
- **Craft and design systems:** alignment, spacing, consistency, detached components, hardcoded values
- **Copy:** labels, errors, empty states, terms that drift between screens
- **Accessibility:** contrast measured from pixels, tap targets, keyboard and zoom checks on live builds
- **Platform conventions:** iOS, Android and web
- **Interaction and motion,** on live builds, and **charts and data** when they're on screen
- **AI slop:** filler copy, template styling, screens that look generated rather than iterated
- **The next iteration:** a paste-ready fix prompt for whatever AI tool built the work

## Call it in

In any chat, say **"Professor Brodo, look at this"** and attach your work. Or just ask for a crit. For example:

- "Professor Brodo, look at this."
- "Get the professor on this."
- "Crit this before I share it."
- "Does this look AI-made?"

A plain request runs every reviewer that applies. To look at one thing, name it: "crit the copy", "accessibility pass", "just visual". It will tell you what it didn't check.

## What you get back

- **A one-line opener:** the overall read.
- **A punch list** grouped by screen, each item marked `block`, `fix` or `Nit:`.
- **Office hours:** the one thing to fix first, what's working, and what to bring to the next crit.
- **A fix prompt** to paste into the tool that built it, if an AI tool did.

See a full example: [a crit of inspofolder.com](examples/inspofolder-crit.md).

## Install

1. **Download** [`professor-brodo.zip`](https://raw.githubusercontent.com/Adbro/professor-brodo/main/dist/professor-brodo.zip). Don't unzip it.
2. **Add it once** to the assistant you use:
   - **ChatGPT:** Skills → Create → Upload from your computer. (On a work or school workspace, an admin may need to allow skill uploads.)
   - **Claude app:** Settings → Skills → upload.
   - **Claude Code:** run `/plugin marketplace add Adbro/professor-brodo`, then `/plugin install professor-brodo@professor-brodo`. You don't need the zip for this one. Update later with `/plugin marketplace update professor-brodo`.
   - **Codex:** ask `$skill-installer` to install `https://github.com/Adbro/professor-brodo/tree/main/plugins/professor-brodo/skills/professor-brodo`. You don't need the zip for this one either.
3. **Ask for a crit** in any conversation: attach screenshots, a PDF or a link and say "Professor Brodo, look at this."

**What changes by app:** in Claude Code the reviewers run in parallel and it can read Figma files and drive a browser directly. In ChatGPT and the Claude app it runs the same reviews one after another, and works best when you upload screenshots or a PDF.

## Change how it talks (optional)

Just say what you want in the request: "plain voice, no persona", "this is for a client", "I'm a student", "just the onboarding". It reviews your own work by default: direct, no cushioning.

In Claude Code and Codex you can make a change stick by creating `~/.claude/professor-brodo/config.md`. It lives outside the plugin, so updates never overwrite it:

```
audience:     self       # self | student | client | teammate
voice:        plain      # turns the professor persona off
volume:       12-20      # comments per set of screens
platform:     web        # ios | android | web
```

All the keys are listed in step 0 of the skill. If you also keep a `~/.claude/professor-brodo/calibration.md`, the skill reads it before writing and adds notes on what you kept, cut and added after each crit, so it learns your taste.

Optional connectors: Figma (to read Figma files and their design system directly), Mobbin (for examples from shipped apps).

## What's inside

- `plugins/professor-brodo/skills/professor-brodo/SKILL.md`: the method, settings, and what the crit looks like
- `plugins/professor-brodo/skills/professor-brodo/references/`: loaded only when needed. `reviewers.md` has which reviewers run and each one's brief; `voice.md` has the professor's voice.
- `dist/professor-brodo.zip`: the skill folder, zipped, ready to upload. After editing the skill, run `scripts/package.sh` to rebuild it.
- `plugins/major-studio-crit/`: Adam's own wrapper for his Major Studio course. It needs his other skills and course files, so it's here mostly as a worked example. In Claude Code: `/plugin install major-studio-crit@professor-brodo`.
- [WRAPPER.md](WRAPPER.md): how to make a named variant (a crit for one course, client or team, with its own trigger and rules). Hand it to your agent and it will set one up with you.
- `AGENTS.md`: notes for coding agents installing or editing the skill.

## A note on what it is

Professor Brodo is an AI. Treat its feedback as hypotheses, not instructions. Check the findings against your own screens, and notice what it gets wrong as well as what it catches.
