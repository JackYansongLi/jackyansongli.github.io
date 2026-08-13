import { test, expect } from '@playwright/test';

test.describe('Academic Website Features', () => {
  test('MathJax renders equations with correct selectors', async ({ page }) => {
    await page.goto('http://localhost:4321/regret-ol');
    
    // Check MathJax containers exist
    const mathJaxContainer = page.locator('mjx-container');
    await expect(mathJaxContainer.first()).toBeVisible();
  });

  test('BibTeX citations and automatically generated bibliography compile', async ({ page }) => {
    await page.goto('http://localhost:4321/regret-ol');
    
    // Check citation anchor link
    const citationLink = page.locator('a[href^="#bib-"]');
    await expect(citationLink.first()).toBeVisible();
    
    // Check bibliography container
    const bibliography = page.locator('.csl-bib-body');
    await expect(bibliography).toBeVisible();
  });

  test('List of all the articles page renders successfully', async ({ page }) => {
    await page.goto('http://localhost:4321/list-articles');
    
    // Check header
    const pageHeader = page.locator('h1');
    await expect(pageHeader.first()).toHaveText('List of all the articles');
    
    // Check article link
    const articleLink = page.locator('a[href="/regret-ol/"]');
    await expect(articleLink.first()).toBeVisible();
  });

  test('Photos page renders successfully', async ({ page }) => {
    await page.goto('http://localhost:4321/photos');
    
    // Check header
    const pageHeader = page.locator('h1');
    await expect(pageHeader.first()).toHaveText('More Photos');
  });
});
