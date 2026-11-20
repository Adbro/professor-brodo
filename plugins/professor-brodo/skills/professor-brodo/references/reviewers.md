# Reviewer briefs

Read this in step 2. Each section below is one reviewer's brief. Hand it to that reviewer's subagent along with the shared brief from SKILL.md, or, with no subagents, work through the lenses yourself one at a time.

## Which reviewers run

| tag | reviewer | runs | model (Claude) | why that model |
|---|---|---|---|---|
| `flow` | Usability and flow | always (not decks) | opus | Judgment-heavy; this is where the important findings live |
| `visual` | Visual design | always | opus | Taste judgment; the costliest lens to get wrong |
| `craft` | Craft, consistency and design-system use | always (not decks) | sonnet | Mostly measurement against metadata, variables and pixels |
| `copy` | Copy and content | always | sonnet | Reading and comparing strings across screens |
| `a11y` | Accessibility | always | sonnet | Measurement plus a checklist |
| `platform` | Platform conventions | always (not decks) | sonnet | Fetch-and-match against official guidelines |
| `interaction` | Interaction and motion | live URLs and coded prototypes | sonnet | Compares captured states against a checklist |
| `dataviz` | Charts and data | when charts, graphs or data tables are on screen | sonnet | Checklist plus reading the numbers |
| `ai` | Slop detector | always | opus | False positives are the costliest error here |
| `ref` | Precedent scout | always, if any source works | haiku | Search and return links |
| `story` | Deck story | decks only | opus | Narrative judgment |

In a full crit, run every reviewer whose "runs" condition holds. For decks, `story`, `visual`, `copy`, `a11y`, `ai` and `ref` run, plus `dataviz` when there are charts. The UI shown inside a deck gets `flow`, `craft` and `platform` findings only when the deck is presenting that UI for crit.

## flow: usability and flow

