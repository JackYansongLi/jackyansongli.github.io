import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import test from 'node:test';

const chapters = [
  ['ch11-basic-thermodynamics.md', 11, 57],
];
const chapterDirectory = new URL('../docs/content/docs/zh/theoretical-concepts-in-physics/', import.meta.url);

function escapeRegExp(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

test('Theoretical Concepts preserves every source-numbered equation in a standalone display block', async () => {
  for (const [chapterName, chapterNumber, lastEquation] of chapters) {
    const source = await readFile(new URL(chapterName, chapterDirectory), 'utf8');

    for (let equation = 1; equation <= lastEquation; equation += 1) {
      const tag = `\\tag{${chapterNumber}.${equation}}`;
      const occurrences = source.match(new RegExp(escapeRegExp(tag), 'g')) ?? [];
      assert.equal(occurrences.length, 1, `${chapterName} must contain ${tag} exactly once`);

      const taggedBlocks = source
        .split('$$')
        .filter((_block, index) => index % 2 === 1)
        .filter((block) => block.includes(tag));
      assert.equal(taggedBlocks.length, 1, `${tag} must occur in exactly one display-math block`);
    }
  }
});
