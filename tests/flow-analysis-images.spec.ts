import { expect, test } from '@playwright/test';

const chapters = [
  ['ch01-current-status', 2],
  ['ch02-stress-strain', 3],
  ['ch03-polymer-properties', 4],
  ['ch04-governing-equations', 1],
  ['ch05-injection-molding-approximations', 10],
  ['ch06-numerical-methods', 9],
  ['ch07-fiber-orientation', 1],
  ['ch08-mechanical-properties', 6],
  ['ch09-long-fiber-materials', 3],
  ['ch10-crystallization', 7],
  ['ch11-crystallization-effects', 3],
  ['ch12-colorants', 10],
  ['ch13-shrinkage-warpage', 0],
  ['ch14-additional-issues', 3],
] as const;

for (const [slug, count] of chapters) {
  test(`${slug} loads every restored figure within the reading area`, async ({ page }) => {
    await page.addInitScript(() => {
      sessionStorage.setItem('moldflow-reading-access', 'granted');
    });
    await page.goto(`/zh/flow-analysis/${slug}/`);
    const content = page.locator('[data-moldflow-protected-content]');
    await expect(content).toBeVisible();
    const images = content.locator('img[src^="/images/flow-analysis/"]');
    await expect(images).toHaveCount(count);
    for (const image of await images.all()) {
      await image.scrollIntoViewIfNeeded();
      await expect.poll(() => image.evaluate((element) => {
        const img = element as HTMLImageElement;
        return img.complete && img.naturalWidth > 0 && img.naturalHeight > 0;
      })).toBe(true);
      await expect(image).toHaveAttribute('alt', /图 \d+\.\d+/);
      const fits = await image.evaluate((element) => {
        const box = element.getBoundingClientRect();
        return box.width <= document.documentElement.clientWidth;
      });
      expect(fits).toBe(true);
    }
  });
}
