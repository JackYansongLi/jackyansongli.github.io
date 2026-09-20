import assert from 'node:assert/strict';
import { readdir, readFile } from 'node:fs/promises';
import { join } from 'node:path';
import test from 'node:test';

const chapterDirectory = new URL('../docs/content/docs/zh/flow-analysis/', import.meta.url);
const tagInsideAligned = /\\begin\{aligned\}(?:(?!\\end\{aligned\})[\s\S])*?\\tag\{[^}]+\}(?:(?!\\end\{aligned\})[\s\S])*?\\end\{aligned\}/;
const multipleDisplayTags = /\$\$[\s\S]*?\\tag\{[^}]+\}\s*\\tag\{[^}]+\}[\s\S]*?\$\$/;
const inlineDisplayEnvironment = /\$\$[^\n]*\\(?:begin|end)\{/;
const inlineEnvironmentClosingDelimiter = /\\end\{[a-z]+\}[^\n$]*\$\$/;
const singleDollarAfterEnvironment = /\\end\{[a-z]+\}(?:\s+\\tag\{[^}]+\})?\n\$(?!\$)/;
const singleDollarBeforeEnvironment = /^\$(?!\$)\n\\begin\{[a-z]+\}/m;
const oversizedDisplayDelimiter = /^\${3,}$/m;

test('flow-analysis Markdown does not place equation tags inside aligned environments', async () => {
  const chapterNames = (await readdir(chapterDirectory)).filter((name) => name.endsWith('.md'));
  const invalidPages = [];

  for (const chapterName of chapterNames) {
    const source = await readFile(join(chapterDirectory.pathname, chapterName), 'utf8');
    if (tagInsideAligned.test(source)) invalidPages.push(chapterName);
  }

  assert.deepEqual(invalidPages, []);
});

test('flow-analysis Markdown has at most one tag per display equation', async () => {
  const chapterNames = (await readdir(chapterDirectory)).filter((name) => name.endsWith('.md'));
  const invalidPages = [];

  for (const chapterName of chapterNames) {
    const source = await readFile(join(chapterDirectory.pathname, chapterName), 'utf8');
    if (multipleDisplayTags.test(source)) invalidPages.push(chapterName);
  }

  assert.deepEqual(invalidPages, []);
});

test('flow-analysis Markdown places display environments on lines inside their delimiters', async () => {
  const chapterNames = (await readdir(chapterDirectory)).filter((name) => name.endsWith('.md'));
  const invalidPages = [];

  for (const chapterName of chapterNames) {
    const source = await readFile(join(chapterDirectory.pathname, chapterName), 'utf8');
    if (inlineDisplayEnvironment.test(source) || inlineEnvironmentClosingDelimiter.test(source)) {
      invalidPages.push(chapterName);
    }
  }

  assert.deepEqual(invalidPages, []);
});

test('flow-analysis Markdown closes display environments with double-dollar delimiters', async () => {
  const chapterNames = (await readdir(chapterDirectory)).filter((name) => name.endsWith('.md'));
  const invalidPages = [];

  for (const chapterName of chapterNames) {
    const source = await readFile(join(chapterDirectory.pathname, chapterName), 'utf8');
    if (
      singleDollarAfterEnvironment.test(source) ||
      singleDollarBeforeEnvironment.test(source) ||
      oversizedDisplayDelimiter.test(source)
    ) {
      invalidPages.push(chapterName);
    }
  }

  assert.deepEqual(invalidPages, []);
});
