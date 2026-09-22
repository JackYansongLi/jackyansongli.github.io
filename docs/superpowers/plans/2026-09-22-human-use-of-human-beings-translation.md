# Human Use of Human Beings Translation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish a Chinese, chapter-organized translation of Norbert Wiener’s *The Human Use of Human Beings*, preserving its three source diagrams, behind the existing Chinese reading password gate.

**Architecture:** Keep private translated Markdown separate from the public site, then use a dedicated Node generator to create the 12 protected Starlight chapter pages. Export the three scanned source pages containing diagrams to static PNG assets, register the collection in the shared footer navigation, and reuse the existing `moldflow-reading-gate.js` session-based access gate.

**Tech Stack:** PDF text/image utilities (`pdftotext`, `pdftoppm`), Node.js ESM, Astro 4, Starlight, Markdown, Playwright, Linkinator.

---

## Source boundaries and canonical routes

Use `/Users/jackyansongli/git/injec-translation/book.pdf`. Exclude PDF pages 1–2 (title and contents), include PDF pages 3–231, and do not create the absent index. Keep the first chapter’s appendix inside its chapter file.

| Source file | Public slug | Chinese page title | PDF pages |
| --- | --- | --- | --- |
| `ch01-what-is-cybernetics.md` | `ch01-what-is-cybernetics` | `第1章：什么是控制论？` | 3–21 |
| `ch02-progress-and-entropy.md` | `ch02-progress-and-entropy` | `第2章：进步与熵` | 22–60 |
| `ch03-rigidity-and-learning.md` | `ch03-rigidity-and-learning` | `第3章：僵化与学习：交往行为的两种模式` | 61–86 |
| `ch04-mechanism-of-language.md` | `ch04-mechanism-of-language` | `第4章：语言的机制` | 87–97 |
| `ch05-history-of-language.md` | `ch05-history-of-language` | `第5章：语言的历史` | 98–104 |
| `ch06-individual-as-the-word.md` | `ch06-individual-as-the-word` | `第6章：作为词语的个体` | 105–113 |
| `ch07-law-and-communication.md` | `ch07-law-and-communication` | `第7章：法律与通信` | 114–124 |
| `ch08-communication-and-secrecy.md` | `ch08-communication-and-secrecy` | `第8章：现代世界中的通信与保密` | 125–145 |
| `ch09-role-of-intellectual-and-scientist.md` | `ch09-role-of-intellectual-and-scientist` | `第9章：知识分子与科学家的角色` | 146–165 |
| `ch10-industrial-revolutions.md` | `ch10-industrial-revolutions` | `第10章：第一次与第二次工业革命` | 166–191 |
| `ch11-communication-machines.md` | `ch11-communication-machines` | `第11章：一些通信机器及其未来` | 192–215 |
| `ch12-voices-of-rigidity.md` | `ch12-voices-of-rigidity` | `第12章：僵化的声音` | 216–231 |

### Task 1: Extract bounded source text and diagrams

**Files:**
- Source: `/Users/jackyansongli/git/injec-translation/book.pdf`
- Create outside Git: `/var/folders/rb/nqtn71897svblvyfw_jg6mw40000gn/T/opencode/human-use-source.txt`
- Create: `public/images/human-use-of-human-beings/taping-system.png`
- Create: `public/images/human-use-of-human-beings/moth-or-bedbug.png`
- Create: `public/images/human-use-of-human-beings/hearing-aid.png`

- [ ] **Step 1: Extract the book’s OCR text**

  Run:

  ```bash
  pdftotext -layout "/Users/jackyansongli/git/injec-translation/book.pdf" "/var/folders/rb/nqtn71897svblvyfw_jg6mw40000gn/T/opencode/human-use-source.txt"
  ```

  Verify that the first included heading is `CHAPTER I` and the last included heading is `CHAPTER XII`; discard text from PDF pages 1–2.

