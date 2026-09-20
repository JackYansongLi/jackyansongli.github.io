import { execFile } from 'node:child_process';
import { mkdtemp, readFile, rename, rm, writeFile } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { dirname, join, resolve } from 'node:path';
import { promisify } from 'node:util';

import { marked } from 'marked';

const execFileAsync = promisify(execFile);
const sourceDirectory = process.env.FLOW_ANALYSIS_SOURCE
  ? resolve(process.env.FLOW_ANALYSIS_SOURCE)
  : resolve('../Flow_analysis_of_injection_molds/translated-markdown');
const outputDirectory = resolve('public/zh/flow-analysis');

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

export function assertNoPlaintext(artifact, sentinels) {
  if (sentinels.some((sentinel) => artifact.includes(sentinel))) {
    throw new Error('Plaintext protected content found in encrypted artifact');
  }
}

export function encryptedOutputPath(outputPath, sourceFileName) {
  return join(dirname(outputPath), sourceFileName);
}

function documentHtml(title, markdown) {
  return `<!doctype html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>${title}</title>
    <style>
      :root { color-scheme: light; font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif; }
      body { margin: 0; background: #f8fafc; color: #172033; line-height: 1.8; }
      main { max-width: 880px; margin: 0 auto; padding: 2.5rem 1.25rem 4rem; }
      h1, h2, h3 { line-height: 1.3; margin-top: 2.2rem; }
      h1 { font-size: 2rem; } h2 { font-size: 1.5rem; }
      pre { overflow-x: auto; padding: 1rem; background: #e8edf4; border-radius: .5rem; }
      code { font-family: ui-monospace, SFMono-Regular, Menlo, monospace; }
      table { width: 100%; border-collapse: collapse; } th, td { border: 1px solid #cbd5e1; padding: .5rem; text-align: left; }
      a { color: #0f4c81; }
    </style>
  </head>
  <body><main>${marked.parse(markdown)}</main></body>
</html>`;
}

async function encryptFile(inputPath, outputPath, password) {
  await execFileAsync('npx', ['--no-install', 'staticrypt', inputPath, '-d', dirname(outputPath), '--short'], {
    env: { ...process.env, STATICRYPT_PASSWORD: password },
  });
}

async function build() {
  const password = process.env.FLOW_ANALYSIS_PASSWORD;
  if (!password) {
    throw new Error('Set FLOW_ANALYSIS_PASSWORD before generating encrypted reading files.');
  }

  const temporaryDirectory = await mkdtemp(join(tmpdir(), 'flow-analysis-'));
  await rm(outputDirectory, { recursive: true, force: true });

  try {
    for (const [sourceName, slug, title] of chapters) {
      const markdown = await readFile(join(sourceDirectory, sourceName), 'utf8');
      const temporaryPath = join(temporaryDirectory, `${slug}.html`);
      const outputPath = join(outputDirectory, slug, 'index.html');
      await writeFile(temporaryPath, documentHtml(title, markdown), 'utf8');
      await encryptFile(temporaryPath, outputPath, password);

      await rename(encryptedOutputPath(outputPath, `${slug}.html`), outputPath);

      const artifact = await readFile(outputPath, 'utf8');
      const sentinel = markdown.replace(/^#.*$/m, '').trim().slice(0, 80);
      assertNoPlaintext(artifact, sentinel ? [sentinel] : []);
    }
  } finally {
    await rm(temporaryDirectory, { recursive: true, force: true });
  }
}

if (import.meta.url === `file://${process.argv[1]}`) {
  build();
}
