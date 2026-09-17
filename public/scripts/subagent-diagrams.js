// Only the Chinese Subagent tutorial loads this module.
import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11.12.0/dist/mermaid.esm.min.mjs';

const blocks = [...document.querySelectorAll('pre[data-language="mermaid"], pre:has(code.language-mermaid)')];
mermaid.initialize({
  startOnLoad: false,
  securityLevel: 'strict',
  theme: document.documentElement.dataset.theme === 'dark' ? 'dark' : 'default',
});
await document.fonts.ready;
for (const [index, block] of blocks.entries()) {
  try {
    // Expressive Code stores each source line in its own div, without newline characters.
    const lines = [...block.querySelectorAll('.ec-line')];
    const source = lines.length ? lines.map(line => line.textContent).join('\n') : block.textContent;
    const { svg } = await mermaid.render(`subagent-diagram-${index}`, source);
    const figure = document.createElement('figure');
    figure.className = 'subagent-diagram';
    figure.style.cssText = 'overflow-x:auto;margin:1.5rem 0;padding:1rem;background:var(--sl-color-bg);';
    figure.setAttribute('aria-label', index === 0 ? 'Main Agent 调用 Subagent 的流程图' : '三个 Subagent 的协作时序图');
    figure.innerHTML = svg;
    const diagram = figure.querySelector('svg');
    diagram.style.minWidth = index === 0 ? '420px' : '640px';
    (block.closest('.expressive-code') ?? block).replaceWith(figure);
  } catch (error) {
    // Keep the readable source if a diagram cannot be rendered.
    console.error('Subagent diagram could not be rendered:', error);
  }
}
