import { test, expect } from '@playwright/test';

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

  test('Photos page renders successfully', async ({ page }) => {
    await page.goto('/photos');
    
    // Check header
    const pageHeader = page.locator('h1');
    await expect(pageHeader.first()).toHaveText('More Photos');
  });

  test('Moldflow reading catalog requires the correct password', async ({ page }) => {
    await page.goto('/zh/moldflow-reading/');

    await expect(page.getByRole('heading', { name: 'Moldflow 仿真阅读' })).toBeVisible();
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
    await expect(page.getByRole('heading', { name: '第1章 绪论' })).toHaveCount(0);

    await page.getByLabel('访问密码').fill('761893');
    await page.getByRole('button', { name: '进入阅读区' }).click();

    await expect(page.getByRole('heading', { name: '第1章 绪论' })).toBeVisible();
  });
});
