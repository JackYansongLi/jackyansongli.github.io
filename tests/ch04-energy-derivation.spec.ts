import { expect, test } from '@playwright/test';
import { readFile } from 'node:fs/promises';
import { resolve } from 'node:path';

const chapterPath = resolve('docs/content/docs/zh/flow-analysis/ch04-governing-equations.md');

test('dyadic-product hint keeps its display math inside one blockquote', async () => {
  const chapter = await readFile(chapterPath, 'utf8');
  const hint = chapter.split('提示（编辑补充）：区分并矢积与点积。')[1]?.split('然而，体积')[0];
  expect(hint).toBeDefined();
  const matrix = hint?.match(/^>\s*\$\$\s*\n([\s\S]*?)\n>\s*\$\$/m);
  expect(matrix, 'matrix delimiters must belong to the same blockquote').not.toBeNull();
  for (const line of (matrix?.[1] ?? '').split('\n')) {
    expect(line, 'every display-math line must retain the quote marker').toMatch(/^>/);
  }
  expect(matrix?.[1]).toContain('\\begin{pmatrix}');
  expect(hint).toContain('$v_i v_j$ with two free indices');
});

test('Reynolds transport theorem proof remains a complete blockquote before section 4.2.4', async () => {
  const chapter = await readFile(chapterPath, 'utf8');
  const proof = chapter
    .split('**Proof of the Reynolds transport theorem (supplementary note)**')[1]
    ?.split('### 4.2.4')[0];

  expect(proof).toBeDefined();
  for (const line of (proof ?? '').split('\n').filter((line) => line !== '')) {
    expect(line, 'every proof line, including blank and display-math lines, must retain the quote marker').toMatch(/^>/);
  }

  expect(proof).toContain('F(t)=\\int_{V(t)} f(x,t)\\,\\mathrm{d}V');
  expect(proof).toContain('\\mathrm{d}^3x=\\mathrm{d}x^1\\mathrm{d}x^2\\mathrm{d}x^3');
  expect(proof).toContain('\\frac{\\mathrm{d}F}{\\mathrm{d}t}');
  expect(proof).toContain('\\frac{\\mathrm{D}f}{\\mathrm{D}t}');
  expect(proof).toContain('v^i(\\chi(X,t),t)=\\left.\\frac{\\partial\\chi^i}{\\partial t}\\right|_X');
  expect(proof).toContain('(\\Lambda^{-1})^A{}_i=\\frac{\\partial(\\chi^{-1})^A}{\\partial x^i}');
  expect(proof).toContain('J(X,t)=\\sqrt{g(\\chi(X,t))}\\,j(X,t)');
  expect(proof).toContain('\\begin{aligned}');
  expect(proof).toContain('&=j\\,(\\Lambda^{-1})^A{}_i(\\partial_kv^i)\\Lambda^k{}_A');
  expect(proof).toContain('&=j\\,(\\partial_kv^i)\\delta^k{}_i');
  expect(proof).toContain('\\frac{\\dot J}{J}=\\partial_i v^i+v^i\\partial_i\\log\\sqrt{g}');
  expect(proof).toContain('=\\int_{V(t)}\\left(\\partial_t f+\\nabla_i(fv^i)\\right)\\mathrm{d}V');
  expect(proof).toContain('C.P. (Covariant Physics)');
  expect(proof).toContain('handwritten attribution');
  expect(proof).not.toContain('not a miscopied inverse derivative');

});

test('energy-equation meanings retain numbered markers and indentation', async ({ page }) => {
  await page.addInitScript(() => {
    sessionStorage.setItem('moldflow-reading-access', 'granted');
  });
  await page.goto('/zh/flow-analysis/ch04-governing-equations/');

  const energyMeanings = page
    .getByText('考察式 (4.32) 的物理意义是有益的。各项已编号，含义如下：')
    .locator('xpath=following-sibling::ol[1]');
  const items = energyMeanings.locator(':scope > li');

  await expect(energyMeanings).toHaveCount(1);
  await expect(items).toHaveCount(5);
  await expect(items).toHaveText([
    '物质体积动能的变化率',
    '物质体积内能的变化率',
    '表面牵引力（应力）对物质体积内流体做功的速率',
    '重力对物质体积内流体做功的速率',
    /由于穿过.*的传导，物质体积内流体的热损失/,
  ]);

  const styles = await energyMeanings.evaluate((list) => {
    const listStyle = getComputedStyle(list);
    const itemStyle = getComputedStyle(list.querySelector('li')!);
    return {
      listStyleType: listStyle.listStyleType,
      paddingInlineStart: Number.parseFloat(listStyle.paddingInlineStart),
      itemDisplay: itemStyle.display,
    };
  });

  expect(styles.listStyleType).toBe('decimal');
  expect(styles.itemDisplay).toBe('list-item');
  expect(styles.paddingInlineStart).toBeGreaterThanOrEqual(24);
});

test('Reynolds transport theorem proof renders equations without MathJax errors', async ({ page }) => {
  await page.addInitScript(() => {
    sessionStorage.setItem('moldflow-reading-access', 'granted');
  });
  await page.goto('/zh/flow-analysis/ch04-governing-equations/');

  const proof = page.locator('blockquote').filter({
    hasText: 'Proof of the Reynolds transport theorem (supplementary note)',
  });

  await expect(proof).toContainText('The second expression differentiates the inverse map.');
  await expect(proof.locator('mjx-container svg').first()).toBeVisible();
  await expect(proof.locator('[data-mjx-error], g[data-mml-node="merror"]')).toHaveCount(0);
});

