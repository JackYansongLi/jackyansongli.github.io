import assert from 'node:assert/strict';
import { access, readFile } from 'node:fs/promises';
import { join } from 'node:path';
import test from 'node:test';

const chapterDirectory = new URL('../docs/content/docs/zh/flow-analysis/', import.meta.url);
const imageDirectory = new URL('../public/images/flow-analysis/', import.meta.url);
const chapters = [
  ['ch01-current-status.md', 1, 2],
  ['ch02-stress-strain.md', 2, 3],
  ['ch03-polymer-properties.md', 3, 4],
  ['ch04-governing-equations.md', 4, 1],
  ['ch05-injection-molding-approximations.md', 5, 10],
  ['ch06-numerical-methods.md', 6, 9],
  ['ch07-fiber-orientation.md', 7, 1],
  ['ch08-mechanical-properties.md', 8, 6],
  ['ch09-long-fiber-materials.md', 9, 3],
  ['ch10-crystallization.md', 10, 7],
  ['ch11-crystallization-effects.md', 11, 3],
  ['ch12-colorants.md', 12, 10],
  ['ch13-shrinkage-warpage.md', 13, 0],
  ['ch14-additional-issues.md', 14, 3],
];
const captionPattern = /^\*(图 (\d+)\.(\d+)：.+)\*$/gm;
const imagePattern = /<img src="\/images\/flow-analysis\/fig-(\d+)-(\d+)\.png" alt="([^"]*)" loading="lazy" decoding="async" \/>/g;

function escapeHtmlAttribute(value) {
  return value.replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
}

test('Flow Analysis captions have one protected image, matching alt text, and a checked-in asset', async () => {
  const expectedIds = [];
  const imageIds = [];
  const missingAssets = [];

  for (const [chapterName, chapter, expectedCount] of chapters) {
    const source = await readFile(join(chapterDirectory.pathname, chapterName), 'utf8');
    const protectedStart = source.indexOf('<div data-moldflow-protected-content>');
    const protectedEnd = source.indexOf('</div>');
    assert.ok(protectedStart >= 0 && protectedEnd > protectedStart, `${chapterName} must retain its protected content gate`);

    const captions = [...source.matchAll(captionPattern)];
    assert.equal(captions.length, expectedCount, `${chapterName} must retain its expected figure caption count`);

    for (const caption of captions) {
      const [fullCaption, captionText, captionChapter, figure] = caption;
      assert.equal(Number(captionChapter), chapter, `${fullCaption} must remain in chapter ${chapter}`);

      const id = `${captionChapter}-${figure}`;
      const image = `<img src="/images/flow-analysis/fig-${id}.png" alt="${escapeHtmlAttribute(captionText)}" loading="lazy" decoding="async" />`;
      const imageIndex = source.indexOf(image);
      assert.ok(imageIndex >= 0, `${fullCaption} must have its matching image tag`);
      assert.equal(source.slice(imageIndex + image.length, imageIndex + image.length + 3), '\n\n*', `${fullCaption} image must be a blank-line paragraph before its caption`);
      assert.ok(imageIndex > protectedStart && imageIndex < protectedEnd, `${fullCaption} image must be inside the protected content gate`);

      expectedIds.push(id);
      try {
        await access(join(imageDirectory.pathname, `fig-${id}.png`));
      } catch {
        missingAssets.push(`fig-${id}.png`);
      }
    }

    for (const image of source.matchAll(imagePattern)) {
      const [fullImage, imageChapter, figure, alt] = image;
      const imageIndex = image.index;
      const matchingCaption = captions.find(
        (caption) => caption[2] === imageChapter && caption[3] === figure,
      );
      assert.ok(imageIndex > protectedStart && imageIndex < protectedEnd, `${fullImage} must be inside the protected content gate`);
      assert.ok(matchingCaption, `${fullImage} must have a matching caption`);
      assert.equal(alt, escapeHtmlAttribute(matchingCaption[1]), `${fullImage} must have matching caption alt text`);
      imageIds.push(`${imageChapter}-${figure}`);
    }
  }

  assert.equal(expectedIds.length, 62);
  assert.equal(imageIds.length, 62);
  assert.deepEqual(imageIds.sort(), expectedIds.sort());
  assert.equal(new Set(imageIds).size, imageIds.length);
  assert.deepEqual(missingAssets, [], 'all referenced Flow Analysis figure assets must exist');
});
