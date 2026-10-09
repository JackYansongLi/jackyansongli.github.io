# Moldflow Design Guide Chinese Translation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish a Chinese, chapter-organized Markdown translation of the supplied *Moldflow Design Guide: A Resource for Plastics Engineers*, omitting the book's illustrations, contents, and index, behind the existing Chinese reading access gate.

**Architecture:** Create a dedicated Starlight reading catalog rather than mixing this book with the existing, differently structured `moldflow-reading` materials. A private, chapter-separated Markdown source directory feeds a dedicated generator that emits 16 protected Markdown pages; the catalog, sidebar entry, and custom footer navigation carry the same ordered slug list. Reuse the existing client-side access-gate script and explicitly describe it as a browser-level access gate, not encryption or server-side protection.

**Tech Stack:** Astro 4, Starlight, Markdown, existing browser-side SHA-256/sessionStorage access gate, Playwright, Linkinator.

---

## Source Scope

- Source PDF: `/Users/jackyansongli/git/trans/Moldflow Design Guide A Resource for Plastics Engineers (Jay Shoemaker) (z-library.sk, 1lib.sk, z-lib.sk).pdf`
- Include: the body of chapters 1–12 and appendices A–D (printed pages 1–319).
- Omit: preliminaries, contents (printed pages XI–XX), all figures/images, and index (printed page 321 onward).
- Preserve: headings, prose, lists, tables, equations, and bibliographic entries.
- Never publish: figure placeholders, figure captions, image-only text, or visual descriptions.

## File Structure

- Create: `docs/content/docs/zh/moldflow-design-guide.md` — protected book landing page and complete chapter list.
- Create: `docs/content/docs/zh/moldflow-design-guide/ch01-polymer-flow-behavior.md` through `ch12-part-defects.md` — one protected translated document per numbered chapter.
- Create: `docs/content/docs/zh/moldflow-design-guide/appendix-a-injection-molding.md` through `appendix-d-plastic-materials.md` — one protected translated document per appendix.
- Create: `scripts/sync-moldflow-design-guide-content.mjs` — maps private source Markdown to protected Starlight documents.
- Modify: `docs/components/Footer.astro` — adds the collection catalog and its 16 ordered slugs to custom protected navigation.
- Modify: `astro.config.mjs` — adds the catalog to the Chinese sidebar.
- Modify: `tests/academic-features.spec.ts` — verify the catalog and a chapter use the existing password gate and link correctly after unlocking.
- Modify: `docs/content/docs/zh/list-articles.md` only if its existing protected-reading catalog section convention includes every dedicated reading catalog; otherwise leave it unchanged.

### Document frontmatter and protection wrapper

Every catalog, chapter, and appendix document uses this shape, adapting title and description:

```md
---
title: 第1章：注塑模具中的聚合物流动行为
description: 《Moldflow Design Guide》中文译文。
prev: false
next: false
head:
  - tag: script
    attrs:
      type: module
      src: /scripts/moldflow-reading-gate.js
---

<div data-moldflow-protected-content>

<!-- translated body -->

</div>
```

## Task 1: Establish the protected catalog and navigation

**Files:**
- Create: `docs/content/docs/zh/moldflow-design-guide.md`
- Test: `tests/academic-features.spec.ts`

- [ ] **Step 1: Write the failing catalog access test**

Add this Playwright test after the existing Moldflow catalog test:

```ts
test('Moldflow Design Guide catalog requires the shared password', async ({ page }) => {
  await page.goto('/zh/moldflow-design-guide/');

  await expect(page.getByRole('heading', { name: 'Moldflow 设计指南' })).toBeVisible();
  await expect(page.getByRole('link', { name: '第1章：注塑模具中的聚合物流动行为' })).toBeHidden();

  await page.getByLabel('访问密码').fill('761893');
  await page.getByRole('button', { name: '进入阅读区' }).click();
  await expect(page.getByRole('link', { name: '第1章：注塑模具中的聚合物流动行为' })).toBeVisible();
});
```

- [ ] **Step 2: Run the focused test and confirm it fails because the route is absent**

Run: `npx playwright test tests/academic-features.spec.ts --grep "Moldflow Design Guide catalog"`

Expected: FAIL with navigation or page-content assertion failure for `/zh/moldflow-design-guide/`.

- [ ] **Step 3: Create the protected catalog**

Create `docs/content/docs/zh/moldflow-design-guide.md` with the standard frontmatter and wrapper above. Its body must contain the following disclosure and chapter links:

