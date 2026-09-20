import { readdir, readFile, writeFile } from 'node:fs/promises';
import { join } from 'node:path';

const chapterDirectory = 'docs/content/docs/zh/flow-analysis';
const tagInsideAligned = /\\begin\{aligned\}((?:(?!\\end\{aligned\})[\s\S])*?)\\tag\{([^}]+)\}((?:(?!\\end\{aligned\})[\s\S])*?)\\end\{aligned\}/g;
const duplicateAlignedTags = /\\end\{aligned\}\s*\\tag\{([^}]+)\}\s*\\tag\{([^}]+)\}/g;

for (const chapterName of await readdir(chapterDirectory)) {
  if (!chapterName.endsWith('.md')) continue;

  const chapterPath = join(chapterDirectory, chapterName);
  const source = await readFile(chapterPath, 'utf8');
  const movedTags = source.replace(tagInsideAligned, (_match, beforeTag, tag, afterTag) => (
    `\\begin{aligned}${beforeTag}${afterTag}\\end{aligned} \\tag{${tag}}`
  ));
  const normalized = movedTags.replace(duplicateAlignedTags, (_match, firstTag, secondTag) => {
    const retainedTag = chapterName === 'ch04-governing-equations.md' ? firstTag : secondTag;
    return `\\end{aligned} \\tag{${retainedTag}}`;
  }).replace(/^\${3,}$/gm, () => '$$')
    .replace(/\$\$([^\n]*\\begin\{[a-z]+\})/g, (_match, begin) => `$$\n${begin}`)
    .replace(/(?<!\$)\$(?!\$)\n(\\begin\{[a-z]+\})/g, (_match, begin) => `$$\n${begin}`)
    .replace(/(\\end\{[a-z]+\}[^\n$]*)\$\$/g, (_match, end) => `${end}\n$$`)
    .replace(/(\\end\{[a-z]+\}(?:\s+\\tag\{[^}]+\})?)\s*\$\$/g, (_match, end) => `${end}\n$$`)
    .replace(/(\\end\{[a-z]+\}(?:\s+\\tag\{[^}]+\})?)\n\$(?!\$)/g, (_match, end) => `${end}\n$$`);

  if (normalized !== source) await writeFile(chapterPath, normalized, 'utf8');
}
