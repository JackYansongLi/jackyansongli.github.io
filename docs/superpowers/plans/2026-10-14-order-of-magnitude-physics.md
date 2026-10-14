# Order-of-Magnitude Physics Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish the five Chinese translated chapters of *Order-of-Magnitude Physics* with all source figures as cropped assets behind the existing password gate.

**Architecture:** Reuse the established protected Chinese book pattern: a catalog page, five chapter pages, sidebar registration, and Footer chapter sequence. A dedicated local generator renders only the source PDF figures and their captions at 200 DPI; a node test verifies every chapter, gate, image reference, and crop.

**Tech Stack:** Astro/Starlight Markdown, MathJax, Node test runner, Python, Poppler, ImageMagick.

---

### Task 1: Establish the publication contract

**Files:**
- Create: `tests/order-of-magnitude-physics.test.mjs`

- [ ] Write the test first, requiring the catalog and all five gated chapter files, a complete set of 49 figure assets, and non-page-sized PNG crops.
- [ ] Run `node --test tests/order-of-magnitude-physics.test.mjs` and confirm failure because the new catalog, chapters, and assets do not yet exist.

### Task 2: Publish the translation structure

**Files:**
- Create: `docs/content/docs/zh/order-of-magnitude-physics.md`
- Create: `docs/content/docs/zh/order-of-magnitude-physics/ch01-wetting-your-feet.md`
- Create: `docs/content/docs/zh/order-of-magnitude-physics/ch02-dimensional-analysis.md`
- Create: `docs/content/docs/zh/order-of-magnitude-physics/ch03-materials-i.md`
- Create: `docs/content/docs/zh/order-of-magnitude-physics/ch04-materials-ii.md`
- Create: `docs/content/docs/zh/order-of-magnitude-physics/ch05-waves.md`
- Modify: `astro.config.mjs`
- Modify: `docs/components/Footer.astro`

- [ ] Translate each source chapter faithfully, preserve original numbered formulas, put complete equations in display blocks, and use the established `moldflow-reading-gate.js` frontmatter and protected wrapper.
- [ ] Register the Chinese sidebar and reading-order chapter navigation.

### Task 3: Generate cropped figures

**Files:**
- Create: `scripts/restore-order-of-magnitude-physics-figures.py`
- Create: `public/images/order-of-magnitude-physics/fig-{chapter}-{figure}.png`

- [ ] Map every source `Fig. X.Y` to the local `book-a4.pdf` page, find its caption, crop its connected artwork plus caption, and insert the corresponding HTML image in the translated chapter.
- [ ] Run the generator and confirm each of the 49 expected PNG assets exists.

### Task 4: Verify and publish

**Files:**
- Test: `tests/order-of-magnitude-physics.test.mjs`

- [ ] Run `node --test tests/order-of-magnitude-physics.test.mjs` and the established physics figure tests.
- [ ] Run `npm run build`, `git diff --check`, and diagnostics on all changed code files.
- [ ] Commit implementation and direct regression test together, push `HEAD:main`, and verify the GitHub Pages workflow without opening the website.
