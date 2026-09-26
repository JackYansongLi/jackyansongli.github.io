# 《人有人的用处》中文译文设计

## 目标

将 `/Users/jackyansongli/git/injec-translation/book.pdf`（Norbert Wiener 的 *The Human Use of Human Beings*）译为中文，并以 12 个独立章节页面发布到本站中文文档区。每页复用现有阅读区的客户端访问门：输入密码 `761893` 后，本浏览器会话可访问目录、正文与章节导航。

## 内容范围

- 收录 PDF 第 I 至 XII 章（印刷页 1–229；PDF 页 3–231），每章一篇 Markdown 页面。
- 第一章的附录保留在第一章页面内，以 `## 第一章附录` 标题分隔。
- 不发布扫描件封面与目录；PDF 未提供目录实际内容所指向的索引，因此不创建索引页。
- 逐段翻译正文、脚注、章节小标题与可辨识的数学符号；保留公式的符号、单位和数值。
- 不凭空补写、概述或改写作者观点；无法可靠辨识的扫描文本以原文摘录并在译文中明确标注。

## 图片保留

PDF 是整页扫描，文字与图形无法作为独立原始资源分离。为避免将英文正文整页当作“图片”重复发布，只导出并发布三张图示所在的页面图像，同时在 Markdown 中放入中文图题：

1. 第一章，印刷页 13 / PDF 页 15：`A Typical Taping System`。
2. 第十一章，印刷页 193 / PDF 页 195：`The Moth or Bedbug`。
3. 第十一章，印刷页 202 / PDF 页 204：`Hearing Aid for the Totally Deaf`。

这些资产存放在 `public/images/human-use-of-human-beings/`，页面使用绝对路径 `/images/human-use-of-human-beings/<filename>.png` 引用。保留原始图示内的英文文字，不重绘或伪造翻译标注；中文图题与正文会解释图示在原书中的作用。

## 站点结构

- 建立 `/zh/human-use-of-human-beings/` 目录页，列出 12 个受保护章节。
- 在 `docs/content/docs/zh/human-use-of-human-beings/` 下建立 12 篇页面，文件名以章节编号和稳定英文 slug 命名。
- 所有目录与章节页面通过 frontmatter 引入 `/scripts/moldflow-reading-gate.js`，并使用 `data-moldflow-protected-content` 包装书籍专属内容。
- 在 `docs/components/Footer.astro` 的受保护集合注册表中加入目录路径和 12 个章节 slug；因此“上一章”“返回目录”“下一章”沿用现有行为并在解锁后显示。
- 在 `astro.config.mjs` 的中文侧栏增加目录页入口，并在 `docs/content/docs/zh/list-articles.md` 中增加发现链接。

## 访问控制边界

沿用现有浏览器端 SHA-256 密码比较和 `sessionStorage` 解锁状态；不增加第二套密码、哈希值或存储键。它仅防止正常浏览时直接显示内容，不构成服务端鉴权、加密或防止静态文件被直接获取。

## 验证与部署

- 使用 Playwright 覆盖错误密码、正确密码解锁、目录链接、三张图的渲染路径，以及第一章/中间章/末章的页脚导航。
- 运行 `npm run build`（Astro 构建和 Linkinator）及完整 Playwright 测试。
- 推送到 `main` 后，由既有 GitHub Pages workflow 部署；线上复验目录、密码门和图片资源。
