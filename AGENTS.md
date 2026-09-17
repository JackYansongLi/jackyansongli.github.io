# Subagent 教程同步

- 中文页面 `docs/content/docs/zh/subagent-tutorial.md` 的正文来自 `/Users/jackyansongli/git/learn-harness/docs/tutorial.md`。
- 用户要求：以后每次修改该教程都同步课程仓库和中文官网，保留中文，不翻译或新建英文教程。
- 修改正文时先更新课程仓库的源文件，再在课程仓库运行 `uv run python scripts/sync_tutorial.py`，随后加 `--check` 确认一致。不要单独改生成的官网副本。
- 发布前在本仓库运行 `npm run build`，检查中文页面的引用、公式、两幅流程图和论文链接，然后同步提交、推送两个仓库。
- 中文文章索引是 `docs/content/docs/zh/list-articles.md`。该教程单独加载 `public/scripts/subagent-diagrams.js` 渲染 Mermaid，不修改英文页面。
- 课程仓库的 `solution/`、`.env` 和 `output/` 仅留本地，不同步到官网。