```md
# Moldflow 设计指南

《Moldflow Design Guide: A Resource for Plastics Engineers》中文译文。本站保留正文中的标题、段落、表格、公式与参考文献；图片、目录和索引均不收录。

> 本站是静态 GitHub Pages。密码门仅用于避免内容被随意浏览，并不构成服务器级访问控制或内容加密；已发布的静态文件仍可能被直接获取。

## 正文

1. [第1章：注塑模具中的聚合物流动行为](/zh/moldflow-design-guide/ch01-polymer-flow-behavior/)
2. [第2章：成型条件与注射压力](/zh/moldflow-design-guide/ch02-molding-conditions-pressure/)
3. [第3章：充填模式](/zh/moldflow-design-guide/ch03-filling-pattern/)
4. [第4章：Moldflow 设计原则](/zh/moldflow-design-guide/ch04-design-principles/)
5. [第5章：Moldflow 分析中的网格](/zh/moldflow-design-guide/ch05-meshes/)
6. [第6章：产品设计](/zh/moldflow-design-guide/ch06-product-design/)
7. [第7章：浇口设计](/zh/moldflow-design-guide/ch07-gate-design/)
8. [第8章：流道系统设计](/zh/moldflow-design-guide/ch08-runner-system-design/)
9. [第9章：冷却系统设计](/zh/moldflow-design-guide/ch09-cooling-system-design/)
10. [第10章：收缩与翘曲](/zh/moldflow-design-guide/ch10-shrinkage-warpage/)
11. [第11章：Moldflow 设计流程](/zh/moldflow-design-guide/ch11-design-procedure/)
12. [第12章：塑件缺陷](/zh/moldflow-design-guide/ch12-part-defects/)

## 附录

- [附录 A：注塑成型](/zh/moldflow-design-guide/appendix-a-injection-molding/)
- [附录 B：注塑机：系统与操作](/zh/moldflow-design-guide/appendix-b-machine-systems-operations/)
- [附录 C：注塑成型过程控制](/zh/moldflow-design-guide/appendix-c-process-control/)
- [附录 D：塑料材料](/zh/moldflow-design-guide/appendix-d-plastic-materials/)
```

- [ ] **Step 4: Run the focused test and confirm it passes**

Run: `npx playwright test tests/academic-features.spec.ts --grep "Moldflow Design Guide catalog"`

Expected: PASS.

## Task 2: Add collection generation and ordered protected navigation

**Files:**
- Create: `scripts/sync-moldflow-design-guide-content.mjs`
- Modify: `docs/components/Footer.astro`
- Modify: `astro.config.mjs`
- Test: `tests/academic-features.spec.ts`

- [ ] **Step 1: Write failing navigation assertions**

Add assertions for the first, middle, and final collection routes. After entering `761893`, require the catalog link on every page; require only `下一章` on `ch01-polymer-flow-behavior`, both neighboring links on `ch06-product-design`, and only `上一章` on `appendix-d-plastic-materials`.

- [ ] **Step 2: Run the focused navigation test and confirm it fails**

Run: `npx playwright test tests/academic-features.spec.ts --grep "Moldflow Design Guide navigation"`

Expected: FAIL because no collection slugs are registered in `Footer.astro`.

- [ ] **Step 3: Create the private-source generator**

Create `scripts/sync-moldflow-design-guide-content.mjs` by following `scripts/sync-flow-analysis-content.mjs`. It must require `MOLDFLOW_DESIGN_GUIDE_SOURCE`, map exactly these 16 private filenames to output slugs, and write only the standard frontmatter plus protected wrapper:

```js
const chapters = [
  ['ch01-polymer-flow-behavior.md', 'ch01-polymer-flow-behavior'],
  ['ch02-molding-conditions-pressure.md', 'ch02-molding-conditions-pressure'],
  ['ch03-filling-pattern.md', 'ch03-filling-pattern'],
  ['ch04-design-principles.md', 'ch04-design-principles'],
  ['ch05-meshes.md', 'ch05-meshes'],
  ['ch06-product-design.md', 'ch06-product-design'],
  ['ch07-gate-design.md', 'ch07-gate-design'],
  ['ch08-runner-system-design.md', 'ch08-runner-system-design'],
  ['ch09-cooling-system-design.md', 'ch09-cooling-system-design'],
  ['ch10-shrinkage-warpage.md', 'ch10-shrinkage-warpage'],
  ['ch11-design-procedure.md', 'ch11-design-procedure'],
  ['ch12-part-defects.md', 'ch12-part-defects'],
  ['appendix-a-injection-molding.md', 'appendix-a-injection-molding'],
  ['appendix-b-machine-systems-operations.md', 'appendix-b-machine-systems-operations'],
  ['appendix-c-process-control.md', 'appendix-c-process-control'],
  ['appendix-d-plastic-materials.md', 'appendix-d-plastic-materials'],
];
```

