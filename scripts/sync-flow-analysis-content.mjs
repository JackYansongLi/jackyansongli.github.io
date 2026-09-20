import { mkdir, readFile, writeFile } from 'node:fs/promises';
import { join, resolve } from 'node:path';

const sourceDirectory = process.env.FLOW_ANALYSIS_SOURCE;
if (!sourceDirectory) {
  throw new Error('Set FLOW_ANALYSIS_SOURCE to the private translated-markdown directory.');
}

const outputDirectory = resolve('docs/content/docs/zh/flow-analysis');
const chapters = [
  ['ch01-current-status.md', 'ch01-current-status', '第 1 章：仿真现状'],
  ['ch02-stress-strain.md', 'ch02-stress-strain', '第 2 章：流体力学中的应力与应变'],
  ['ch03-polymer-properties.md', 'ch03-polymer-properties', '第 3 章：聚合物的材料性质'],
  ['ch04-governing-equations.md', 'ch04-governing-equations', '第 4 章：控制方程'],
  ['ch05-injection-molding-approximations.md', 'ch05-injection-molding-approximations', '第 5 章：注塑成型近似方法'],
  ['ch06-numerical-methods.md', 'ch06-numerical-methods', '第 6 章：数值求解方法'],
  ['ch07-fiber-orientation.md', 'ch07-fiber-orientation', '第 7 章：改进的纤维取向建模'],
  ['ch08-mechanical-properties.md', 'ch08-mechanical-properties', '第 8 章：改进的力学性能建模'],
  ['ch09-long-fiber-materials.md', 'ch09-long-fiber-materials', '第 9 章：长纤维填充材料'],
  ['ch10-crystallization.md', 'ch10-crystallization', '第 10 章：结晶'],
  ['ch11-crystallization-effects.md', 'ch11-crystallization-effects', '第 11 章：结晶对流变与热性能的影响'],
  ['ch12-colorants.md', 'ch12-colorants', '第 12 章：着色剂对结晶与收缩的影响'],
  ['ch13-shrinkage-warpage.md', 'ch13-shrinkage-warpage', '第 13 章：成型后收缩与翘曲预测'],
  ['ch14-additional-issues.md', 'ch14-additional-issues', '第 14 章：注塑成型仿真的其他问题'],
];

function page(title, content) {
  return `---
title: ${title}
description: 《注塑模具流动分析》中文译文。
prev: false
next: false
head:
  - tag: script
    attrs:
      type: module
      src: /scripts/moldflow-reading-gate.js
---

<div data-moldflow-protected-content>

${content.trim()}

</div>
`;
}

await mkdir(outputDirectory, { recursive: true });
for (const [sourceName, slug, title] of chapters) {
  const content = await readFile(join(resolve(sourceDirectory), sourceName), 'utf8');
  await writeFile(join(outputDirectory, `${slug}.md`), page(title, content), 'utf8');
}
