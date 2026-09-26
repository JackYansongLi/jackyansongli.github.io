import { mkdir, readFile, readdir, rm, writeFile } from 'node:fs/promises';
import { join, resolve } from 'node:path';

const sourceDirectory = process.env.MOLDFLOW_DESIGN_GUIDE_SOURCE;
if (!sourceDirectory) {
  throw new Error('Set MOLDFLOW_DESIGN_GUIDE_SOURCE to the private translated-markdown directory.');
}

const outputDirectory = resolve('docs/content/docs/zh/moldflow-design-guide');
const chapters = [
  ['ch01-polymer-flow-behavior.md', 'ch01-polymer-flow-behavior', '第1章：注塑模具中的聚合物流动行为'],
  ['ch02-molding-conditions-pressure.md', 'ch02-molding-conditions-pressure', '第2章：成型条件与压力'],
  ['ch03-filling-pattern.md', 'ch03-filling-pattern', '第3章：充填模式'],
  ['ch04-design-principles.md', 'ch04-design-principles', '第4章：Moldflow 设计原则'],
  ['ch05-meshes-used-in-analyses.md', 'ch05-meshes-used-in-analyses', '第5章：Moldflow 分析中使用的网格'],
  ['ch06-product-design.md', 'ch06-product-design', '第6章：产品设计'],
  ['ch07-gate-design.md', 'ch07-gate-design', '第7章：浇口设计'],
  ['ch08-runner-system-design.md', 'ch08-runner-system-design', '第8章：流道系统设计'],
  ['ch09-cooling-system-design.md', 'ch09-cooling-system-design', '第9章：冷却系统设计'],
  ['ch10-shrinkage-warpage.md', 'ch10-shrinkage-warpage', '第10章：收缩与翘曲'],
  ['ch11-design-procedure.md', 'ch11-design-procedure', '第11章：设计程序'],
  ['ch12-part-defects.md', 'ch12-part-defects', '第12章：塑件缺陷'],
  ['appendix-a-injection-molding.md', 'appendix-a-injection-molding', '附录 A：注塑成型'],
  ['appendix-b-machine-systems-operations.md', 'appendix-b-machine-systems-operations', '附录 B：注塑机：系统与操作'],
  ['appendix-c-process-control.md', 'appendix-c-process-control', '附录 C：注塑成型过程控制'],
  ['appendix-d-plastic-materials.md', 'appendix-d-plastic-materials', '附录 D：塑料材料'],
];

function stripLeadingH1(content) {
  return content.trim().replace(/^# [^\r\n]*(?:\r?\n)?/, '').trim();
}

function page(title, content) {
  return `---
title: ${title}
description: 《Moldflow Design Guide》中文译文。
prev: false
next: false
head:
  - tag: script
    attrs:
      type: module
      src: /scripts/moldflow-reading-gate.js
---

<div data-moldflow-protected-content>

${stripLeadingH1(content)}

</div>
`;
}

await mkdir(outputDirectory, { recursive: true });
const canonicalFiles = new Set(chapters.map(([sourceName]) => sourceName));
for (const fileName of await readdir(outputDirectory)) {
  if (fileName.endsWith('.md') && !canonicalFiles.has(fileName)) {
    await rm(join(outputDirectory, fileName));
  }
}

for (const [sourceName, slug, title] of chapters) {
  const content = await readFile(join(resolve(sourceDirectory), sourceName), 'utf8');
  await writeFile(join(outputDirectory, `${slug}.md`), page(title, content), 'utf8');
}
