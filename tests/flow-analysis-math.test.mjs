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
const unsupportedMathDelimiter = /(?<!\\)\\[\[\]\(\)]/;

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

test('flow-analysis Markdown does not use unsupported backslash math delimiters', async () => {
  const chapterNames = (await readdir(chapterDirectory)).filter((name) => name.endsWith('.md'));
  const invalidPages = [];

  for (const chapterName of chapterNames) {
    const source = await readFile(join(chapterDirectory.pathname, chapterName), 'utf8');
    if (unsupportedMathDelimiter.test(source)) invalidPages.push(chapterName);
  }

  assert.deepEqual(invalidPages, []);
});

test('chapter 6 preserves its Markdown hierarchy without PDF layout artifacts', async () => {
  const chapterSix = await readFile(
    new URL('../docs/content/docs/zh/flow-analysis/ch06-numerical-methods.md', import.meta.url),
    'utf8',
  );

  for (const heading of [
    '## 6.1 中平面方法',
    '### 6.1.1 从三维模型中提取中面',
    '### 6.1.2 双域分析法用于流动分析',
    '### 6.1.3 双域结构分析',
    '### 6.1.4 双域有限元法的翘曲分析',
    '## 6.2 三维分析',
    '### 6.2.1 有限体积法',
    '### 6.2.2 半三维方法',
    '## 6.3 三维中的翘曲和收缩分析',
    '## 6.4 流道系统的三维分析',
  ]) {
    assert.match(chapterSix, new RegExp(`^${heading}$`, 'm'));
  }

  assert.doesNotMatch(chapterSix, /6\.1 中面方法 101|6\.2 三维分析 107|■|^\. /m);
  assert.equal((chapterSix.match(/^## 6\.4 流道系统的三维分析$/gm) ?? []).length, 1);
  assert.match(chapterSix, /- 从3D模型中提取中平面\n- 双域分析\n- 全3D分析/);

  for (const caption of [
    '图 6.1：中面网格的生成',
    '图 6.2：复杂注塑件的三维表示',
    '图 6.3：双域流动分析',
    '图 6.4：带两个肋的部件的双域流动分析',
    '图 6.5：一个简单平板可分解为两个部分',
    '图 6.6：用于结构分析的偏心壳单元',
    '图 6.7：为双域分析配对的结构单元',
    '图 6.8：顶面和底面的单元通常不重合',
    '图 6.9：在三维分析中',
  ]) {
    assert.match(chapterSix, new RegExp(`^\\*${caption}`, 'm'));
  }
});