- [ ] **Step 2: Export the three complete scanned figure pages**

  Run these commands from the site worktree:

  ```bash
  mkdir -p public/images/human-use-of-human-beings
  pdftoppm -f 15 -l 15 -png -singlefile "/Users/jackyansongli/git/injec-translation/book.pdf" public/images/human-use-of-human-beings/taping-system
  pdftoppm -f 195 -l 195 -png -singlefile "/Users/jackyansongli/git/injec-translation/book.pdf" public/images/human-use-of-human-beings/moth-or-bedbug
  pdftoppm -f 204 -l 204 -png -singlefile "/Users/jackyansongli/git/injec-translation/book.pdf" public/images/human-use-of-human-beings/hearing-aid
  ```

  Verify all three PNG files exist and have nonzero dimensions with `sips -g pixelWidth -g pixelHeight public/images/human-use-of-human-beings/*.png`.

### Task 2: Add failing protected-catalog and image tests

**Files:**
- Modify: `tests/academic-features.spec.ts`

- [ ] **Step 1: Add a catalog access test**

  Add the following test inside the `Academic Website Features` suite:

  ```ts
  test('Human Use catalog requires the shared password', async ({ page }) => {
    await page.goto('/zh/human-use-of-human-beings/');
    const protectedContent = page.locator('[data-moldflow-protected-content]');

    await expect(protectedContent).toBeHidden();
    await page.getByLabel('访问密码').fill('wrong-password');
    await page.getByRole('button', { name: '进入阅读区' }).click();
    await expect(page.getByText('密码不正确，请重试。')).toBeVisible();

    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();
    await expect(protectedContent).toBeVisible();
    await expect(page.getByRole('link', { name: '第1章：什么是控制论？' })).toBeVisible();
  });
  ```

- [ ] **Step 2: Add figure and navigation assertions**

  Add a test that unlocks `/zh/human-use-of-human-beings/ch11-communication-machines/`, expects both `img[src="/images/human-use-of-human-beings/moth-or-bedbug.png"]` and `img[src="/images/human-use-of-human-beings/hearing-aid.png"]` to be visible, and verifies the next link targets `/zh/human-use-of-human-beings/ch12-voices-of-rigidity/`. Add first- and final-route checks that respectively omit `上一章` and `下一章`.

- [ ] **Step 3: Run the focused tests to establish failure**

  Run:

  ```bash
  npm run build && npx playwright test tests/academic-features.spec.ts --grep "Human Use"
  ```

  Expected: FAIL because the catalog and chapter routes do not exist.

### Task 3: Build the protected collection shell and navigation registration

**Files:**
- Create: `docs/content/docs/zh/human-use-of-human-beings.md`
- Create: `scripts/sync-human-use-of-human-beings-content.mjs`
- Modify: `docs/components/Footer.astro`
- Modify: `astro.config.mjs`
- Modify: `docs/content/docs/zh/list-articles.md`

- [ ] **Step 1: Create the catalog page**

  Create a Markdown page with this frontmatter and protected wrapper:

  ```md
  ---
  title: 《人有人的用处》中文译文
  description: Norbert Wiener《The Human Use of Human Beings》中文译文。
  prev: false
  next: false
  head:
    - tag: script
      attrs:
        type: module
        src: /scripts/moldflow-reading-gate.js
  ---

  <div data-moldflow-protected-content>
  ```

  Inside the wrapper, add a static-site access-control disclaimer and an ordered list of all 12 canonical routes from the table above. Do not place a body H1 inside the wrapper.

- [ ] **Step 2: Create the content generator**

  Copy the established generator shape from `scripts/sync-moldflow-design-guide-content.mjs`, rename its environment variable to `HUMAN_USE_OF_HUMAN_BEINGS_SOURCE`, set the output directory to `docs/content/docs/zh/human-use-of-human-beings`, and use the exact table entries above. Its `page()` function must load `/scripts/moldflow-reading-gate.js`, set `prev: false` and `next: false`, and wrap `stripLeadingH1(content)` in `data-moldflow-protected-content`.

- [ ] **Step 3: Register discovery and footer navigation**

  Add this collection after the existing collections in `docs/components/Footer.astro`:

  ```ts
  {
    catalog: '/zh/human-use-of-human-beings/',
    chapters: [
      'ch01-what-is-cybernetics', 'ch02-progress-and-entropy',
      'ch03-rigidity-and-learning', 'ch04-mechanism-of-language',
      'ch05-history-of-language', 'ch06-individual-as-the-word',
      'ch07-law-and-communication', 'ch08-communication-and-secrecy',
      'ch09-role-of-intellectual-and-scientist', 'ch10-industrial-revolutions',
      'ch11-communication-machines', 'ch12-voices-of-rigidity',
    ],
  },
  ```

  Add a Chinese sidebar item labelled `《人有人的用处》中文译文` in `astro.config.mjs`, and a matching `/zh/human-use-of-human-beings/` discovery link under the Chinese protected-reading section in `list-articles.md`.