function equationBlock(chapter: string, equation: number): string {
  const tag = `\\tag{4.${equation}}`;
  const tagOccurrences = chapter.match(new RegExp(tag.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'), 'g')) ?? [];
  expect(tagOccurrences, `${tag} must occur exactly once`).toHaveLength(1);

  const taggedBlocks = chapter
    .split('$$')
    .filter((_block, index) => index % 2 === 1)
    .filter((block) => block.includes(tag));
  expect(taggedBlocks, `${tag} must occur in exactly one display-math block`).toHaveLength(1);

  const block = taggedBlocks[0];
  if (block === undefined) {
    throw new Error(`Missing display-math block for ${tag}`);
  }
  return block;
}

test('chapter 4 corrects the variable-density kinetic-energy derivation', async () => {
  const time = 0.25;
  const density = 1 + 2 * time;
  const densityRate = 2;
  const velocity = 3 - time;
  const velocityRate = -1;
  const momentumRateDotVelocity = (densityRate * velocity + density * velocityRate) * velocity;
  const oldRightHandSide = 0.5 * (densityRate * velocity ** 2 + 2 * density * velocity * velocityRate);
  const correctedRightHandSide = oldRightHandSide + 0.5 * velocity ** 2 * densityRate;

  expect(momentumRateDotVelocity).toBeCloseTo(correctedRightHandSide);
  expect(momentumRateDotVelocity).not.toBeCloseTo(oldRightHandSide);

  const position = 0.5;
  const spatialDensity = 2 + position;
  const spatialVelocity = 1 + position;
  const convectiveTerm = spatialVelocity * (spatialVelocity ** 2 + 2 * spatialDensity * spatialVelocity);
  const kineticFluxDivergence = 0.5 * spatialVelocity ** 3 + 1.5 * spatialDensity * spatialVelocity ** 2;
  const continuityTerm = 0.5 * spatialVelocity ** 2 * (spatialVelocity + spatialDensity);

  expect(convectiveTerm).toBeCloseTo(kineticFluxDivergence + continuityTerm);

  const cancellationTime = 0.75;
  const cancellationPosition = 1.25;
  const densityField = (t: number, x: number) => 1 + t * x;
  const continuityVelocityField = (t: number, x: number) => -(x ** 2) / (2 * densityField(t, x));
  const densityTimeDerivative = cancellationPosition;
  const massFluxDivergence = -cancellationPosition;

  expect(densityField(cancellationTime, cancellationPosition)).not.toBe(densityField(0, cancellationPosition));
  expect(densityField(cancellationTime, cancellationPosition) * continuityVelocityField(cancellationTime, cancellationPosition))
    .toBeCloseTo(-(cancellationPosition ** 2) / 2);
  expect(densityTimeDerivative + massFluxDivergence).toBeCloseTo(0);

  const chapter = await readFile(chapterPath, 'utf8');
  expect(chapter).toContain('**编辑勘误注（式 4.34–4.39）**');
  expect(chapter).toContain('原书 PDF 的印刷页 41–42');
  expect(chapter).toContain('单位质量的内能（比内能）');
  expect(chapter).toContain('上式给出单位体积材料的动能平衡方程');
  expect(chapter).toContain('向外净热流的负值');

  for (let equation = 34; equation <= 67; equation += 1) {
    equationBlock(chapter, equation);
  }

  const block434 = equationBlock(chapter, 34);
  expect(block434).toContain('\\frac{\\partial}{\\partial t}(\\rho\\mathbf{v} \\cdot \\mathbf{v})');
  expect(block434).toContain('\\rho\\mathbf{v} \\cdot \\frac{\\partial \\mathbf{v}}{\\partial t}');
  expect(block434).toContain('- v^2\\frac{\\partial \\rho}{\\partial t}');
  expect(block434).not.toContain('\\mathbf{v} \\cdot \\frac{\\partial}{\\partial t}(\\rho\\mathbf{v})');

  const block435 = equationBlock(chapter, 35);
  const equalities435 = block435.split('\\\\').filter((line) => line.includes('&='));
  expect(equalities435).toHaveLength(2);
  for (const equality of equalities435) {
    expect(equality).toContain('+ \\frac{1}{2}v^2\\frac{\\partial \\rho}{\\partial t}');
  }

  const kineticFlux = '\\nabla \\cdot \\left(\\frac{1}{2}\\rho v^2\\mathbf{v}\\right)';
  const block437 = equationBlock(chapter, 37);
  expect(block437).toContain('\\underbrace{\\left[\\frac{\\partial \\rho}{\\partial t} + \\nabla \\cdot (\\rho\\mathbf{v})\\right]}_{=0\\ \\text{（由式 (4.13)）}}');
  expect(block437).toContain(`- ${kineticFlux}`);
  expect(block437).toContain('- \\frac{1}{2}v^2\\nabla \\cdot (\\rho\\mathbf{v})');

  const block438 = equationBlock(chapter, 38);
  expect(block438).toContain(`- \\int_{V(t)} ${kineticFlux}\\, dV`);

  const block439 = equationBlock(chapter, 39);
  expect(block439).toContain('\\frac{d}{dt}\\int_{V(t)} \\frac{1}{2}\\rho v^2\\, dV');
  expect(block439).toContain('\\frac{\\partial}{\\partial t}\\left(\\frac{1}{2}\\rho v^2\\right)');
  expect(block439).toContain(`+ \\int_{V(t)} ${kineticFlux}\\, dV`);
  expect(block439).not.toContain('\\nabla \\cdot \\rho\\mathbf{v}\\mathbf{v} \\cdot \\mathbf{v}');
});
