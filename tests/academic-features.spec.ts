import { test, expect } from '@playwright/test';
import { readdir } from 'node:fs/promises';
import { resolve } from 'node:path';

test.describe('Academic Website Features', () => {
  test('MathJax renders equations with correct selectors', async ({ page }) => {
    await page.goto('/regret-ol');
    
    // Check MathJax containers exist
    const mathJaxContainer = page.locator('mjx-container');
    await expect(mathJaxContainer.first()).toBeVisible();
  });

  test('BibTeX citations and automatically generated bibliography compile', async ({ page }) => {
    await page.goto('/regret-ol');
    
    // Check citation anchor link
    const citationLink = page.locator('a[href^="#bib-"]');
    await expect(citationLink.first()).toBeVisible();
    
    // Check bibliography container
    const bibliography = page.locator('.csl-bib-body');
    await expect(bibliography).toBeVisible();
  });

  test('List of all the articles page renders successfully', async ({ page }) => {
    await page.goto('/list-articles');
    
    // Check header
    const pageHeader = page.locator('h1');
    await expect(pageHeader.first()).toHaveText('List of all the articles');
    
    // Check article link
    const articleLink = page.locator('a[href="/regret-ol/"]');
    await expect(articleLink.first()).toBeVisible();
  });

  test('header provides a localized link to the article index', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByRole('banner').getByRole('link', { name: 'Articles' })).toHaveAttribute(
      'href',
      '/list-articles/'
    );

    await page.goto('/zh/');
    await expect(page.getByRole('banner').getByRole('link', { name: '杂文' })).toHaveAttribute(
      'href',
      '/zh/list-articles/'
    );
  });

  test('sidebar separates protected reading catalogs from articles', async ({ page }) => {
    await page.goto('/zh/list-articles/');

    await expect(page.getByRole('navigation').getByRole('link', { name: '注塑工艺简介' })).toHaveAttribute(
      'href',
      'https://jackyansongli.github.io/zh/moldflow-reading/'
    );
    await expect(
      page.getByRole('navigation').getByRole('link', { name: '《注塑模具流动分析》中文译文' })
    ).toHaveAttribute('href', 'https://jackyansongli.github.io/zh/flow-analysis/');
  });

  test('desktop sidebar can be collapsed and restores its saved state', async ({ page }) => {
    await page.goto('/zh/list-articles/');

    const toggle = page.getByRole('button', { name: '收起侧边栏' });
    await expect(toggle).toHaveAttribute('aria-expanded', 'true');
    await toggle.click();
    await expect(page.locator('html')).toHaveAttribute('data-sidebar-collapsed', '');
    await expect(page.locator('.sidebar-pane')).toHaveCSS('transform', /matrix/);
    await expect(page.locator('.main-frame')).toHaveCSS('padding-left', '0px');
    await expect(page.getByRole('button', { name: '展开侧边栏' })).toHaveAttribute('aria-expanded', 'false');

    await page.reload();
    await expect(page.locator('html')).toHaveAttribute('data-sidebar-collapsed', '');
  });

  test('desktop right table of contents can be collapsed and restores its saved state', async ({ page }) => {
    await page.setViewportSize({ width: 1440, height: 900 });
    await page.goto('/zh/subagent-tutorial/');

    const toggle = page.getByRole('button', { name: '收起本页目录' });
    await expect(toggle).toHaveAttribute('aria-expanded', 'true');
    await toggle.click();
    await expect(page.locator('html')).toHaveAttribute('data-right-sidebar-collapsed', '');
    await expect(page.locator('.right-sidebar-container')).toHaveCSS('display', 'none');
    await expect(page.getByRole('button', { name: '展开本页目录' })).toHaveAttribute('aria-expanded', 'false');

    await page.reload();
    await expect(page.locator('html')).toHaveAttribute('data-right-sidebar-collapsed', '');
  });

  test('display equations stay within the main content column', async ({ page }) => {
    await page.setViewportSize({ width: 1440, height: 900 });
    await page.goto('/zh/flow-analysis/ch04-governing-equations/');
    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();

    const overflowingEquations = await page.locator('mjx-container[display="true"]').evaluateAll((equations) =>
      equations.flatMap((equation, index) => {
        const formula = equation.getBoundingClientRect();
        const content = equation.closest('.sl-markdown-content')?.getBoundingClientRect();
        const isContained = !content || (
          formula.left >= content.left &&
          formula.right <= content.right &&
          getComputedStyle(equation).overflowX === 'auto'
        );
        return isContained ? [] : [{
          index,
          formula: { left: formula.left, right: formula.right },
          content: content && { left: content.left, right: content.right },
          overflowX: getComputedStyle(equation).overflowX,
        }];
      })
    );

    expect(overflowingEquations).toEqual([]);
  });

  test('Photos page renders successfully', async ({ page }) => {
    await page.goto('/photos');
    
    // Check header
    const pageHeader = page.locator('h1');
    await expect(pageHeader.first()).toHaveText('More Photos');
  });

  test('Moldflow reading catalog requires the correct password', async ({ page }) => {
    await page.goto('/zh/moldflow-reading/');

    await expect(page.getByRole('heading', { name: '注塑工艺简介' })).toBeVisible();
    await expect(page.getByRole('link', { name: '第5章：型腔充填分析与设计' })).toBeHidden();

    await page.getByLabel('访问密码').fill('wrong-password');
    await page.getByRole('button', { name: '进入阅读区' }).click();
    await expect(page.getByText('密码不正确，请重试。')).toBeVisible();
    await expect(page.getByRole('link', { name: '第5章：型腔充填分析与设计' })).toBeHidden();

    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();
    await expect(page.getByRole('link', { name: '第5章：型腔充填分析与设计' })).toBeVisible();
  });

  test('Moldflow chapter page requires the same password', async ({ page }) => {
    await page.goto('/zh/moldflow-reading/ch05-cavity-filling/');

    await expect(page.getByLabel('访问密码')).toBeVisible();
    await expect(page.getByRole('heading', { name: '5.1 概述' })).toBeHidden();

    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();
    await expect(page.getByRole('heading', { name: '5.1 概述' })).toBeVisible();
  });

  test('flow-analysis chapter uses the shared Chinese reading access gate', async ({ page }) => {
    await page.goto('/zh/flow-analysis/ch01-current-status/');

    await expect(page.getByLabel('访问密码')).toBeVisible();
    await expect(
      page.getByRole('heading', { level: 2, name: '1.1 注塑成型工艺' })
    ).toBeHidden();

    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();

    await expect(
      page.getByRole('heading', { level: 2, name: '1.1 注塑成型工艺' })
    ).toBeVisible();
  });

  test('protected chapters provide bottom chapter navigation after unlocking', async ({ page }) => {
    await page.goto('/zh/moldflow-reading/ch02-plastic-part-design/');
    const moldflowNavigation = page.locator('[data-moldflow-protected-navigation]');
    await expect(moldflowNavigation).toBeHidden();

    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();
    await expect(moldflowNavigation.getByRole('link', { name: '返回目录' })).toHaveAttribute(
      'href',
      '/zh/moldflow-reading/'
    );
    await expect(moldflowNavigation.getByRole('link', { name: '下一章' })).toHaveAttribute(
      'href',
      '/zh/moldflow-reading/ch05-cavity-filling/'
    );
    await expect(moldflowNavigation.getByRole('link', { name: '上一章' })).toHaveCount(0);

    await page.goto('/zh/flow-analysis/ch07-fiber-orientation/');
    const middleNavigation = page.locator('[data-moldflow-protected-navigation]');
    await expect(middleNavigation.getByRole('link', { name: '上一章' })).toHaveAttribute(
      'href',
      '/zh/flow-analysis/ch06-numerical-methods/'
    );
    await expect(middleNavigation.getByRole('link', { name: '下一章' })).toHaveAttribute(
      'href',
      '/zh/flow-analysis/ch08-mechanical-properties/'
    );

    await page.goto('/zh/flow-analysis/ch14-additional-issues/');
    const finalNavigation = page.locator('[data-moldflow-protected-navigation]');
    await expect(finalNavigation.getByRole('link', { name: '上一章' })).toHaveAttribute(
      'href',
      '/zh/flow-analysis/ch13-shrinkage-warpage/'
    );
    await expect(finalNavigation.getByRole('link', { name: '下一章' })).toHaveCount(0);
  });

  test('Moldflow Design Guide catalog rejects an incorrect password', async ({ page }) => {
    await page.goto('/zh/moldflow-design-guide/');

    const protectedContent = page.locator('[data-moldflow-protected-content]');
    await expect(protectedContent).toBeHidden();

    await page.getByLabel('访问密码').fill('wrong-password');
    await page.getByRole('button', { name: '进入阅读区' }).click();
    await expect(page.getByText('密码不正确，请重试。')).toBeVisible();
    await expect(protectedContent).toBeHidden();

    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();
    await expect(protectedContent).toBeVisible();
  });

  test('Moldflow Design Guide chapter unlocks protected content', async ({ page }) => {
    await page.goto('/zh/moldflow-design-guide/ch01-polymer-flow-behavior/');

    const protectedContent = page.locator('[data-moldflow-protected-content]');
    await expect(protectedContent).toBeHidden();

    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();
    await expect(protectedContent).toBeVisible();
  });

  test('Human Use catalog requires the shared password', async ({ page }) => {
    await page.goto('/zh/human-use-of-human-beings/');
    const protectedContent = page.locator('[data-moldflow-protected-content]');

    await expect(protectedContent).toBeHidden();
    await page.getByLabel('访问密码').fill('wrong-password');
    await page.getByRole('button', { name: '进入阅读区' }).click();
    await expect(page.getByText('密码不正确，请重试。')).toBeVisible();
    await expect(protectedContent).toBeHidden();

    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();
    await expect(protectedContent).toBeVisible();
    await expect(page.getByRole('link', { name: '第1章：什么是控制论？' })).toBeVisible();
  });

  test('Human Use Chapter XI preserves both figures and links to Chapter XII', async ({ page }) => {
    await page.goto('/zh/human-use-of-human-beings/ch11-communication-machines/');
    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();

    await expect(
      page.locator('img[src="/images/human-use-of-human-beings/moth-or-bedbug.png"]')
    ).toBeVisible();
    await expect(
      page.locator('img[src="/images/human-use-of-human-beings/hearing-aid.png"]')
    ).toBeVisible();
    await expect(
      page.locator('[data-moldflow-protected-navigation]').getByRole('link', { name: '下一章' })
    ).toHaveAttribute('href', '/zh/human-use-of-human-beings/ch12-voices-of-rigidity/');
  });

  test('Human Use boundary chapters omit unavailable navigation links', async ({ page }) => {
    await page.goto('/zh/human-use-of-human-beings/ch01-what-is-cybernetics/');
    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();

    const firstNavigation = page.locator('[data-moldflow-protected-navigation]');
    await expect(firstNavigation.getByRole('link', { name: '上一章' })).toHaveCount(0);
    await expect(firstNavigation.getByRole('link', { name: '下一章' })).toHaveAttribute(
      'href',
      '/zh/human-use-of-human-beings/ch02-progress-and-entropy/'
    );

    await page.goto('/zh/human-use-of-human-beings/ch12-voices-of-rigidity/');
    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();

    const finalNavigation = page.locator('[data-moldflow-protected-navigation]');
    await expect(finalNavigation.getByRole('link', { name: '上一章' })).toHaveAttribute(
      'href',
      '/zh/human-use-of-human-beings/ch11-communication-machines/'
    );
    await expect(finalNavigation.getByRole('link', { name: '下一章' })).toHaveCount(0);
  });

  test('Moldflow Design Guide navigation uses the exact first, middle, and final hrefs', async ({ page }) => {
    await page.goto('/zh/moldflow-design-guide/ch01-polymer-flow-behavior/');

    const firstNavigation = page.locator('[data-moldflow-protected-navigation]');
    await expect(firstNavigation).toBeHidden();

    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();
    await expect(firstNavigation).toBeVisible();
    await expect(firstNavigation.getByRole('link', { name: '返回目录' })).toHaveAttribute(
      'href',
      '/zh/moldflow-design-guide/'
    );
    await expect(firstNavigation.getByRole('link', { name: '上一章' })).toHaveCount(0);
    await expect(firstNavigation.getByRole('link', { name: '下一章' })).toHaveAttribute(
      'href',
      '/zh/moldflow-design-guide/ch02-molding-conditions-pressure/'
    );

    await page.goto('/zh/moldflow-design-guide/ch06-product-design/');
    const middleNavigation = page.locator('[data-moldflow-protected-navigation]');
    await expect(middleNavigation.getByRole('link', { name: '上一章' })).toHaveAttribute(
      'href',
      '/zh/moldflow-design-guide/ch05-meshes-used-in-analyses/'
    );
    await expect(middleNavigation.getByRole('link', { name: '下一章' })).toHaveAttribute(
      'href',
      '/zh/moldflow-design-guide/ch07-gate-design/'
    );

    await page.goto('/zh/moldflow-design-guide/appendix-d-plastic-materials/');
    const finalNavigation = page.locator('[data-moldflow-protected-navigation]');
    await expect(finalNavigation.getByRole('link', { name: '上一章' })).toHaveAttribute(
      'href',
      '/zh/moldflow-design-guide/appendix-c-process-control/'
    );
    await expect(finalNavigation.getByRole('link', { name: '下一章' })).toHaveCount(0);
  });

  test('all 16 Moldflow Design Guide routes remain protected', async ({ page }) => {
    const routes = [
      'ch01-polymer-flow-behavior',
      'ch02-molding-conditions-pressure',
      'ch03-filling-pattern',
      'ch04-design-principles',
      'ch05-meshes-used-in-analyses',
      'ch06-product-design',
      'ch07-gate-design',
      'ch08-runner-system-design',
      'ch09-cooling-system-design',
      'ch10-shrinkage-warpage',
      'ch11-design-procedure',
      'ch12-part-defects',
      'appendix-a-injection-molding',
      'appendix-b-machine-systems-operations',
      'appendix-c-process-control',
      'appendix-d-plastic-materials',
    ];

    for (const route of routes) {
      await page.goto(`/zh/moldflow-design-guide/${route}/`);
      await expect(page.getByLabel('访问密码')).toBeVisible();
      await expect(page.locator('[data-moldflow-protected-content]')).toBeHidden();
    }
  });

  test('protected Chinese book content never renders a body H1', async ({ page }) => {
    const routes = [
      '/zh/moldflow-reading/',
      '/zh/flow-analysis/',
      '/zh/moldflow-design-guide/',
      ...[
        'ch02-plastic-part-design',
        'ch05-cavity-filling',
        'ch06-feed-system-design',
        'ch07-gating-design',
        'ch08-venting',
        'ch09-cooling-system-design',
        'ch10-shrinkage-warpage',
        'ch14-mold-commissioning',
        'ch15-appendix',
      ].map((route) => `/zh/moldflow-reading/${route}/`),
      ...Array.from({ length: 14 }, (_, chapter) =>
        `/zh/flow-analysis/ch${String(chapter + 1).padStart(2, '0')}-${[
          'current-status',
          'stress-strain',
          'polymer-properties',
          'governing-equations',
          'injection-molding-approximations',
          'numerical-methods',
          'fiber-orientation',
          'mechanical-properties',
          'long-fiber-materials',
          'crystallization',
          'crystallization-effects',
          'colorants',
          'shrinkage-warpage',
          'additional-issues',
        ][chapter]}/`
      ),
      ...[
        'ch01-polymer-flow-behavior',
        'ch02-molding-conditions-pressure',
        'ch03-filling-pattern',
        'ch04-design-principles',
        'ch05-meshes-used-in-analyses',
        'ch06-product-design',
        'ch07-gate-design',
        'ch08-runner-system-design',
        'ch09-cooling-system-design',
        'ch10-shrinkage-warpage',
        'ch11-design-procedure',
        'ch12-part-defects',
        'appendix-a-injection-molding',
        'appendix-b-machine-systems-operations',
        'appendix-c-process-control',
        'appendix-d-plastic-materials',
      ].map((route) => `/zh/moldflow-design-guide/${route}/`),
    ];

    for (const route of routes) {
      await page.goto(route);
      await expect(page.locator('[data-moldflow-protected-content] h1')).toHaveCount(0);
    }
  });

  test('Moldflow Design Guide publishes only the canonical 16 routes', async () => {
    const routes = await readdir(resolve('docs/content/docs/zh/moldflow-design-guide'));
    expect(routes.filter((route) => route.endsWith('.md')).sort()).toEqual([
      'appendix-a-injection-molding.md',
      'appendix-b-machine-systems-operations.md',
      'appendix-c-process-control.md',
      'appendix-d-plastic-materials.md',
      'ch01-polymer-flow-behavior.md',
      'ch02-molding-conditions-pressure.md',
      'ch03-filling-pattern.md',
      'ch04-design-principles.md',
      'ch05-meshes-used-in-analyses.md',
      'ch06-product-design.md',
      'ch07-gate-design.md',
      'ch08-runner-system-design.md',
      'ch09-cooling-system-design.md',
      'ch10-shrinkage-warpage.md',
      'ch11-design-procedure.md',
      'ch12-part-defects.md',
    ]);
  });

  test('catalog-linked Moldflow Design Guide Chapter 5 reveals translated prose after unlocking', async ({ page }) => {
    await page.goto('/zh/moldflow-design-guide/ch05-meshes-used-in-analyses/');

    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();

    await expect(
      page.getByText('要运行 Moldflow 分析，必须在零件模型上建立合适的有限元网格。')
    ).toBeVisible();
  });

  test('flow-analysis equations do not contain MathJax rendering errors', async ({ page }) => {
    await page.goto('/zh/flow-analysis/ch02-stress-strain/');
    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();

    await expect(page.locator('mjx-container')).not.toHaveCount(0);
    await expect(page.locator('[data-mjx-error]')).toHaveCount(0);
  });
});