### Task 4: Translate and generate the 12 public chapters

**Files:**
- Create privately: one Markdown source file for each source-table entry
- Create: `docs/content/docs/zh/human-use-of-human-beings/ch01-what-is-cybernetics.md` through `ch12-voices-of-rigidity.md`

- [ ] **Step 1: Translate chapters I–IV and generate public pages**

  Translate PDF pages 3–97 in source order, preserving paragraph breaks, footnotes, headings, quotes, and formula notation. Place the first figure after the translated discussion corresponding to printed page 13:

  ```md
  ![典型的纸带系统（原书扫描图）](/images/human-use-of-human-beings/taping-system.png)
  ```

  Include the first chapter’s appendix as `## 第一章附录`. Run the generator with `HUMAN_USE_OF_HUMAN_BEINGS_SOURCE=<private-source-directory> node scripts/sync-human-use-of-human-beings-content.mjs`.

- [ ] **Step 2: Translate chapters V–VIII and generate public pages**

  Translate PDF pages 98–145 with the same fidelity rules. Preserve source terminology consistently: translate `cybernetics` as `控制论`, `entropy` as `熵`, and `communication` as `通信` unless a quoted source requires otherwise.

- [ ] **Step 3: Translate chapters IX–XII and generate public pages**

  Translate PDF pages 146–231. In Chapter XI, insert these exact Markdown images immediately after their associated translated figure discussion:

  ```md
  ![“飞蛾或臭虫”反馈机器（原书扫描图）](/images/human-use-of-human-beings/moth-or-bedbug.png)

  ![供完全失聪者使用的助听器（原书扫描图）](/images/human-use-of-human-beings/hearing-aid.png)
  ```

- [ ] **Step 4: Verify the generated page set**

  Run:

  ```bash
  node -e "import('node:fs/promises').then(({ readdir }) => readdir('docs/content/docs/zh/human-use-of-human-beings').then((files) => { if (files.filter((file) => file.endsWith('.md')).length !== 12) process.exit(1); }))"
  ```

  Expected: exit code 0, with exactly the 12 canonical Markdown files.

### Task 5: Verify, commit, and deploy

**Files:**
- Test: `tests/academic-features.spec.ts`
- Verify: `docs/content/docs/zh/human-use-of-human-beings/`, `public/images/human-use-of-human-beings/`

- [ ] **Step 1: Run diagnostics and full verification**

  Run:

  ```bash
  npx astro check
  npm run build
  npx playwright test
  ```

  Expected: all commands exit 0; Linkinator reports no broken local links and every Human Use test passes.

- [ ] **Step 2: Inspect the published static output**

  Verify `dist/zh/human-use-of-human-beings/index.html`, the 12 chapter `index.html` files, and all three PNG assets under `dist/images/human-use-of-human-beings/`. Confirm that each protected document contains no body H1.

- [ ] **Step 3: Make atomic commits and deploy**

  Commit image assets, content-generation/integration changes with their Playwright coverage, and translation batches as separate atomic commits. Push the completed branch to GitHub, merge the reviewed branch into `main`, push `main`, and use `gh run watch` on the resulting GitHub Pages workflow. Visit the live catalog, verify incorrect-password rejection, unlock with `761893`, and confirm Chapter XI renders both preserved diagrams.

## Plan self-review

- **Spec coverage:** the plan maps the 12 translated chapter pages, source boundary, three retained images, shared password behavior, navigation, sidebar discovery, tests, build, and deployment to explicit tasks.
- **No placeholders:** all public paths, slugs, source PDF ranges, commands, figure filenames, and expected outcomes are named.
- **Consistency:** generated pages use the existing gate script and wrapper, and every listed figure asset uses the same absolute `public/images` route in source, test, and deployment steps.
