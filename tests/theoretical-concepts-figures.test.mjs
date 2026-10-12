import assert from 'node:assert/strict';
import { access, readFile } from 'node:fs/promises';
import { join } from 'node:path';
import test from 'node:test';

const chapterDirectory = new URL('../docs/content/docs/zh/theoretical-concepts-in-physics/', import.meta.url);
const imageDirectory = new URL('../public/images/theoretical-concepts-in-physics/', import.meta.url);
const chapters = [
  ['ch09-motion-of-fluids.md', 9, 17],
  ['ch11-basic-thermodynamics.md', 11, 21],
  ['ch12-kinetic-theory-statistical-mechanics.md', 12, 12],
];

test('Theoretical Concepts chapters publish all mapped source figures with checked-in assets', async () => {
  let totalFigures = 0;

  for (const [chapterName, chapter, figureCount] of chapters) {
    const source = await readFile(join(chapterDirectory.pathname, chapterName), 'utf8');
    const protectedStart = source.indexOf('<div data-moldflow-protected-content>');
    const protectedEnd = source.indexOf('</div>');
    assert.ok(protectedStart >= 0 && protectedEnd > protectedStart, `${chapterName} must retain its protected content gate`);

    for (let figure = 1; figure <= figureCount; figure += 1) {
      const assetName = `fig-${chapter}-${figure}.png`;
      const image = `<img src="/images/theoretical-concepts-in-physics/${assetName}"`;
      const imageIndex = source.indexOf(image);
      assert.ok(imageIndex > protectedStart && imageIndex < protectedEnd, `${assetName} must be inserted inside the protected content gate`);
      await access(join(imageDirectory.pathname, assetName));
      totalFigures += 1;
    }
  }

  assert.equal(totalFigures, 50);
});
