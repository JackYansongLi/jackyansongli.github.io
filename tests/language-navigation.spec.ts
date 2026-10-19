import { test, expect } from '@playwright/test';

for (const mobile of [false, true]) {
  test.describe(mobile ? 'mobile language navigation' : 'desktop language navigation', () => {
    test.use({ viewport: mobile ? { width: 390, height: 844 } : { width: 1280, height: 900 } });

    for (const route of ['/', '/list-articles/', '/fluid-mechanics/helmholtz-decomposition/', '/regret-ol/']) {
      test(`switches both ways on ${route}`, async ({ page }) => {
        for (const chinese of [false, true]) {
          const source = chinese ? `/zh${route}` : route;
          const target = chinese ? route : `/zh${route}`;
          const label = chinese ? 'English' : '中文';
          const lang = chinese ? 'en' : 'zh-CN';
          await page.goto(source);
          const useMobileMenu = mobile && route !== '/';
          if (useMobileMenu) await page.locator('starlight-menu-button button').click();

          await expect(page.locator('starlight-lang-select')).toHaveCount(0);
          const container = useMobileMenu ? page.locator('.mobile-preferences') : page.getByRole('banner');
          const link = container.getByRole('link', { name: label, exact: true });
          await expect(link).toBeVisible();
          await expect(link).toHaveAttribute('href', target);
          await expect(link).toHaveAttribute('lang', lang);
          await expect(link).toHaveAttribute('hreflang', lang);
          await page.keyboard.press('Tab');
          await link.focus();
          await expect(link).toBeFocused();
          await expect(link).toHaveCSS('outline-style', 'solid');
          await link.press('Enter');
          await expect(page).toHaveURL(new URL(target, page.url()).href);
          await expect(page.locator('html')).toHaveAttribute('lang', lang);
        }
      });
    }
  });
}
