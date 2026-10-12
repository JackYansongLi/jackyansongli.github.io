import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import test from 'node:test';

const chapters = [
  ['ch09-motion-of-fluids.md', 9, 112],
  ['ch11-basic-thermodynamics.md', 11, 57],
  ['ch12-kinetic-theory-statistical-mechanics.md', 12, 92],
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

test('long numbered equation 11.20 keeps its tag beside a wrapped display', async () => {
  const source = await readFile(new URL('ch11-basic-thermodynamics.md', chapterDirectory), 'utf8');
  const taggedBlock = source
    .split('$$')
    .filter((_block, index) => index % 2 === 1)
    .find((block) => block.includes('\\tag{11.20}'));

  assert.ok(taggedBlock, 'equation 11.20 must remain a display block');
  assert.match(taggedBlock, /\\begin\{aligned\}/);
  assert.match(taggedBlock, /\\\\/);
  assert.match(taggedBlock, /\\end\{aligned\}\s*\\tag\{11\.20\}/);
});

test('Chapter 12 puts every audited complete relation in an unnumbered display block', async () => {
  const source = await readFile(new URL('ch12-kinetic-theory-statistical-mechanics.md', chapterDirectory), 'utf8');
  const auditedRelations = [
    '\\Delta p_x=2p_x=2mv_x',
    'v_x^2=\\frac13v^2',
    'k_B=1.38\\times10^{-23}\\ \\mathrm{J\\ K^{-1}}',
    'dA=(2\\pi r\\sin\\theta)\\times(rd\\theta)=2\\pi r^2\\sin\\theta\\,d\\theta',
    '\\int_0^\\infty f(v)dv=1',
    '\\Delta p_x=2mv\\cos\\theta',
    '\\frac32k_BT=\\frac12mv^2',
    'v^2=v_x^2+v_y^2+v_z^2',
    '\\int_{-\\infty}^{\\infty}\\int_{-\\infty}^{\\infty}\\int_{-\\infty}^{\\infty}\\phi(v)dv_xdv_ydv_z=1',
    'A=-\\alpha^{-2}',
    '\\int_{-\\infty}^{\\infty}e^{-x^2}dx=\\pi^{1/2}',
    '\\int_0^\\infty x^3e^{-x^2}dx=1/2',
    'v=4\\alpha^4/(\\alpha^3\\pi^{1/2}2)=2\\alpha/\\pi^{1/2}',
    'f(x)dx=\\sqrt{2/\\pi}\\,x^2e^{-x^2/2}dx',
    '\\frac12I\\omega^2=\\frac12mv^2',
    '\\lambda=(n\\sigma)^{-1}',
    '\\nu=\\eta/\\rho=\\frac13\\lambda v',
    'p_i=1',
    '\\boldsymbol p_1=(p_{1x},p_{1y})',
    '\\boldsymbol p_2=(p_{2x},p_{2y})',
    'p_2/p_1=2^{N_0}',
    '\\Delta S=R\\ln(V_2/V_1)=R\\ln2',
    'g(N,m)=N!/[(N-m)!m!]',
    'g(N,x)=N!/[((N/2)-x)!((N/2)+x)!]',
    'r=\\frac12-x/N_0',
    '1-r=\\frac12+x/N_0',
    'S=k_B\\ln g(N,x)',
    '\\ln(1+x)=x-\\frac12x^2',
    '(100\\times99)/2=4950',
    'Q=0,1,2,3,4,5,10,20',
    'W=1,100,5050,171700,4421275,92846775,4.5093338\\times10^{13},2.8073848\\times10^{22}',
    'g_A=g_A(E_A),g_B=g_B(E_B)',
    'd\\ln(g_Ag_B)=0',
    '-\\sum_i p_i\\ln p_i=0',
    'g=(Q+N-1)!/[Q!(N-1)!]=5',
    '\\ln g=\\ln5=1.609',
    'p=nmv_x^2',
    '\\Delta S=R\\ln2=k_BN_0\\ln2',
  ];
  const unnumberedDisplayBlocks = source
    .split('$$')
    .filter((_block, index) => index % 2 === 1)
    .filter((block) => !/\\tag\{[^}]+\}/.test(block));

  assert.equal(auditedRelations.length, 38, 'the Chapter 12 audit must enumerate all 38 relation groups');

  for (const relation of auditedRelations) {
    const matchingBlocks = unnumberedDisplayBlocks.filter((block) => block.includes(relation));
    assert.equal(
      matchingBlocks.length,
      1,
      `Chapter 12 relation ${relation} must occur in exactly one unnumbered display-math block`,
    );
  }
});
