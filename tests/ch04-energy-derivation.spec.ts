import { expect, test } from '@playwright/test';
import { readFile } from 'node:fs/promises';
import { resolve } from 'node:path';

const chapterPath = resolve('docs/content/docs/zh/flow-analysis/ch04-governing-equations.md');

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
