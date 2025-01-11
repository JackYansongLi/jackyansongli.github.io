# 三鲤AI理工套件与$\LaTeX$ 的比较

三鲤AI理工套件最显著的功能是其能够以所见即所得(WYSIWYG)的方式帮助用户快速进行类似$\TeX$的排版，速度显著快于$\LaTeX$。  

这种速度的提升不仅归功于所见即所得界面，还得益于直观的快捷键、魔法粘贴(Magic Paste)和公式转换等功能。本文通过具体示例介绍这些功能。

## 内置环境
在$\LaTeX$中，创建一个定理环境需要在导言区定义：

```LaTeX
\documentclass{article}
\newtheorem{theorem}{Theorem}
\begin{document}

    \begin{theorem}
    Theorem here!
    \end{theorem}

\end{document}
```

然而，在三鲤AI理工套件中，大部分$\LaTeX$环境都是内置的。用户可以直接通过我们提供的图形用户界面插入所需环境。

![内置环境](images/builtin_environments.png)

同时，对于一些在$\LaTeX$中难以进行编辑的环境，三鲤AI理工套件提供了极其友善的GUI。例如多行公式对齐。在$\LaTeX$中输入
```LaTeX
\begin{align}
  f (x) \leq & \| g (x) - h (x) \| \\
  \leq & \| g (x) - z (x) \| + \| z (x) - h (x) \| \\
\end{align}
```
对比在三鲤AI理工套件中进行输入
![align](images/align.png)

## 直观的快捷键和符号切换

编辑$\LaTeX$文档时，最费力的部分之一是记忆和输入数学符号。例如，在$\LaTeX$中输入$(\alpha \neq \gamma) \rightarrow (\beta \geqslant \theta)$的代码如下：

```LaTeX
$(\alpha \neq \gamma) \rightarrow (\beta \geqslant \theta)$
```

在三鲤AI理工套件中，上述公式可以通过直观的方式输入。例如，$\rightarrow$可以通过键入`-`然后接`>`实现，而$\geq$可以通过键入`>`然后接`=`实现。三鲤AI理工套件会自动将这些命令“粘合”成所需的符号，以下是更多示例：

+  $\implies$：键入`=`接`>`。
+  $\leqslant$：键入`<`接`=`。
+  $\Leftrightarrow$：键入`<`接`=`然后接`>`。
+  $\infty$：键入`@`接`@`。
+  $\mathbb{R}$：键入`R`接`R`。

三鲤AI理工套件还支持一种名为*符号切换*的功能。在三鲤AI理工套件的数学模式中，用户输入的每个符号不仅代表单个符号，还代表一组相关符号。用户可以通过按`Tab`键在这些符号之间切换。例如，$\alpha$可以通过键入`A`然后按`Tab`生成。以下是一些示例：

+ $\geq$：键入`>`接`=`然后按`Tab`。
+ $\leq$：键入`<`接`=`然后按`Tab`。
+ $\beta$：键入`B`然后按`Tab`。
+ $\theta$：键入`J`然后按`Tab`。
+ $\Theta$：键入大写`J`然后按`Tab`。
+ $\phi$：键入`F`然后按`Tab`。
+ $\Phi$：键入大写`F`然后按`Tab`。

如下面的图中所示，三鲤AI理工套件为大多数数学快捷键提供了提示，帮助用户记忆可能忘记的快捷键。

![快捷键提示](images/math_shortcut_hint.png)

## 魔法粘贴(Magic Paste)

三鲤AI理工套件包含一项名为*魔法粘贴*的功能。用户可以直接从大语言模型(LLMs)或$\LaTeX$源代码中粘贴内容到三鲤AI理工套件中。例如，三鲤AI理工套件支持从LLMs复制粘贴内容，并保持公式和表格的格式。以下示例展示了从GPT-4进行魔法粘贴的效果：

![从LLMs魔法粘贴](images/magic_paste_llm.png)

三鲤AI理工套件通过魔法粘贴功能大大简化了从外部资源复制内容到数学文档的流程，无需手动调整格式，提升了用户的工作效率。



## $\LaTeX$源码导出

如果用户仍然需要最终使用$\LaTeX$编辑，我们提供了$\LaTeX$源码导出的功能！

![LaTeX export](images/latex_export.png)