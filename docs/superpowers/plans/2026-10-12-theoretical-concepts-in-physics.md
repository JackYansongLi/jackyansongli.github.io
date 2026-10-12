# 物理学中的理论概念 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish password-protected Chinese translations of Chapters 9, 11, and 12 from Malcolm S. Longair's *Theoretical Concepts in Physics* as a Chinese-only site collection.

**Architecture:** Add a catalog and three focused Markdown chapter documents under a new Chinese content directory. Each page reuses the current data-attribute-based reading gate and MathJax pipeline; the existing gate script remains untouched. Register the collection in the sidebar and footer navigation registry, then cover the access flow, prose visibility, and chapter links in Playwright.

**Tech Stack:** Astro 4, Starlight, Markdown, remark-math, rehype-mathjax, Playwright.

---

### Task 1: Add failing publication and access tests

**Files:**
- Modify: `tests/academic-features.spec.ts`

- [ ] **Step 1: Add a failing end-to-end test for the catalog and Chapter 9**

Append this test before the closing `});` of the existing `Academic Website Features` describe block:

```ts
  test('Theoretical Concepts in Physics catalog and Chapter 9 require the shared password', async ({ page }) => {
    await page.goto('/zh/theoretical-concepts-in-physics/');

    const catalogContent = page.locator('[data-moldflow-protected-content]');
    await expect(catalogContent).toBeHidden();
    await expect(page.getByRole('link', { name: '第 9 章：流体的运动' })).toBeHidden();

    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();
    await expect(page.getByRole('link', { name: '第 9 章：流体的运动' })).toBeVisible();

    await page.goto('/zh/theoretical-concepts-in-physics/ch09-motion-of-fluids/');
    await expect(page.locator('[data-moldflow-protected-content]')).toBeHidden();
    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();
    await expect(page.getByRole('heading', { level: 2, name: '9.1 引言' })).toBeVisible();
  });
```

- [ ] **Step 2: Add a failing navigation-boundary test**

Append this test after the prior test:

```ts
  test('Theoretical Concepts in Physics chapter navigation has exact boundary links', async ({ page }) => {
    await page.goto('/zh/theoretical-concepts-in-physics/ch09-motion-of-fluids/');
    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();

    const firstNavigation = page.locator('[data-moldflow-protected-navigation]');
    await expect(firstNavigation.getByRole('link', { name: '返回目录' })).toHaveAttribute(
      'href',
      '/zh/theoretical-concepts-in-physics/'
    );
    await expect(firstNavigation.getByRole('link', { name: '上一章' })).toHaveCount(0);
    await expect(firstNavigation.getByRole('link', { name: '下一章' })).toHaveAttribute(
      'href',
      '/zh/theoretical-concepts-in-physics/ch11-basic-thermodynamics/'
    );

    await page.goto('/zh/theoretical-concepts-in-physics/ch12-kinetic-theory-statistical-mechanics/');
    const finalNavigation = page.locator('[data-moldflow-protected-navigation]');
    await expect(finalNavigation.getByRole('link', { name: '上一章' })).toHaveAttribute(
      'href',
      '/zh/theoretical-concepts-in-physics/ch11-basic-thermodynamics/'
    );
    await expect(finalNavigation.getByRole('link', { name: '下一章' })).toHaveCount(0);
  });
```

- [ ] **Step 3: Run the new test file to confirm the pages fail before implementation**

Run: `npx playwright test tests/academic-features.spec.ts`

Expected: the two new tests fail because `/zh/theoretical-concepts-in-physics/` and its chapter documents do not exist.

### Task 2: Write the Chinese catalog and direct-text chapter translations

**Files:**
- Create: `docs/content/docs/zh/theoretical-concepts-in-physics.md`
- Create: `docs/content/docs/zh/theoretical-concepts-in-physics/ch09-motion-of-fluids.md`
- Create: `docs/content/docs/zh/theoretical-concepts-in-physics/ch11-basic-thermodynamics.md`
- Create: `docs/content/docs/zh/theoretical-concepts-in-physics/ch12-kinetic-theory-statistical-mechanics.md`
- Source: `/Users/jackyansongli/Downloads/Theoretical Concepts in Physics An Alternative View of Theoretical Reasoning in Physics (Malcolm S. Longair) (z-library.sk, 1lib.sk, z-lib.sk).pdf`, PDF pages 178–208, 250–293, and 294–329

- [ ] **Step 1: Create the protected catalog**

Use this frontmatter and protected wrapper in `docs/content/docs/zh/theoretical-concepts-in-physics.md`:

```md
---
title: 《物理学中的理论概念》中文译文
description: Malcolm S. Longair《Theoretical Concepts in Physics》选章中文译文。
prev: false
next: false
head:
  - tag: script
    attrs:
      type: module
      src: /scripts/moldflow-reading-gate.js
---

<div data-moldflow-protected-content>

以下为 Malcolm S. Longair《Theoretical Concepts in Physics》选章中文译文。输入访问密码后可阅读。

1. [第 9 章：流体的运动](/zh/theoretical-concepts-in-physics/ch09-motion-of-fluids/)
2. [第 11 章：基础热力学](/zh/theoretical-concepts-in-physics/ch11-basic-thermodynamics/)
3. [第 12 章：动力学理论与统计力学的起源](/zh/theoretical-concepts-in-physics/ch12-kinetic-theory-statistical-mechanics/)

</div>
```

- [ ] **Step 2: Produce the Chapter 9 translation by direct reading**

