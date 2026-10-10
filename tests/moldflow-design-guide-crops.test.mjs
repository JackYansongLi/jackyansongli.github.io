import assert from 'node:assert/strict';
import { execFile as execFileCallback } from 'node:child_process';
import { readdir } from 'node:fs/promises';
import test from 'node:test';
import { promisify } from 'node:util';

const execFile = promisify(execFileCallback);
const imageDirectory = new URL('../public/images/moldflow-design-guide/', import.meta.url);
const minimumMargin = 20;

async function edgeMinimum(fileName, geometry) {
  const { stdout } = await execFile('magick', [
    new URL(fileName, imageDirectory).pathname,
    '-crop',
    geometry,
    '-colorspace',
    'Gray',
    '-threshold',
    '98%',
    '-format',
    '%[fx:minima]',
    'info:',
  ]);
  return Number(stdout.trim());
}

test('Moldflow Design Guide figure crops retain a white safety margin', async () => {
  const files = (await readdir(imageDirectory)).filter((file) => file.endsWith('.png'));
  const clipped = [];

  for (const file of files) {
    const { stdout } = await execFile('magick', [
      new URL(file, imageDirectory).pathname,
      '-format',
      '%w %h',
      'info:',
    ]);
    const [canvasWidth, canvasHeight] = stdout.trim().split(' ').map(Number);
    const edges = [
      `20x${canvasHeight}+0+0`,
      `20x${canvasHeight}+${canvasWidth - minimumMargin}+0`,
      `${canvasWidth}x20+0+0`,
      `${canvasWidth}x20+0+${canvasHeight - minimumMargin}`,
    ];
    const minima = await Promise.all(edges.map((geometry) => edgeMinimum(file, geometry)));
    if (minima.some((minimum) => minimum !== 1)) clipped.push(`${file}: ${minima.join('/')}`);
  }

  assert.deepEqual(clipped, [], `figure content must remain at least ${minimumMargin}px from every crop edge`);
});
