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
      components: {
        Header: './docs/components/Header.astro',
        Footer: './docs/components/Footer.astro',
        PageFrame: './docs/components/PageFrame.astro',
      },
      customCss: [
        './docs/styles/custom.css',
      ],
      sidebar: [
        { label: 'Home', translations: { 'zh-CN': '首页' }, link: '/' },
        { label: 'Articles', translations: { 'zh-CN': '杂文' }, link: '/list-articles/' },
        { label: 'Moldflow Simulation Reading', translations: { 'zh-CN': '注塑工艺简介' }, link: 'https://jackyansongli.github.io/zh/moldflow-reading/' },
        { label: 'Flow Analysis of Injection Molds (Chinese Translation)', translations: { 'zh-CN': '《注塑模具流动分析》中文译文' }, link: 'https://jackyansongli.github.io/zh/flow-analysis/' },
        { label: 'Moldflow Design Guide Study Notes', translations: { 'zh-CN': '《Moldflow Design Guide》中文学习笔记' }, link: 'https://jackyansongli.github.io/zh/moldflow-design-guide-notes/' },
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
