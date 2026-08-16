import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import remarkMath from 'remark-math';
import rehypeMathjax from 'rehype-mathjax';
import remarkDirective from 'remark-directive';
import rehypeCitation from 'rehype-citation';
import tailwind from '@astrojs/tailwind';
import { visit } from 'unist-util-visit';

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
      title: "Jack Yansong Li 李岩松",
      defaultLocale: 'root',
      locales: {
        root: {
          label: 'English',
          lang: 'en',
        },
        zh: {
          label: '简体中文',
          lang: 'zh-CN',
        },
      },
      social: {
        github: 'https://github.com/jackyansongli',
      },
      customCss: [
        './docs/styles/custom.css',
      ],
      sidebar: [
        { label: 'Home', translations: { 'zh-CN': '首页' }, link: '/' },
        { label: 'Articles', translations: { 'zh-CN': '杂文' }, link: '/list-articles/' },
        {
          label: 'Vector Calculus & Tensors',
          translations: { 'zh-CN': '向量微积分与张量' },
          items: [
            { label: 'Coordinate Systems', translations: { 'zh-CN': '坐标系' }, link: '/coordinate-system/' },
          ],
        },
        { label: 'Photos', translations: { 'zh-CN': '相册' }, link: '/photos/' },
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
