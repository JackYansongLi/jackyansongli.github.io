import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import remarkMath from 'remark-math';
import rehypeMathjax from 'rehype-mathjax';
import remarkDirective from 'remark-directive';
import rehypeCitation from 'rehype-citation';
import tailwind from '@astrojs/tailwind';
import { visit } from 'unist-util-visit';

// Suppress punycode deprecation warning
const originalEmit = process.emit;
process.emit = function (name, data, ...args) {
  if (name === 'warning' && typeof data === 'object' && data.name === 'DeprecationWarning' && data.message.includes('punycode')) {
    return false;
  }
  return originalEmit.apply(process, [name, data, ...args]);
};

function starlightDirectivesPlugin() {
  return (tree) => {
    visit(tree, (node) => {
      if (
        node.type === 'containerDirective' ||
        node.type === 'leafDirective' ||
        node.type === 'textDirective'
      ) {
        const data = node.data || (node.data = {});
        const tagName = node.type === 'textDirective' ? 'span' : 'div';
        data.hName = tagName;
        data.hProperties = {
          className: [`directive-${node.name}`],
          ...(node.attributes || {}),
        };
      }
    });
  };
}

export default defineConfig({
  site: 'https://jackyansongli.github.io',
  srcDir: './docs',
  integrations: [
    starlight({
      title: "Jack Yansong Li's Website",
      social: {
        github: 'https://github.com/jackyansongli',
      },
      customCss: [
        './docs/styles/custom.css',
      ],
      sidebar: [
        { label: 'Home', link: '/' },
        { label: 'Articles', link: '/list-articles/' },
        { label: 'Photos', link: '/photos/' },
      ],
    }),
    tailwind(),
  ],
  markdown: {
    // Explicitly configure unified to support standard remark/rehype plugins in Astro 7.x
    processor: 'unified',
    remarkPlugins: [
      remarkDirective,
      starlightDirectivesPlugin,
      remarkMath,
    ],
    rehypePlugins: [
      [rehypeMathjax, {
        tex: {
          tags: 'ams', // Automatically number equations inside AMS environments
          useLabelIds: true,
        }
      }],
      [rehypeCitation, {
        bibliography: './docs/assets/references.bib',
        linkCitations: true,
      }],
    ],
  },
});