Read the embedded PDF text from pages 178–208 without OCR. Translate every paragraph, heading, list, definition, and displayed equation into `ch09-motion-of-fluids.md`; preserve mathematical notation, equation order, variable names, and equation labels. Use the catalog's script frontmatter and wrap all body content in `<div data-moldflow-protected-content>`. Include the heading `## 9.1 引言` exactly so the test gives a stable semantic check. Do not include source images.

- [ ] **Step 3: Produce the Chapter 11 translation by direct reading**

Read the embedded PDF text from pages 250–293 without OCR. Translate every paragraph, heading, list, definition, and displayed equation into `ch11-basic-thermodynamics.md`; preserve mathematical notation, equation order, variable names, and equation labels. Use the identical protection frontmatter/wrapper pattern and no source images.

- [ ] **Step 4: Produce the Chapter 12 translation by direct reading**

Read the embedded PDF text from pages 294–329 without OCR. Translate every paragraph, heading, list, definition, and displayed equation into `ch12-kinetic-theory-statistical-mechanics.md`; preserve mathematical notation, equation order, variable names, and equation labels. Use the identical protection frontmatter/wrapper pattern and no source images.

- [ ] **Step 5: Check the source text and chapter documents for coverage and formula delimiters**

Run: `python3 - <<'PY'
from pathlib import Path
chapter_dir = Path('docs/content/docs/zh/theoretical-concepts-in-physics')
for chapter in sorted(chapter_dir.glob('*.md')):
    text = chapter.read_text(encoding='utf-8')
    assert text.startswith('---\\n')
    assert '<div data-moldflow-protected-content>' in text
    assert text.rstrip().endswith('</div>')
    assert text.count('$$') % 2 == 0
    print(chapter, len(text), 'characters')
PY`

Expected: all three chapter files print a positive character count and no assertion fails.

### Task 3: Register the collection in existing navigation

**Files:**
- Modify: `astro.config.mjs:61-64`
- Modify: `docs/components/Footer.astro:80`

- [ ] **Step 1: Add the Chinese sidebar entry**

Add this sibling entry after the existing protected book links in `astro.config.mjs`:

```js
{ label: 'Theoretical Concepts in Physics (Chinese Translation)', translations: { 'zh-CN': '《物理学中的理论概念》中文译文' }, link: 'https://jackyansongli.github.io/zh/theoretical-concepts-in-physics/' },
```

- [ ] **Step 2: Register the footer chapter sequence**

Add this collection object to `collections` in `docs/components/Footer.astro`:

```ts
  {
    catalog: '/zh/theoretical-concepts-in-physics/',
    chapters: [
      'ch09-motion-of-fluids',
      'ch11-basic-thermodynamics',
      'ch12-kinetic-theory-statistical-mechanics',
    ],
  },
```

- [ ] **Step 3: Run the targeted Playwright test file**

Run: `npx playwright test tests/academic-features.spec.ts`

Expected: the new protected catalog, direct chapter access, and exact previous/next links pass together with existing academic feature tests.

### Task 4: Verify the full static site and publication diff

**Files:**
- Modify: `tests/academic-features.spec.ts`
- Create: `docs/content/docs/zh/theoretical-concepts-in-physics.md`
- Create: `docs/content/docs/zh/theoretical-concepts-in-physics/ch09-motion-of-fluids.md`
- Create: `docs/content/docs/zh/theoretical-concepts-in-physics/ch11-basic-thermodynamics.md`
- Create: `docs/content/docs/zh/theoretical-concepts-in-physics/ch12-kinetic-theory-statistical-mechanics.md`
- Modify: `astro.config.mjs`
- Modify: `docs/components/Footer.astro`

- [ ] **Step 1: Check Astro/TypeScript diagnostics for modified typed files**

Run: `npx astro check`

Expected: exit status 0 with no errors in `astro.config.mjs`, `Footer.astro`, or test-relevant project sources.

- [ ] **Step 2: Build the site**

Run: `npm run build`

Expected: exit status 0 and generated pages for the catalog plus three chapter routes.

- [ ] **Step 3: Run the complete browser suite**

Run: `npx playwright test`

Expected: all tests pass.

- [ ] **Step 4: Inspect the staged diff and whitespace**

Run: `git diff --check && git diff -- astro.config.mjs docs/components/Footer.astro tests/academic-features.spec.ts docs/content/docs/zh/theoretical-concepts-in-physics.md docs/content/docs/zh/theoretical-concepts-in-physics`

Expected: no whitespace errors; the diff contains only this collection, its translations, navigation registration, and regression coverage. Confirm `public/scripts/moldflow-reading-gate.js` is absent from the diff.

### Task 5: Commit, push, and verify GitHub Pages

**Files:**
- All files from Task 4

- [ ] **Step 1: Commit the verified publication change**

Run:

```bash
git add astro.config.mjs docs/components/Footer.astro tests/academic-features.spec.ts \
  docs/content/docs/zh/theoretical-concepts-in-physics.md \
  docs/content/docs/zh/theoretical-concepts-in-physics
git commit -m "Publish theoretical concepts translations"
```

Expected: one commit contains the content, navigation, and tests; no user-owned gate script is staged.

- [ ] **Step 2: Push the current branch to `origin/main`**

Run: `git push origin HEAD:main`

Expected: the remote accepts the fast-forward push.

- [ ] **Step 3: Confirm the GitHub Pages workflow succeeds**

Run: `gh run list --branch main --limit 1 --json databaseId,status,conclusion,workflowName,url`

Expected: `workflowName` is `Deploy to GitHub Pages` and `conclusion` is `success`.