- Nielsen's 10 heuristics.
- Missing states: empty, error, loading, selected, disabled, keyboard up.
- Dead ends, and destructive actions that are too easy.
- Data that disagrees between screens (same item priced differently, counts that don't match).
- What pushes the main content below the fold.
- Smart defaults: could the app pick today's date, current location, the last choice, a system payment sheet?
- Controls people expect: recenter and compass on maps, the primary action within thumb reach.
- Things that look tappable but aren't, and the reverse.
- If color carries meaning, is the system taught or backed up with icons?

## visual: visual design

Judge the design as design, not just whether it's consistent or usable.

- **Hierarchy:** what does the eye land on first, second, third, and is that the right order for this screen's job?
- **Composition and grid:** does the layout have a structure, or are things just placed?
- **Type:** pairing, contrast between levels, measure, whether the scale has enough steps or too many.
- **Color:** is there a strategy (a primary, an accent, a meaning) or just a palette?
- **Density:** too sparse to feel finished, or too packed to scan?
- **Imagery and icons:** one style, or a mix?
- **Point of view:** does it look like this product, or like any product?

Name the specific element and say what it does to the read. Don't flag a deliberate stylistic choice as a mistake; say what it costs if it costs something.

## craft: craft, consistency and design-system use

Use metadata positions and sizes, the `system` file and pixels.

- Alignment, spacing rhythm, component sizes, corner radii, stroke weights, type scale.
- Color that changes for no reason.
- Clipping and fitting problems.
- Pieces that should share a treatment but don't.
- Placeholder content where real content would change the read: lorem ipsum, gray boxes for photos, fake map tiles.
- **Design-system use, when there is one:** hardcoded values where a variable or style exists, detached or rebuilt components where an instance exists, near-duplicate styles (two grays a hair apart, 15 and 16 pt body), and variables named for one meaning but used for another.
- When there's no system and the file is past mid-fi, one finding is enough: which repeated pieces should become components or styles first.

## copy: copy and content

Every string on screen.

- Button and link labels that say what happens ("Save draft", not "Submit").
- Terms that drift between screens (See all vs View all, Cart vs Bag).
- Error messages that say what went wrong and how to fix it.
- Empty states that tell people what to do next.
- Headings that describe the content, not the feature.
- Tone that matches the product and stays the same throughout.
- Truncation and long-string risks.
- Placeholder text used as a label.

The design:ux-copy skill, if installed, is a fine checklist. Filler and AI phrasing go to `ai`, not here.

## a11y: accessibility

WCAG 2.2 AA plus the platform's accessibility guidance.

- **Live URLs:** start from the axe-core results, the keyboard pass (focus order, visible focus, traps, controls you can't reach) and the 200% text-zoom capture. Confirm each axe violation against the screenshot before reporting it, since axe flags things that don't matter here.
- **Contrast,** measured from PNG pixels with PIL, never eyeballed: 4.5:1 for body text, 3:1 for large text and UI parts.
- **Tap targets:** 44x44 pt on iOS, 48x48 dp on Android, 24x24 CSS px minimum on the web.
- Type under 12 pt.
- Meaning carried by color alone.
- Icon-only buttons with no label.
- Layouts that break with larger text or long names.
- Reading order.

The design:accessibility-review skill, if installed, is a fine checklist.

## platform: platform conventions

Fetch or search the official pages that match what's on screen:

- **iOS and iPadOS:** Apple Human Interface Guidelines.
- **Android:** Material 3.
- **Web:** MDN for native controls and what HTML gives for free, the GOV.UK Design System for form, error and question patterns, and Nielsen Norman Group articles for interaction research.

Check tab and nav bars, sheets, buttons, text fields, toggles, maps, payments, icons, type, safe areas and current materials. Flag where the design fights a convention, rebuilds what the system provides for free, or misses a free system feature.

## interaction: interaction and motion

Live URLs and coded prototypes only. Work from the captured states and recording.

- Does every control have hover, focus and pressed states, and do they look like one family?
- After the main action, is there feedback within about 100 ms, and a loading state if it takes longer?
- Do transitions explain where something came from and went to, or just decorate?
- Durations and easing: too slow, inconsistent, bouncy for no reason?
- Does motion respect reduced-motion settings?
- Anything that moves on its own and can't be paused?
- Layout shift as content loads.

The emil-design-eng skill, if installed, is a good reference for what good feels like.

## dataviz: charts and data

When charts or data tables are on screen.

- Is the chart type right for the question (comparison, change over time, part of whole, distribution)?
- Axes that start somewhere misleading, missing units or labels.
- Legends far from the data, or carried by color alone.
- Too many series to read.
- Decimals beyond what the data supports; tables without numbers aligned.
- Do the numbers agree with each other and with the rest of the screen?

The dataviz skill, if installed, has the rules.

## ai: slop detector

Same JSON as the others, plus `bucket: fix | pattern`.

- **Copy:** three-beat taglines ("Simple. Safe. Seamless."), filler (seamless, effortless, empower, elevate, unlock, journey), em dash habits, numbered everything, headings that read like prompt residue, counts that don't match the list, one polished marketing voice everywhere.
- **Images:** waxy faces, garbled text in images, warped hands or objects, lighting that doesn't match the app.
- **UI:** template styling unconnected to the product (default purple-blue gradients, glass on everything, identical cards, bento grids with no real content), mixed icon sets, emoji soup, screens that look generated rather than iterated (no states, no edge cases, perfect but empty).
- **Research:** quotes that all sound alike, too-tidy personas, unsourced stats, insights that trace to nothing shown.

`fix` names a symptom worth fixing whoever made it. `pattern` is something that only adds up across the whole set.

In `self` mode both buckets are reported. In `student` mode `pattern` goes only to the instructor, never into a posted comment, and is evidence for their judgment, never a verdict. AI-assisted work is still the author's work.

## ref: precedent scout

For the 2-4 findings where an example would settle it, find one.

- **UI patterns:** search Mobbin (search_screens / search_flows); without Mobbin, a web search for a shipped product doing it well.
- **Visual direction** (`visual` findings): the person's own inspiration library if one is connected. Look at the images before citing them.

Return 1-2 references per finding, with link. Never a reference on every comment.

## story: deck story

Decks only.

- Does research lead to an insight, then a decision?
- Are screens big enough to read, and is it the real UI or a redraw?
- Is the scenario relatable?
- Slide order, recap placement, logo on title and close, labels beside screens.
