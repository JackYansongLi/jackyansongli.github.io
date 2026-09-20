---
title: 第 5 章：Moldflow 网格
description: 原创学习笔记：网格质量与结果可信度。
prev: false
next: false
head:
  - tag: script
    attrs: { type: module, src: /scripts/moldflow-reading-gate.js }
---

<div data-moldflow-protected-content>

## 学习要点

网格是几何与物理模型之间的接口。薄壁、浇口、圆角和厚度突变处的表达不足，会使结果看似稳定却失去工程意义。

## 工程检查

- 修复自由边、重叠面、孔洞和不合理纵横比后再求解。
- 在浇口、流道连接和局部薄厚变化处细化网格。
- 通过网格加密前后的关键输出差异检查收敛性。

</div>
