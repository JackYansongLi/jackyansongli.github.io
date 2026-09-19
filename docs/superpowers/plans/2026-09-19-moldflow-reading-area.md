# Chinese Moldflow Reading Area Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish a Chinese-only, client-side password-gated reading area for the recommended Moldflow study chapters.

**Architecture:** Add a Chinese Starlight landing page which performs a SHA-256 check of the supplied passphrase before showing links to the selected chapter pages. Copy the selected Chinese Markdown files into the Chinese documentation collection, preserving their formulas and internal Markdown. This is a convenience gate only; static GitHub Pages cannot protect published content from direct download.

**Tech Stack:** Astro 4, Starlight, TypeScript, browser Web Crypto API, Playwright.

---

### Task 1: Add the reading catalog and source chapters

**Files:**
- Create: `docs/content/docs/zh/moldflow-reading.md`
- Create: `docs/content/docs/zh/moldflow-reading/ch02-plastic-part-design.md`
- Create: `docs/content/docs/zh/moldflow-reading/ch05-cavity-filling.md`
- Create: `docs/content/docs/zh/moldflow-reading/ch06-feed-system-design.md`
- Create: `docs/content/docs/zh/moldflow-reading/ch07-gating-design.md`
- Create: `docs/content/docs/zh/moldflow-reading/ch08-venting.md`
- Create: `docs/content/docs/zh/moldflow-reading/ch09-cooling-system-design.md`
- Create: `docs/content/docs/zh/moldflow-reading/ch10-shrinkage-warpage.md`
- Create: `docs/content/docs/zh/moldflow-reading/ch14-mold-commissioning.md`
- Create: `docs/content/docs/zh/moldflow-reading/ch15-appendix.md`

- [ ] Copy the selected translated chapter Markdown files without images.
- [ ] Create a catalog page with Chinese reading order and an explicit static-site access-gate warning.

### Task 2: Add a client-side access gate

**Files:**
- Create: `public/scripts/moldflow-reading-gate.js`
- Modify: `docs/content/docs/zh/moldflow-reading.md`
- Modify: `docs/styles/custom.css`

- [ ] Render only the password form before successful SHA-256 verification of `761893`.
- [ ] On success, persist a session-scoped flag and display the catalog links.
- [ ] Add accessible error handling and responsive Chinese typography.

### Task 3: Add Chinese navigation and tests

**Files:**
- Modify: `astro.config.mjs`
- Modify: `docs/content/docs/zh/list-articles.md`
- Modify: `tests/academic-features.spec.ts`

- [ ] Add a Chinese-only sidebar item for `/zh/moldflow-reading/`.
- [ ] Add the catalog to the Chinese article index.
- [ ] Add Playwright checks that the catalog is hidden before a wrong password and shown after `761893`.

### Task 4: Build and publish

**Files:**
- Modify: generated `dist/` output only through the build process.

- [ ] Run `npm run build`.
- [ ] Run the focused Playwright test.
- [ ] Commit only intended source, test, and generated deployment files according to repository practice; push to `origin`.
