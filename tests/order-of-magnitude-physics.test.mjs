import assert from 'node:assert/strict';
import { access, readFile } from 'node:fs/promises';
import { promisify } from 'node:util';
import { execFile } from 'node:child_process';
import { join } from 'node:path';
import test from 'node:test';

const chapterDirectory = new URL('../docs/content/docs/zh/order-of-magnitude-physics/', import.meta.url);
const imageDirectory = new URL('../public/images/order-of-magnitude-physics/', import.meta.url);
const catalog = new URL('../docs/content/docs/zh/order-of-magnitude-physics.md', import.meta.url);
const chapters = [
  ['ch01-wetting-your-feet.md', 1, 9],
  ['ch02-dimensional-analysis.md', 2, 10],
  ['ch03-materials-i.md', 3, 9],
  ['ch04-materials-ii.md', 4, 1],
  ['ch05-waves.md', 5, 20],
];
const execFileAsync = promisify(execFile);

test('Order-of-Magnitude Physics publishes a gated five-chapter Chinese translation', async () => {
  const catalogSource = await readFile(catalog, 'utf8');
  assert.match(catalogSource, /data-moldflow-protected-content/);
  assert.match(catalogSource, /moldflow-reading-gate\.js/);

  for (const [chapterName] of chapters) {
    const source = await readFile(join(chapterDirectory.pathname, chapterName), 'utf8');
    assert.match(source, /data-moldflow-protected-content/, `${chapterName} must be protected`);
    assert.match(source, /moldflow-reading-gate\.js/, `${chapterName} must load the access gate`);
  }
});

test('Order-of-Magnitude Physics publishes every source figure as a crop', async () => {
  let totalFigures = 0;

  for (const [chapterName, chapter, figureCount] of chapters) {
    const source = await readFile(join(chapterDirectory.pathname, chapterName), 'utf8');
    const protectedStart = source.indexOf('<div data-moldflow-protected-content>');
    const protectedEnd = source.indexOf('</div>');

    for (let figure = 1; figure <= figureCount; figure += 1) {
      const assetName = `fig-${chapter}-${figure}.png`;
      const image = `<img src="/images/order-of-magnitude-physics/${assetName}"`;
      const imageIndex = source.indexOf(image);
      assert.ok(imageIndex > protectedStart && imageIndex < protectedEnd, `${assetName} must appear inside protected content`);
      await access(join(imageDirectory.pathname, assetName));
      const { stdout } = await execFileAsync('magick', ['identify', '-format', '%w %h', join(imageDirectory.pathname, assetName)]);
      const [width, height] = stdout.trim().split(' ').map(Number);
      assert.ok(width > 0 && height > 0, `${assetName} must be readable`);
      assert.ok(width * height < 1489 * 1938, `${assetName} must be a crop rather than a full page`);
      totalFigures += 1;
    }
  }

  assert.equal(totalFigures, 49);
});

test('Order-of-Magnitude Physics preserves source equation numbering without control characters', async () => {
  const equationRanges = [
    ['ch01-wetting-your-feet.md', 1, 20],
    ['ch02-dimensional-analysis.md', 2, 53],
    ['ch03-materials-i.md', 3, 65],
    ['ch04-materials-ii.md', 4, 64],
    ['ch05-waves.md', 5, 92],
  ];

  for (const [chapterName, chapter, maximum] of equationRanges) {
    const source = await readFile(join(chapterDirectory.pathname, chapterName), 'utf8');
    assert.doesNotMatch(source, /[\u0000-\u0009\u000B\u000C\u000E-\u001F\u007F]/, `${chapterName} must not contain control characters`);

    for (let equation = 1; equation <= maximum; equation += 1) {
      if (chapter === 4 && equation === 29) {
        assert.match(source, /\\tag\{4\.28\}\\qquad\\text\{\(4\.29\)\}/, `${chapterName} must retain the source's adjacent (4.29) label`);
        continue;
      }
      assert.match(source, new RegExp(String.raw`\\tag\{${chapter}\.${equation}\}`), `${chapterName} must retain (${chapter}.${equation})`);
    }
  }
});
