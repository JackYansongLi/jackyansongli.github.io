# 《Moldflow Design Guide》中文译文设计

## 目标

将 `/Users/jackyansongli/git/trans/Moldflow Design Guide A Resource for Plastics Engineers (Jay Shoemaker) (z-library.sk, 1lib.sk, z-lib.sk).pdf` 的正文翻译为中文，并发布到本 Astro/Starlight GitHub Pages 站点。页面采用现有《注塑模具流动分析》中文译文的访问门禁，密码为 `761893`。

## 范围

- 翻译第 1 至第 12 章及附录 A 至 D。
- 每个顶级章节或附录对应一个独立的 Markdown 页面，共 16 页。
- 保留正文中的标题层级、段落、公式和必要的列表。
- 不翻译或发布封面、版权页、致谢、目录、索引、图片、图注、图片中的文字，或纯导航内容。
- 不创建英文译文，也不修改既有《注塑模具流动分析》内容。

## 内容与生成流程

1. 从 PDF 的正文起始页提取可选择文本，按照顶级章节边界分割。
2. 人工校对章名、节名、段落边界与技术术语；删除图片及其图注、目录和索引内容。
3. 将译文保存为站点外的私有 Markdown 源文件。生成脚本读取该私有源文件，为 16 个页面写入统一的 Starlight frontmatter、访问门禁包装、相邻页面链接和目录元数据。
4. 每个生成页面加载现有 `public/scripts/moldflow-reading-gate.js`，用 `data-moldflow-protected-content` 包装译文正文；用户输入 `761893` 后才能在本次浏览器会话内显示正文。

## 站点结构

- 新建中文译文目录页，标题格式为 `《Moldflow Design Guide》中文译文`。
- 目录页列出 12 章和 4 个附录的受保护链接。
- 在 `astro.config.mjs` 的中文侧栏增加该目录页入口。
- 章节页沿用 `/zh/flow-analysis/` 的页脚导航交互：目录、上一章与下一章链接均在解锁后可见。
- 复用现有门禁脚本和视觉样式，不引入第二套密码逻辑。

## 安全边界

方案为与参考页面一致的客户端访问门禁：密码的 SHA-256 摘要在浏览器中比较，解锁状态记录在 `sessionStorage`。它避免了直接浏览页面时显示正文，但静态构建产物内仍包含 Markdown 内容；这不是对已发布文本的加密保护。

## 验证

- 为目录、全部 16 个生成页面及相邻导航编写或扩展 Playwright 测试。
- 验证错误密码不显示正文，密码 `761893` 会显示正文与受保护导航。
- 在目标仓库运行 `npm run build`，通过 Astro 构建和 Linkinator 递归链接检查。
- 对所有新增或修改的 TypeScript/Astro/Markdown 文件运行语言诊断。

## 部署

通过现有 `.github/workflows/deploy.yml` 部署：推送到 `main` 后，GitHub Actions 执行 `npm ci`、`npm run build`，并将 `dist` 发布到 GitHub Pages。不会创建提交或推送，除非用户随后明确要求。