- [ ] **Step 4: Register the collection routes**

Add `/zh/moldflow-design-guide/` to the Chinese sidebar in `astro.config.mjs`. Add one `Footer.astro` collection object with that catalog route and the 16 slugs from Step 3 in the exact same order; retain the existing `data-moldflow-protected-navigation` selector.

- [ ] **Step 5: Re-run navigation coverage**

Run: `npx playwright test tests/academic-features.spec.ts --grep "Moldflow Design Guide navigation"`

Expected: PASS after the generated pages exist.

## Task 3: Extract and normalize only source body text

**Files:**
- Source: `/Users/jackyansongli/git/trans/Moldflow Design Guide A Resource for Plastics Engineers (Jay Shoemaker) (z-library.sk, 1lib.sk, z-lib.sk).pdf`
- Create locally, do not publish: `/var/folders/rb/nqtn71897svblvyfw_jg6mw40000gn/T/opencode/moldflow-design-guide-body.txt`

- [ ] **Step 1: Extract body text from the supplied PDF**

Run:

```bash
pdftotext -layout "Moldflow Design Guide A Resource for Plastics Engineers (Jay Shoemaker) (z-library.sk, 1lib.sk, z-lib.sk).pdf" "/var/folders/rb/nqtn71897svblvyfw_jg6mw40000gn/T/opencode/moldflow-design-guide-body.txt"
```

- [ ] **Step 2: Verify the chapter boundary markers**

Run a text search for these chapter openers: `Polymer Flow Behavior in Injection Molds`, `Molding Conditions and Injection Pressure`, `Filling Pattern`, `Moldflow Design Principles`, `Meshes Used In Moldflow Analyses`, `Product Design`, `Gate Design`, `Runner System Design`, `Cooling System Design`, `Shrinkage and Warpage`, `Moldflow Design Procedure`, and `Part Defects`.

Expected: exactly one body-start match per chapter, after the contents pages.

- [ ] **Step 3: Remove non-body content before translation**

Use printed-page boundaries rather than figure numbers: exclude all lines before printed page `1`, the contents pages, and all content after the `Index` heading. Remove figure captions, image references, and image-only text. Do not extract image assets, OCR images, re-create diagrams, or add figure placeholders.

## Task 3: Translate chapters 1–4 into protected Markdown

**Files:**
- Create: `docs/content/docs/zh/moldflow-design-guide/ch01-polymer-flow-behavior.md`
- Create: `docs/content/docs/zh/moldflow-design-guide/ch02-molding-conditions-pressure.md`
- Create: `docs/content/docs/zh/moldflow-design-guide/ch03-filling-pattern.md`
- Create: `docs/content/docs/zh/moldflow-design-guide/ch04-design-principles.md`

- [ ] **Step 1: Translate each complete chapter in source order**

For every source heading, use the same numbering and a Chinese title, for example:

```md
## 1.1 注塑成型的阶段

### 1.1.1 塑料如何充满模具
```

Translate complete prose, bullets, tables, equations, review sections, and references. Do not add summaries, interpretation, or new technical claims.

- [ ] **Step 2: Preserve Markdown tables and equations**

Use pipe tables for source tabular data and `$...$` or `$$...$$` for equations. Preserve source units, symbols, and numerical precision. Add a translated explanatory label for every variable defined in source prose.

- [ ] **Step 3: Add standard page protection**

Wrap the entire translated body in `data-moldflow-protected-content` and include `/scripts/moldflow-reading-gate.js` in frontmatter. Set `prev: false` and `next: false`; the shared script adds bottom navigation.

- [ ] **Step 4: Build to validate Markdown compilation**

Run: `npm run build`

Expected: exit code 0 and no broken local links from the new catalog or chapter pages.

## Task 4: Translate chapters 5–8 into protected Markdown

**Files:**
- Create: `docs/content/docs/zh/moldflow-design-guide/ch05-meshes.md`
- Create: `docs/content/docs/zh/moldflow-design-guide/ch06-product-design.md`
- Create: `docs/content/docs/zh/moldflow-design-guide/ch07-gate-design.md`
- Create: `docs/content/docs/zh/moldflow-design-guide/ch08-runner-system-design.md`

- [ ] **Step 1: Translate each complete chapter with exact source heading numbers**

Use the same content rules from Task 3. Include all source text from printed pages 61–152; omit every image, caption, and image-only text without substitutes.

- [ ] **Step 2: Verify chapter boundaries and no contents/index leakage**

For each document, confirm its first content heading is the chapter title and its last body section is the source chapter’s final review or references section. Confirm the document contains neither the string `Contents` nor an index entry list.

