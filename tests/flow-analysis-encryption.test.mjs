import assert from 'node:assert/strict';
import test from 'node:test';

import { assertNoPlaintext, encryptedOutputPath } from '../scripts/build-flow-analysis.mjs';

test('rejects a published artifact containing translated body text', () => {
  assert.throws(
    () => assertNoPlaintext('<article>注塑模具流动分析正文</article>', ['注塑模具流动分析正文']),
    /Plaintext protected content found/,
  );
});

test('accepts an encrypted artifact without translated body text', () => {
  assert.doesNotThrow(() => assertNoPlaintext('<html>Encrypted content</html>', ['注塑模具流动分析正文']));
});

test('locates Staticrypt output before it is renamed to index.html', () => {
  assert.equal(
    encryptedOutputPath('/site/public/zh/flow-analysis/ch01/index.html', 'ch01-current-status.html'),
    '/site/public/zh/flow-analysis/ch01/ch01-current-status.html',
  );
});