- [ ] **Step 3: Build after the batch**

Run: `npm run build`

Expected: exit code 0.

## Task 5: Translate chapters 9–12 and appendices A–D

**Files:**
- Create: `docs/content/docs/zh/moldflow-design-guide/ch09-cooling-system-design.md`
- Create: `docs/content/docs/zh/moldflow-design-guide/ch10-shrinkage-warpage.md`
- Create: `docs/content/docs/zh/moldflow-design-guide/ch11-design-procedure.md`
- Create: `docs/content/docs/zh/moldflow-design-guide/ch12-part-defects.md`
- Create: `docs/content/docs/zh/moldflow-design-guide/appendix-a-injection-molding.md`
- Create: `docs/content/docs/zh/moldflow-design-guide/appendix-b-machine-systems-operations.md`
- Create: `docs/content/docs/zh/moldflow-design-guide/appendix-c-process-control.md`
- Create: `docs/content/docs/zh/moldflow-design-guide/appendix-d-plastic-materials.md`

- [ ] **Step 1: Translate all remaining source body in order**

Translate chapters 9–12 (printed pages 153–245) and appendices A–D (printed pages 247–319). Keep each appendix in its own document and preserve lettered heading numbering such as `## A.1 注塑成型概述`.

- [ ] **Step 2: Apply the standard protected-page shell to every file**

Every document must use the exact gate script and `data-moldflow-protected-content` wrapper specified above. Do not create a second password or alter `/scripts/moldflow-reading-gate.js`.

- [ ] **Step 3: Check text fidelity and exclusions**

For every document, compare section headings against the PDF. Verify all prose, lists, tables, equations, and references are present in Chinese; verify images, contents, and index are absent.

- [ ] **Step 4: Build after the final translation batch**

Run: `npm run build`

Expected: exit code 0.

## Task 6: Validate protected browser behavior and full site output

**Files:**
- Modify: `tests/academic-features.spec.ts`
- Verify: all newly created Markdown pages

- [ ] **Step 1: Add a chapter-unlock test**

Add this test:

```ts
test('Moldflow Design Guide chapter is hidden until unlocked', async ({ page }) => {
  await page.goto('/zh/moldflow-design-guide/ch01-polymer-flow-behavior/');

  await expect(page.getByLabel('访问密码')).toBeVisible();
  await expect(page.getByRole('heading', { name: '1.1 注塑成型的阶段' })).toBeHidden();

  await page.getByLabel('访问密码').fill('761893');
  await page.getByRole('button', { name: '进入阅读区' }).click();
  await expect(page.getByRole('heading', { name: '1.1 注塑成型的阶段' })).toBeVisible();
});
```

- [ ] **Step 2: Run the focused access-gate tests**

Run: `npx playwright test tests/academic-features.spec.ts --grep "Moldflow (reading catalog|Design Guide)"`

Expected: PASS.

- [ ] **Step 3: Run diagnostics and production build**

Run: `npx astro check && npm run build`

Expected: both commands exit 0. The build invokes Linkinator, which must report no broken non-HTTP links.

- [ ] **Step 4: Inspect generated routes**

Verify `dist/zh/moldflow-design-guide/index.html` and all 16 expected chapter/appendix route directories exist. Confirm the static HTML warning accurately calls the feature a password gate rather than encryption.

## Task 7: Deploy via the repository’s existing Pages workflow

**Files:**
- Verify: `.github/workflows/deploy.yml`

- [ ] **Step 1: Inspect the final diff and status**

Run: `git status --short && git diff --check`

Expected: only the catalog, 16 translation documents, the explicit test changes, and optionally the article-index link are changed; no whitespace errors.

- [ ] **Step 2: Commit the completed, verified translation release**

Run:

```bash
git add docs/content/docs/zh/moldflow-design-guide.md docs/content/docs/zh/moldflow-design-guide tests/academic-features.spec.ts
```

Expected: one commit containing only the reviewed files.

- [ ] **Step 3: Push `main` and verify the deployment workflow**

Run: `git push origin main`

Expected: GitHub Actions’ existing `deploy.yml` runs the validated build and publishes the generated static site to GitHub Pages.

## Plan Self-Review

- **Spec coverage:** translation scope, chapter separation, Markdown preservation, image/contents/index exclusion, password `761893`, deployment path, and build/browser verification map to Tasks 1–7.
- **Placeholder scan:** no implementation TBDs; all target paths, commands, translation boundaries, and test selectors are named.
- **Consistency:** all documents use the existing `moldflow-reading-gate.js` script and `data-moldflow-protected-content` wrapper; tests target the dedicated `moldflow-design-guide` route.
