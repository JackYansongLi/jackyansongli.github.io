---
title: 第 4 章：控制方程
description: 《注塑模具流动分析》中文译文。
prev: false
next: false
head:
  - tag: script
    attrs:
      type: module
      src: /scripts/moldflow-reading-gate.js
---

<div data-moldflow-protected-content>

# 第4章 控制方程

## 4.1 引言

本章推导可压缩黏性流体流动的控制方程。这些方程适用于聚合物熔体的流动，由质量、动量和能量守恒原理获得。

在推导流体控制方程时，我们假定流体是连续介质。也就是说，我们忽略材料的分子结构，并假定可以在流体中一点处定义速度和密度等物理量。更重要的是，我们假定这些量在空间和时间上平滑变化，因而可以进行微分运算。这一假定大大简化了建模，使我们能够使用标准的数学方法。

话虽如此，值得指出的是，还存在可用于仿真的统计方法。事实上，有大量关于带统计倾向的聚合物简单模型的文献 [36]。从某些方面看，这些方法更直接地适用于聚合物，因为聚合物是统计性材料，即商用聚合物由一定分布的分子长度构成。有兴趣的读者可在 Öttinger [280] 中找到这些技术的入门介绍。随着计算机技术在速度方面的进步，以及注塑成型仿真对更高性能的追求，这些技术很可能会变得更加普遍。然而在本书写作之时，所有商业软件都基于连续介质方法。

## 4.2 数学预备知识

本节介绍后续章节将用到的一些数学概念，即随体导数、高斯散度定理和雷诺输运定理。这里的讨论是简要的，更多细节可参见 Aris [10] 和 Morrison [260] 等专著。

### 4.2.1 随体导数

某些流体性质是位置和时间的函数。分析流体运动时，需要对时间求这些性质的导数。例如，流体的密度 $\rho$ 可能同时取决于位置和时间。采用笛卡尔坐标，可以写成

$$
\rho = \rho(x_1, x_2, x_3, t),
$$

其中 $x_1$、$x_2$、$x_3$ 是空间坐标，$t$ 是时间。

利用链式法则，密度对时间的导数为

$$
\begin{aligned}
\frac{d\rho}{dt} &= \frac{\partial \rho}{\partial x_1}\frac{\partial x_1}{\partial t} + \frac{\partial \rho}{\partial x_2}\frac{\partial x_2}{\partial t} + \frac{\partial \rho}{\partial x_3}\frac{\partial x_3}{\partial t} + \frac{\partial \rho}{\partial t} \\
&= \frac{\partial \rho}{\partial x_1}\dot{x}_1 + \frac{\partial \rho}{\partial x_2}\dot{x}_2 + \frac{\partial \rho}{\partial x_3}\dot{x}_3 + \frac{\partial \rho}{\partial t} \\
&= \mathbf{v} \cdot \nabla \rho + \frac{\partial \rho}{\partial t},
\end{aligned}
$$

其中 $\mathbf{v} = (\dot{x}_1, \dot{x}_2, \dot{x}_3)$ 是流体中一点的速度。

更一般地，对任意位置和时间的标量函数 $f = f(x_1, x_2, x_3, t)$，有

$$
\frac{df}{dt} = \mathbf{v} \cdot \nabla f + \frac{\partial f}{\partial t},
$$

并将这种微分记为

$$
\frac{Df}{Dt} = \mathbf{v} \cdot \nabla f + \frac{\partial f}{\partial t}. \tag{4.1}
$$

我们称 $Df/Dt$ 为 $f$ 的随体导数（material derivative）。有些教材使用"实质导数"或"随流导数"等名称代替随体导数。在物理上，随体导数同时考虑了流体的运动以及流体微团的值随时间的变化。

虽然上面考虑的是标量函数，但随体导数可对任何随位置和时间变化的标量、向量或张量量求取。例如，向量 $\mathbf{c}$ 的随体导数为

$$
\frac{D\mathbf{c}}{Dt} = \mathbf{v} \cdot \nabla \mathbf{c} + \frac{\partial \mathbf{c}}{\partial t}, \tag{4.2}
$$

而对张量 $\mathbf{A}$，有

$$
\frac{D\mathbf{A}}{Dt} = \mathbf{v} \cdot \nabla \mathbf{A} + \frac{\partial \mathbf{A}}{\partial t}. \tag{4.3}
$$

### 4.2.2 高斯散度定理

这一重要结果称为高斯散度定理，也称高斯-奥斯特罗格拉茨基散度定理，它联系了体积分与面积分。更具体地说，它将向量函数 $\mathbf{f}$ 在体积内的散度与 $\mathbf{f}$ 通过包围该体积的曲面的通量联系起来。可表示为

$$
\int_V \nabla \cdot \mathbf{f}\, dV = \int_S \mathbf{f} \cdot \mathbf{n}\, dS, \tag{4.4}
$$

其中 $V$ 是空间中的一个区域，$S$ 是其封闭边界，$\mathbf{n}$ 是 $S$ 的单位外法向量。在物理上，该定理表明，某量在体积 $V$ 内的累积等于通过其边界表面流入或流出该区域的净流量。

类似的结果在低维情形也成立。设 $S$ 为平面上具有封闭边界 $\Gamma$ 的区域，则

$$
\int_S \nabla \cdot \mathbf{f}\, ds = \int_\Gamma \mathbf{f} \cdot \mathbf{n}\, d\Gamma. \tag{4.5}
$$

读者应注意，对区域 $V$ 和 $S$ 有一些技术上的要求，但我们不在此深究。细节可见 Marsden 和 Tromba [239]。

### 4.2.3 雷诺输运定理

为推导流体运动的控制方程，我们需要考虑位置与时间的任意函数 $f(\mathbf{x}, t)$ 在某流体体积上的积分。该体积随流体运动，但始终由相同的流体质点组成。这样的体积称为物质体积，记为 $V(t)$。表达式

$$
F(t) = \int_{V(t)} f(\mathbf{x}, t)\, dV \tag{4.6}
$$

定义了一个 $t$ 的函数。雷诺输运定理 [10] 告诉我们如何计算 $F(t)$ 对时间的导数。注意，由于 $V(t)$ 随时间变化并随流体运动，不能简单地将微分算子移入积分号内；必须使用 $F(t)$ 的随体导数。该结果也称为莱布尼茨公式 [260]，可写为

$$
\frac{d}{dt}\int_{V(t)} f(\mathbf{x}, t)\, dV = \int_{V(t)} \left(\frac{\partial f}{\partial t} + \nabla \cdot f\mathbf{v}\right) dV, \tag{4.7}
$$

其中 $\mathbf{v}$ 是流体质点的速度。

对式 (4.7) 右端应用散度定理，得到输运定理的如下等价形式：

$$
\frac{d}{dt}\int_{V(t)} f(\mathbf{x}, t)\, dV = \int_{V(t)} \frac{\partial f}{\partial t}\, dV + \int_{S(t)} f\,\mathbf{v} \cdot \mathbf{n}\, dS, \tag{4.8}
$$

其中 $S(t)$ 是 $V(t)$ 的表面，$\mathbf{n}$ 是 $S(t)$ 上指向外部的单位法向量。

在物理上，式 (4.8) 表明，$f(\mathbf{x}, t)$ 积分的变化率等于 $f(\mathbf{x}, t)$ 的变化率在固定区域 $V(t)$ 上的积分，加上 $f(\mathbf{x}, t)$ 穿过表面 $S(t)$ 的净流量。该结果可应用于任意标量、向量或张量函数 $f(\mathbf{x}, t)$。

### 4.2.4 分部积分

许多微积分教材都介绍分部积分。公式形式为：

$$
\int_{x_1}^{x_2} M N'\, dx = MN\Big|_{x=x_1}^{x=x_2} - \int_{x_1}^{x_2} M' N\, dx, \tag{4.9}
$$

其中 $M$ 和 $N$ 连续可微，$'$ 表示求导。在简化注塑成型控制方程时我们会用到它。其基本思想是选择 $M$ 和 $N$，使得 $N$ 的积分与 $M$ 的导数导致 $M'N$ 的积分比原积分更简单。

## 4.3 质量守恒

如果 $V(t)$ 是流体的物质体积，质量守恒原理表明，$V(t)$ 内所含流体的质量不变。设 $\rho(\mathbf{x}, t)$ 表示 $t$ 时刻 $\mathbf{x}$ 处流体的密度，$V(t)$ 内的质量 $m$ 为

$$
m = \int_{V(t)} \rho(\mathbf{x}, t)\, dv. \tag{4.10}
$$

考虑 $m$ 对时间的导数：

$$
\begin{aligned}
\frac{dm}{dt} &= \frac{d}{dt}\int_{V(t)} \rho(\mathbf{x}, t)\, dv \\
&= \int_{V(t)} \left(\frac{\partial \rho}{\partial t} + \nabla \cdot \rho\mathbf{v}\right) dV, \tag{4.11}
\end{aligned}
$$

其中使用了雷诺输运定理，即式 (4.7)。根据质量守恒原理，$m$ 对时间的变化率为零，即

$$
0 = \int_{V(t)} \left(\frac{\partial \rho}{\partial t} + \nabla \cdot \rho\mathbf{v}\right) dV. \tag{4.12}
$$

但区域 $V(t)$ 是任意的，因此被积函数必须恒等于零，于是

$$
\frac{\partial \rho}{\partial t} + \nabla \cdot \rho\mathbf{v} = 0. \tag{4.13}
$$

式 (4.13) 称为连续性方程。

有时将连续性方程用随体导数表示很有用。展开式 (4.13) 得

$$
\frac{\partial \rho}{\partial t} + \rho\nabla \cdot \mathbf{v} + \mathbf{v} \cdot \nabla \rho = 0. \tag{4.14}
$$

利用随体导数的定义，可以写成

$$
\frac{D\rho}{Dt} = -\rho\nabla \cdot \mathbf{v}. \tag{4.15}
$$

## 4.4 动量守恒

动量守恒要求物质体积 $V(t)$ 内流体质点动量的时间变化率等于作用于 $V(t)$ 的外力之和，即

$$
\frac{d}{dt}\int_{V(t)} \rho\mathbf{v}\, dV = \sum \mathbf{F}_{\mathrm{ext}}. \tag{4.16}
$$

作用于 $V(t)$ 的外力包括重力引起的体力和表面牵引力。总体力 $\mathbf{F}_b$ 为

$$
\mathbf{F}_b = \int_{V(t)} \rho\mathbf{g}\, dV, \tag{4.17}
$$

其中 $\mathbf{g}$ 是单位质量的总体力。通常 $\mathbf{g}$ 由重力效应引起。在注塑成型中，这些力仅在非常厚的制件中才有关系，这类制件通常与工艺的变体相关，如 14.3.2 节讨论的气体辅助注射成型。

作用于 $V(t)$ 边界表面微元 $dS$ 上的牵引力为 $\mathbf{t}\,dS$，其中 $\mathbf{t}$ 是 2.1 节定义的应力向量。总牵引力 $\mathbf{F}_t$ 为

$$
\begin{aligned}
\mathbf{F}_t &= \int_{S(t)} \mathbf{t}\, dS \\
&= \int_{S(t)} \boldsymbol{\sigma} \cdot \mathbf{n}\, dS, \tag{4.18}
\end{aligned}
$$

其中 $S(t)$ 是 $V(t)$ 的边界表面，$\boldsymbol{\sigma}$ 是应力张量（见 2.2 节），$\mathbf{n}$ 是 $S(t)$ 的单位外法向量。应用散度定理（式 4.4），得到

$$
\mathbf{F}_t = \int_{V(t)} \nabla \cdot \boldsymbol{\sigma}\, dV. \tag{4.19}
$$

总外力由体力与牵引力之和给出。利用式 (4.17) 和式 (4.19)，有

$$
\begin{aligned}
\sum \mathbf{F}_{\mathrm{ext}} &= \mathbf{F}_b + \mathbf{F}_t \\
&= \int_{V(t)} \rho\mathbf{g}\, dV + \int_{V(t)} \nabla \cdot \boldsymbol{\sigma}\, dV \\
&= \int_{V(t)} (\rho\mathbf{g} + \nabla \cdot \boldsymbol{\sigma})\, dV. \tag{4.20}
\end{aligned}
$$

将此结果代入式 (4.16)，得

$$
\frac{d}{dt}\int_{V(t)} \rho\mathbf{v}\, dV = \int_{V(t)} (\rho\mathbf{g} + \nabla \cdot \boldsymbol{\sigma})\, dV. \tag{4.21}
$$

对上式左端应用输运定理（式 4.7），有

$$
\int_{V(t)} \left(\frac{\partial}{\partial t}(\rho\mathbf{v}) + \nabla \cdot (\rho\mathbf{v}\mathbf{v})\right) dV = \int_{V(t)} (\rho\mathbf{g} + \nabla \cdot \boldsymbol{\sigma})\, dV. \tag{4.22}
$$

然而，体积 $V(t)$ 是任意的，因此经整理后有

$$
\frac{\partial}{\partial t}(\rho\mathbf{v}) = \rho\mathbf{g} + \nabla \cdot \boldsymbol{\sigma} - \nabla \cdot (\rho\mathbf{v}\mathbf{v}). \tag{4.23}
$$

该方程称为动量方程。动量方程可利用连续性方程 (4.14) 进行简化 [260]。为此，考虑式 (4.23) 的最后一项。利用微分的乘积法则：

$$
\begin{aligned}
\nabla \cdot (\rho\mathbf{v}\mathbf{v}) &= \rho\nabla \cdot \mathbf{v}\mathbf{v} + \nabla\rho \cdot \mathbf{v}\mathbf{v} \\
&= \rho\left[\mathbf{v} \cdot \nabla\mathbf{v} + (\nabla \cdot \mathbf{v})\mathbf{v}\right] + \nabla\rho \cdot \mathbf{v}\mathbf{v}, \tag{4.24}
\end{aligned}
$$

其中使用了式 (B.52)。再考虑式 (4.23) 的左端，同样利用微分的乘积法则：

$$
\frac{\partial}{\partial t}(\rho\mathbf{v}) = \rho\frac{\partial \mathbf{v}}{\partial t} + \frac{\partial \rho}{\partial t}\mathbf{v}. \tag{4.25}
$$

将式 (4.24) 和式 (4.25) 代入式 (4.23)，得

$$
\rho\frac{\partial \mathbf{v}}{\partial t} + \frac{\partial \rho}{\partial t}\mathbf{v} = -\rho\left[\mathbf{v} \cdot \nabla\mathbf{v} + (\nabla \cdot \mathbf{v})\mathbf{v}\right] - \nabla\rho \cdot \mathbf{v}\mathbf{v} + \rho\mathbf{g} + \nabla \cdot \boldsymbol{\sigma},
$$

可整理为

$$
\begin{aligned}
\rho\left[\mathbf{v} \cdot \nabla\mathbf{v} + \frac{\partial \mathbf{v}}{\partial t}\right] &= -\left[\frac{\partial \rho}{\partial t} + \rho(\nabla \cdot \mathbf{v}) + \nabla\rho \cdot \mathbf{v}\right]\mathbf{v} + \rho\mathbf{g} + \nabla \cdot \boldsymbol{\sigma} \\
&= -\left[\frac{\partial \rho}{\partial t} + \nabla \cdot \rho\mathbf{v}\right]\mathbf{v} + \rho\mathbf{g} + \nabla \cdot \boldsymbol{\sigma}. \tag{4.26}
\end{aligned}
$$

最后，我们注意到左端方括号中的项正是 4.2.1 节定义的 $\mathbf{v}$ 的随体导数；而右端方括号中的项由于连续性方程 (4.14) 恒等于零。因此，动量方程可写为

$$
\rho\frac{D\mathbf{v}}{Dt} = \rho\mathbf{g} + \nabla \cdot \boldsymbol{\sigma}. \tag{4.27}
$$

## 4.5 能量守恒

物质体积 $V(t)$ 内流体的总能量由其动能与内能之和给出。设 $\hat{U}$ 为单位体积的内能，物质体积内的总能量为

$$
\int_{V(t)} \rho\left(\frac{1}{2}v^2 + \hat{U}\right) dV = \int_{V(t)} \frac{1}{2}\rho v^2\, dV + \int_{V(t)} \rho\hat{U}\, dV, \tag{4.28}
$$

其中 $v^2 = \mathbf{v} \cdot \mathbf{v}$。

边界为 $S(t)$ 的物质体积 $V(t)$ 总能量的增量等于对该体积所做的功减去通过 $S(t)$ 散失的热量。对物质体积所做的功来自牵引力和体力两部分。牵引力做功的速率为

$$
\begin{aligned}
\int_{S(t)} \mathbf{t} \cdot \mathbf{v}\, dS &= \int_{S(t)} (\boldsymbol{\sigma} \cdot \mathbf{n}) \cdot \mathbf{v}\, dS \\
&= \int_{S(t)} (\boldsymbol{\sigma} \cdot \mathbf{v}) \cdot \mathbf{n}\, dS \\
&= \int_{V(t)} \nabla \cdot (\boldsymbol{\sigma} \cdot \mathbf{v})\, dV, \tag{4.29}
\end{aligned}
$$

其中右端使用了应力向量 $\mathbf{t}$ 的定义（式 2.1 和式 2.3）以及散度定理（4.2.2 节）。

我们只考虑重力引起的体力。除上一节和 14.3.2 节提及的气体辅助注射成型外，这些力对注塑成型的影响可以忽略。用 $\mathbf{g}$ 表示重力加速度，重力对物质体积做功的速率为

$$
\int_{V(t)} \rho(\mathbf{g} \cdot \mathbf{v})\, dV. \tag{4.30}
$$

现在考虑穿过表面 $S(t)$ 的热通量速率。设 $\mathbf{q}$ 为 $S(t)$ 上一点处的热通量向量，$\mathbf{n}$ 为 $S(t)$ 的单位外法向量，则从 $S(t)$ 散失热量的速率为

$$
-\int_{S(t)} \mathbf{q} \cdot \mathbf{n}\, dS = -\int_{V(t)} \nabla \cdot \mathbf{q}\, dV, \tag{4.31}
$$

其中使用了散度定理将面积分转换为体积分。

现在令式 (4.28) 右端的变化率等于牵引力做功（式 4.29）、重力做功（式 4.30）以及热损失（式 4.31），得到

$$
\underbrace{\frac{d}{dt}\int_{V(t)} \frac{1}{2}\rho v^2\, dV}_{1} + \underbrace{\frac{d}{dt}\int_{V(t)} \rho\hat{U}\, dV}_{2} = \underbrace{\int_{V(t)} \nabla \cdot (\boldsymbol{\sigma} \cdot \mathbf{v})\, dV}_{3} + \underbrace{\int_{V(t)} \rho\mathbf{g} \cdot \mathbf{v}\, dV}_{4} - \underbrace{\int_{V(t)} \nabla \cdot \mathbf{q}\, dV}_{5}. \tag{4.32}
$$

考察式 (4.32) 的物理意义是有益的。各项已编号，含义如下：

1. 物质体积动能的变化率
2. 物质体积内能的变化率
3. 黏性力对物质体积内流体做功的速率
4. 重力对物质体积内流体做功的速率
5. 由于穿过 $S(t)$ 的传导，物质体积内流体的热损失

现在我们寻求动能的表达式，以便代入式 (4.32)，得到内能变化率的简化表达式。Stewart [344] 指出，这可以通过取动量方程 (4.23) 与速度向量 $\mathbf{v}$ 的标量积来实现。

取点积：

$$
\frac{\partial}{\partial t}(\rho\mathbf{v}) \cdot \mathbf{v} = \rho\mathbf{g} \cdot \mathbf{v} + (\nabla \cdot \boldsymbol{\sigma}) \cdot \mathbf{v} - \nabla \cdot \rho\mathbf{v}\mathbf{v} \cdot \mathbf{v}. \tag{4.33}
$$

注意，由微分的乘积法则，

$$
\begin{aligned}
\frac{\partial}{\partial t}(\rho\mathbf{v} \cdot \mathbf{v}) &= \frac{\partial}{\partial t}(\rho\mathbf{v}) \cdot \mathbf{v} + \mathbf{v} \cdot \frac{\partial}{\partial t}(\rho\mathbf{v}) \\
&= 2\frac{\partial}{\partial t}(\rho\mathbf{v}) \cdot \mathbf{v}, \tag{4.34}
\end{aligned}
$$

因此，

$$
\begin{aligned}
\frac{\partial}{\partial t}(\rho\mathbf{v}) \cdot \mathbf{v} &= \frac{1}{2}\frac{\partial}{\partial t}(\rho\mathbf{v} \cdot \mathbf{v}) \\
&= \frac{1}{2}\frac{\partial}{\partial t}(\rho v^2), \tag{4.35}
\end{aligned}
$$

其中 $v^2 = \mathbf{v} \cdot \mathbf{v}$。利用式 (B.56)，可将式 (4.33) 的第二项写为

$$
(\nabla \cdot \boldsymbol{\sigma}) \cdot \mathbf{v} = \nabla \cdot (\boldsymbol{\sigma} \cdot \mathbf{v}) - \boldsymbol{\sigma} : \nabla\mathbf{v}. \tag{4.36}
$$

将式 (4.35) 和式 (4.36) 代入式 (4.33)，得

$$
\frac{1}{2}\frac{\partial}{\partial t}(\rho v^2) = \rho\mathbf{g} \cdot \mathbf{v} + \nabla \cdot (\boldsymbol{\sigma} \cdot \mathbf{v}) - \boldsymbol{\sigma} : \nabla\mathbf{v} - \nabla \cdot \rho\mathbf{v}\mathbf{v} \cdot \mathbf{v}. \tag{4.37}
$$

上式给出单位体积材料的动能。对于物质体积的动能，必须将式 (4.37) 在物质体积 $V(t)$ 上积分，得到

$$
\int_{V(t)} \frac{1}{2}\frac{\partial}{\partial t}(\rho v^2)\, dV = \int_{V(t)} \rho\mathbf{g} \cdot \mathbf{v}\, dV + \int_{V(t)} \nabla \cdot (\boldsymbol{\sigma} \cdot \mathbf{v})\, dV - \int_{V(t)} \boldsymbol{\sigma} : \nabla\mathbf{v}\, dV - \int_{V(t)} \nabla \cdot \rho\mathbf{v}\mathbf{v} \cdot \mathbf{v}\, dV. \tag{4.38}
$$

在雷诺输运定理（式 4.7）中令 $f = \frac{1}{2}\rho v^2$，有

$$
\begin{aligned}
\frac{d}{dt}\int_{V(t)} \frac{1}{2}\rho v^2\, dV &= \int_{V(t)} \frac{\partial}{\partial t}\left(\frac{1}{2}\rho v^2\right) dV + \int_{V(t)} \frac{1}{2}\nabla \cdot \rho v^2 \mathbf{v}\, dV \\
&= \int_{V(t)} \frac{\partial}{\partial t}\left(\frac{1}{2}\rho v^2\right) dV + \int_{V(t)} \nabla \cdot \rho\mathbf{v}\mathbf{v} \cdot \mathbf{v}\, dV. \tag{4.39}
\end{aligned}
$$

将上式代入式 (4.38)，得到

$$
\frac{d}{dt}\int_{V(t)} \frac{1}{2}\rho v^2\, dV = \int_{V(t)} \rho\mathbf{g} \cdot \mathbf{v}\, dV - \int_{V(t)} \boldsymbol{\sigma} : (\nabla\mathbf{v})\, dV + \int_{V(t)} \nabla \cdot (\boldsymbol{\sigma} \cdot \mathbf{v})\, dV; \tag{4.40}
$$

这就是所需的物质体积动能表达式。将式 (4.40) 代入式 (4.32)，得

$$
\frac{d}{dt}\int_{V(t)} \rho\hat{U}\, dV = \int_{V(t)} \boldsymbol{\sigma} : (\nabla\mathbf{v})\, dV - \int_{V(t)} \nabla \cdot \mathbf{q}\, dV. \tag{4.41}
$$

对左端应用输运定理（式 4.7），得到

$$
\int_{V(t)} \left(\frac{\partial}{\partial t}(\rho\hat{U}) + (\nabla \cdot \rho\hat{U}\mathbf{v})\right) dV = \int_{V(t)} \boldsymbol{\sigma} : (\nabla\mathbf{v})\, dV - \int_{V(t)} \nabla \cdot \mathbf{q}\, dV. \tag{4.42}
$$

然而区域 $V(t)$ 是任意的，因此

$$
\frac{\partial}{\partial t}(\rho\hat{U}) + \nabla \cdot (\rho\hat{U}\mathbf{v}) = \boldsymbol{\sigma} : (\nabla\mathbf{v}) - \nabla \cdot \mathbf{q}. \tag{4.43}
$$

展开左端并利用随体导数的定义（4.2.1 节），有

$$
\begin{aligned}
\frac{\partial}{\partial t}(\rho\hat{U}) + \nabla \cdot (\rho\hat{U}\mathbf{v}) &= \frac{\partial}{\partial t}(\rho\hat{U}) + \rho\hat{U}\nabla \cdot \mathbf{v} + \mathbf{v} \cdot \nabla\rho\hat{U} \\
&= \frac{D}{Dt}(\rho\hat{U}) + \rho\hat{U}\nabla \cdot \mathbf{v} \\
&= \rho\frac{D\hat{U}}{Dt} + \hat{U}\frac{D\rho}{Dt} + \rho\hat{U}\nabla \cdot \mathbf{v} \\
&= \rho\frac{D\hat{U}}{Dt}, \tag{4.44}
\end{aligned}
$$

其中最后一行使用了连续性方程 (4.13)。将式 (4.44) 代入式 (4.43)，得到

$$
\rho\frac{D\hat{U}}{Dt} = \boldsymbol{\sigma} : (\nabla\mathbf{v}) - \nabla \cdot \mathbf{q}. \tag{4.45}
$$

### 4.5.1 比能量与温度的关系

由于比能量 $\hat{U}$ 不能直接测量，有必要建立比能量与温度等可测量量之间的关系。因此，本节将式 (4.45) 用温度 $T$ 而非比能量 $\hat{U}$ 来表示。本节需要一些热力学知识，理解本书其余部分并不需要这些知识。不过本节内容很重要，为完整起见予以呈现。不熟悉热力学概念的仿真软件用户可以选择跳过本小节，直接看 4.5.2 节的最终结果。

令

$$
\hat{H} = \hat{U} + p\hat{V} \tag{4.46}
$$

表示比焓，其中 $p$ 是压力，$\hat{V}$ 是比体积。热力学第一定律与第二定律的组合可写成如下形式 [326]：

$$
d\hat{S} = \frac{1}{T}\left(d\hat{H} - \hat{V}\, dp\right), \tag{4.47}
$$

其中 $\hat{S}$ 是比熵。我们假定 $\hat{H}$ 是压力和温度的函数，因此

$$
d\hat{H} = \left(\frac{\partial \hat{H}}{\partial p}\right)_T dp + \left(\frac{\partial \hat{H}}{\partial T}\right)_p dT. \tag{4.48}
$$

将此表达式代入式 (4.47)，得

$$
d\hat{S} = \frac{1}{T}\left[\left(\frac{\partial \hat{H}}{\partial p}\right)_T - \hat{V}\right] dp + \frac{1}{T}\left(\frac{\partial \hat{H}}{\partial T}\right)_p dT. \tag{4.49}
$$

但 $\hat{S}$ 也是 $p$ 和 $T$ 的函数，因此

$$
d\hat{S} = \left(\frac{\partial \hat{S}}{\partial p}\right)_T dp + \left(\frac{\partial \hat{S}}{\partial T}\right)_p dT. \tag{4.50}
$$

令式 (4.49) 与式 (4.50) 的系数相等，得到

$$
\left(\frac{\partial \hat{S}}{\partial p}\right)_T = \frac{1}{T}\left[\left(\frac{\partial \hat{H}}{\partial p}\right)_T - \hat{V}\right] \tag{4.51}
$$

以及

$$
\left(\frac{\partial \hat{S}}{\partial T}\right)_p = \frac{1}{T}\left(\frac{\partial \hat{H}}{\partial T}\right)_p. \tag{4.52}
$$

现在对式 (4.51) 关于 $T$ 求导，得

$$
\begin{aligned}
\frac{\partial^2 \hat{S}}{\partial T \partial p} &= \left[\frac{\partial}{\partial T}\left(\frac{\partial \hat{S}}{\partial p}\right)_T\right]_p \\
&= -\frac{1}{T^2}\left[\left(\frac{\partial \hat{H}}{\partial p}\right)_T - \hat{V}\right] + \frac{1}{T}\left(\left[\frac{\partial}{\partial T}\left(\frac{\partial \hat{H}}{\partial p}\right)_T\right]_p - \left(\frac{\partial \hat{V}}{\partial T}\right)_p\right) \\
&= -\frac{1}{T^2}\left[\left(\frac{\partial \hat{H}}{\partial p}\right)_T - \hat{V}\right] + \frac{1}{T}\left(\frac{\partial^2 \hat{H}}{\partial T \partial p} - \left(\frac{\partial \hat{V}}{\partial T}\right)_p\right). \tag{4.53}
\end{aligned}
$$

对式 (4.52) 关于 $p$ 求导，得

$$
\begin{aligned}
\frac{\partial^2 \hat{S}}{\partial p \partial T} &= \left[\frac{\partial}{\partial p}\left(\frac{\partial \hat{S}}{\partial T}\right)_p\right]_T \\
&= \frac{1}{T}\left[\frac{\partial}{\partial p}\left(\frac{\partial \hat{H}}{\partial T}\right)_p\right]_T \\
&= \frac{1}{T}\frac{\partial^2 \hat{H}}{\partial T \partial p}. \tag{4.54}
\end{aligned}
$$

由于

$$
\frac{\partial^2 \hat{S}}{\partial T \partial p} = \frac{\partial^2 \hat{S}}{\partial p \partial T},
$$

故可令式 (4.53) 与式 (4.54) 相等，得到

$$
\left(\frac{\partial \hat{H}}{\partial p}\right)_T = \hat{V} - T\left(\frac{\partial \hat{V}}{\partial T}\right)_p. \tag{4.55}
$$

将此结果代入式 (4.48)，得到

$$
d\hat{H} = \left(\hat{V} - T\left(\frac{\partial \hat{V}}{\partial T}\right)_p\right) dp + \left(\frac{\partial \hat{H}}{\partial T}\right)_p dT. \tag{4.56}
$$

注意到材料的比热 $c_p$ 和体膨胀系数 $\beta$ 与偏导数有如下关系，上式可以简化：

$$
c_p = \left(\frac{\partial \hat{H}}{\partial T}\right)_p \quad \text{和} \quad \beta = \frac{1}{\hat{V}}\left(\frac{\partial \hat{V}}{\partial T}\right)_p.
$$

因此式 (4.56) 可写为

$$
d\hat{H} = (1 - \beta T)\hat{V}\, dp + c_p\, dT. \tag{4.57}
$$

由式 (4.46)，有

$$
d\hat{H} = d\hat{U} + \hat{V}\, dp + p\, d\hat{V}.
$$

将此结果代入式 (4.57) 并对 $d\hat{U}$ 整理，得到

$$
\begin{aligned}
d\hat{U} &= (1 - \beta T)\hat{V}\, dp + c_p\, dT - p\, d\hat{V} - \hat{V}\, dp \\
&= c_p\, dT - \beta T\hat{V}\, dp - p\, d\hat{V}. \tag{4.58}
\end{aligned}
$$

对上式关于时间求导，得

$$
\frac{d\hat{U}}{dt} = c_p\frac{dT}{dt} - \beta T\hat{V}\frac{dp}{dt} - p\frac{d\hat{V}}{dt}. \tag{4.59}
$$

上式对随体导数同样成立，因此

$$
\frac{D\hat{U}}{Dt} = c_p\frac{DT}{Dt} - \beta T\hat{V}\frac{Dp}{Dt} - p\frac{D\hat{V}}{Dt}. \tag{4.60}
$$

现在考虑 $D\hat{V}/Dt$ 这一项。因为 $\hat{V} = 1/\rho$，有

$$
\begin{aligned}
\frac{D\hat{V}}{Dt} &= \frac{\partial \hat{V}}{\partial t} + \mathbf{v} \cdot \nabla\hat{V} \\
&= \frac{\partial}{\partial t}\left(\frac{1}{\rho}\right) + \mathbf{v} \cdot \nabla\left(\frac{1}{\rho}\right) \\
&= \frac{\partial}{\partial \rho}\left(\frac{1}{\rho}\right)\frac{\partial \rho}{\partial t} + \mathbf{v} \cdot \left[\frac{\partial}{\partial \rho}\left(\frac{1}{\rho}\right)\right]\nabla\rho \\
&= -\frac{1}{\rho^2}\left(\frac{\partial \rho}{\partial t} + \mathbf{v} \cdot \nabla\rho\right) \\
&= -\frac{1}{\rho^2}\frac{D\rho}{Dt} \\
&= \frac{1}{\rho}\nabla \cdot \mathbf{v}, \tag{4.61}
\end{aligned}
$$

其中最后一行使用了式 (4.15)。将式 (4.61) 代入式 (4.60)，两边乘以密度，得

$$
\rho\frac{D\hat{U}}{Dt} = \rho c_p\frac{DT}{Dt} - \beta T\frac{Dp}{Dt} - p\nabla \cdot \mathbf{v}. \tag{4.62}
$$

该方程将比能量的变化率与温度、压力和体积等可测量量的变化率联系起来。

### 4.5.2 以温度表示的能量方程

现在我们可以用温度表示能量方程。将式 (4.62) 代入式 (4.45)，得

$$
\rho c_p\frac{DT}{Dt} = \beta T\frac{Dp}{Dt} + p\nabla \cdot \mathbf{v} + \boldsymbol{\sigma} : \nabla\mathbf{v} - \nabla \cdot \mathbf{q}. \tag{4.63}
$$

展开随体导数，得到

$$
\rho c_p\left(\frac{\partial T}{\partial t} + \mathbf{v} \cdot \nabla T\right) = \beta T\left(\frac{\partial p}{\partial t} + \mathbf{v} \cdot \nabla p\right) + p\nabla \cdot \mathbf{v} + \boldsymbol{\sigma} : \nabla\mathbf{v} - \nabla \cdot \mathbf{q}. \tag{4.64}
$$

最后一步是将热通量向量 $\mathbf{q}$ 与温度联系起来。这可以利用傅里叶热传导定律 [37] 完成，该定律表明

$$
\mathbf{q} = -k\nabla T, \tag{4.65}
$$

其中 $k$ 是材料的热导率。将此结果代入式 (4.64)，得到能量方程的最终形式：

$$
\rho c_p\left(\frac{\partial T}{\partial t} + \mathbf{v} \cdot \nabla T\right) = \beta T\left(\frac{\partial p}{\partial t} + \mathbf{v} \cdot \nabla p\right) + p\nabla \cdot \mathbf{v} + \boldsymbol{\sigma} : \nabla\mathbf{v} + \nabla \cdot (k\nabla T). \tag{4.66}
$$

虽然这是一个相当一般的方程，但还可以加入一些物理因素以更好地处理注塑成型。特别是反应热。这可能源于化学过程，如热固性材料或发泡过程。更根本地说，它可能源于半结晶聚合物固化时发生的熔化潜热。采取一般的处理方法，我们在式 (4.66) 中加入热源项。于是能量方程变为

$$
\rho c_p\left(\frac{\partial T}{\partial t} + \mathbf{v} \cdot \nabla T\right) = \beta T\left(\frac{\partial p}{\partial t} + \mathbf{v} \cdot \nabla p\right) + p\nabla \cdot \mathbf{v} + \boldsymbol{\sigma} : \nabla\mathbf{v} + \nabla \cdot (k\nabla T) + \dot{Q}, \tag{4.67}
$$

其中 $\dot{Q}$ 表示热源。

## 4.6 边界条件

本章前几节推导的质量、动量和能量守恒方程非常一般，可应用于范围广泛的流体流动。然而我们的焦点是注塑成型。在后面的章节中我们将看到，控制方程可以为注塑成型仿真进行简化。不过，有些边界条件是注塑成型特有的，既适用于一般的守恒方程，也适用于简化方程。作为本章的结束，我们考察这些边界条件。

图 4.1 展示了一个简单的模具型腔，我们将讨论其所需的边界条件。有若干表面需要描述边界条件：

- $\Sigma_{\mathrm{inj}}$：熔体进入型腔所经过的表面
- $\Sigma_{em}$：模具边缘
- $\Sigma_{W+}$：模具上表面
- $\Sigma_{W-}$：模具下表面
- $\Sigma_{\mathrm{ins}}$：定义模具中任何镶件的表面。虽然图 4.1 只画了一个，但真实模具中可以有任意多个
- $\Sigma_{mf}$：定义熔体前沿的表面。取决于模具几何形状和镶件数量，这类表面可能有任意多个

### 4.6.1 压力与流量边界条件

对于一般流动问题，表面上的边界条件通常以牵引力或速度，或两者的组合给出。然而对于薄腔流动，使用压力和流量边界条件更为方便。与压力有关的边界条件有：

- 在任何不可渗透边界上，沿边界法线方向的压力梯度为零。不可渗透边界是模具边缘、模具壁面以及任何模具镶件。因此

$$
\frac{\partial p}{\partial n} = 0 \quad \text{在 } \Sigma_{em},\ \Sigma_{W+},\ \Sigma_{W-},\ \Sigma_{\mathrm{ins}} \text{ 上}. \tag{4.68}
$$

在物理上，这意味着材料不能流过模具壁面、边缘或镶件。

- 在熔体进入型腔的表面上，指定熔体流量 $q$ 或压力 $p$，即

$$
q = q_{\mathrm{inj}} \quad \text{或} \quad p = p_{\mathrm{inj}} \quad \text{在 } \Sigma_{\mathrm{inj}} \text{ 上}. \tag{4.69}
$$

流动分析软件通常在充填阶段使用指定的流量，由待充填型腔的体积除以用户指定的充填时间得到。近年来在这方面有所改进。例如，如果存在来自机器、剪切速率或其他约束的限制，流量可能会降低，甚至提高。保压阶段的边界条件通常在注射点处指定压力。在基础软件中，该压力可能是常数。然而，为了确保更均匀的密度，压力可以变化。Michaeli 和 Lauterbach [249] 讨论了利用 PVT 数据改变保压压力的想法，以便使用最优的保压压力曲线来最小化收缩差异。

- 假定压力基准为大气压，熔体前沿处压力为零，即

$$
p = 0 \quad \text{在 } \Sigma_{mf} \text{ 上}. \tag{4.70}
$$

虽然这是一个合理的假设（因为大多数模具都设有排气以让空气逸出），但有些工艺可能需要改变这一设定。其中包括反压工艺，在该工艺中，模具未充填部分保持在高于大气压的压力下，以影响流动前沿的运动。

### 4.6.2 温度边界条件

与温度有关的边界条件有：

- 在熔体注入所经过的表面上，给定沿型腔厚度方向的温度分布 $T(z)$，即

$$
T(z) = T_{\mathrm{inj}}(z) \tag{4.71}
$$

大多数流动分析软件假定注射点处温度均匀。实践中这并不太关键，因为熔体会迅速对流进入型腔。一个可能关键的场合是，当使用流道系统将熔体输送进多个型腔时。由于流道内的剪切加热以及熔体绕拐角的流动，各型腔浇口处可能出现黏度差异，从而导致充填不平衡。我们将在第 6 章讨论 3D 分析时再讨论这一点。

- 在所有模具边界上给定温度 $T$。不过，通常允许在各边界上给定不同的温度，例如

$$
\begin{aligned}
T &= T_{em} \quad \text{在 } \Sigma_{em} \text{ 上}, \\
T &= T_{W+} \quad \text{在 } \Sigma_{W+} \text{ 上}, \\
T &= T_{W-} \quad \text{在 } \Sigma_{W-} \text{ 上}, \\
T &= T_{\mathrm{ins}} \quad \text{在 } \Sigma_{\mathrm{ins}} \text{ 上}.
\end{aligned}
$$

或者，可以使用热通量边界条件。更一般地，在相应表面上给定热通量与温度边界条件的组合。热通量边界条件通常指定在模具壁面 $\Sigma_{W+}$ 和 $\Sigma_{W-}$ 上。热通量可以通过将充填/保压分析与模具冷却分析耦合来计算。这样就可以考虑模具冷却系统的影响。

### 4.6.3 模具变形边界条件

以上所有内容都假定模具不变形。实践中模具变形可能很重要，但我们需要讨论这一术语的含义。有两种情况：

1. 薄型腔
2. 长型芯和模具镶件

#### 4.6.3.1 薄型腔

自 1995 年本书第一版问世以来，成型工艺已发生重大变化。新的材料配方和高压注塑机使得非常薄的型腔也能成型，如笔记本电脑外壳和个人电子元件。这些应用需要高得多的注射压力，专用机器可提供高达 250 MPa 的压力。在这样的压力下，计算中可能应当考虑模具的柔度。这不是一个新想法。Baaijens [21] 在注塑成型的薄壁近似中考虑了模具变形。最近，Delaunay 等人 [77] 表明，对于厚度小于 1 mm 的型腔，模具柔度可能很重要。

#### 4.6.3.2 长型芯与模具镶件

如今已有若干真正的三维（3D）模具充填分析可用。我们将在第 6 章详细考察这些方法。目前我们指出，3D 建模允许显式包含型芯和镶件。在高注射压力下，型芯和镶件可能发生挠曲，从而改变流动通道。如果不加以考虑，这会导致流动前沿计算以及收缩与翘曲的误差。

本节的边界条件非常一般。下一章我们将考虑控制方程的简化、注塑成型的特殊情形以及边界条件的必要细化。

## 4.7 纤维填充材料

在聚合物树脂中加入纤维以改善力学性能是很常见的做法。纤维的加入量按重量计可从 10% 到 60% 不等。纤维可分为两类：短纤维和长纤维。短纤维的典型长度约为 0.5 mm [388]，最常用的是玻璃、芳纶或碳纤维。不过，不锈钢纤维可用于电磁屏蔽应用。用短纤维增强的材料称为短纤维增强热塑性塑料（SFRTP）。短纤维的加入提高了刚度（模量），但对材料强度影响不大。应当注意，制件中纤维的实际长度取决于其加工方式。塑化速度和背压会影响纤维的断裂，进而影响最终长度。同样，浇口设计也会影响成型后的纤维长度。

长纤维增强热塑性塑料（LFRTP）的纤维由与 SFRTP 相同的材料制成。纤维长度通常为 6–11 mm，由塑料粒料的长度决定。与短纤维的情况一样，制件中的实际纤维长度取决于加工条件和浇口设计。与基体树脂相比，LFRTP 表现出更高的模量、抗冲击性和强度。本节只考虑 SFRTP。本书第 9 章将再回到 LFRTP 仿真的挑战。

SFRTP 仿真的挑战在于确定成型后纤维的位置和取向。有了这些信息，就能确定整个制件中热-力学性能的变化。这些性能随后可用于收缩、翘曲和结构分析。

### 4.7.1 纤维浓度

纤维填充材料用纤维的长径比和体积分数来表征。我们将熔融的 SFRTP 称为纤维悬浮液。纤维长径比 $a_R$ 定义为纤维长度除以其直径 $d$。体积分数 $\varphi$ 定义为单位体积 SFRTP 中纤维的总体积。我们定义纤维的数量密度 $n$ 为单位体积 SFRTP 中的纤维数目。假设纤维为圆柱形，单根纤维的体积为 $\pi d^2 l/4$。因此 $\varphi = n\pi d^2 l/4 \approx nd^2 l$。在熔体充填型腔的过程中，悬浮液的流变性能和最终的纤维取向分布取决于加工条件以及悬浮液中纤维间的相互作用。纤维间的相互作用不仅取决于一定体积内纤维的数量，还取决于其长度。$nl^3$ 和 $ndl^2$ 等参数常用于对纤维悬浮液的浓度区域进行分类。由于 $nl^3 = nd^2l \times (l/d)^2 \approx \varphi a_R^2$，$ndl^2 = nd^2l \times (l/d) \approx \varphi a_R$，这两个参数分别等价于 $\varphi a_R^2$ 和 $\varphi a_R$。

纤维悬浮液的浓度分为三个区域：稀悬浮液、半浓（或半稀）悬浮液和浓悬浮液。稀悬浮液平均在体积 $v = l^3$ 内少于一根纤维。每根纤维可以绕其三个转轴自由旋转，不受其他纤维的任何阻碍。这导致 $nl^3 < 1$，即 $\varphi a_R^2 < 1$。在半稀悬浮液中，每根纤维受到 $nl^3 > 1$ 且 $ndl^2 < 1$ 的约束。换句话说，$1 < \varphi a_R^2 < a_R$，纤维间的平均距离大于纤维直径但小于纤维长度。因此，纤维只能绕其两个轴自由旋转。最后是浓悬浮液，其中 $\varphi a_R > 1$。此时纤维间的平均距离小于纤维直径，纤维只能绕其对称轴旋转。在这类悬浮液中，纤维运动涉及周围纤维的移动，纤维-纤维接触占主导地位。

### 4.7.2 Jeffery 方程

大多数 SFRTP 的纤维含量使其处于浓悬浮液区域。尽管如此，早期对注塑成型中纤维建模的尝试忽略了这一事实。

纤维悬浮液建模的起点是 Jeffery [182] 的工作，他将纤维建模为悬浮在牛顿流体中的无惯性刚性长椭球。Jeffery 只考虑了单个可绕其所有轴自由旋转的颗粒。为描述纤维运动，我们引入沿长椭球对称轴的单位向量 $\mathbf{p}$。Jeffery 给出的取向变化率解为

$$
\dot{\mathbf{p}} = \mathbf{W} \cdot \mathbf{p} + \frac{a_r^2 - 1}{a_r^2 + 1}\left(\mathbf{D} \cdot \mathbf{p} - (\mathbf{D} : \mathbf{p}\mathbf{p})\mathbf{p}\right), \tag{4.72}
$$

其中 $\mathbf{W}$ 和 $\mathbf{D}$ 分别是 2.1.3 节定义的涡量张量和应变速率张量，$a_r$ 是代表颗粒的椭球的长轴与短轴之比。Jeffery 方程的推导见附录 C。

将式 (4.72) 应用于长径比为 $a_R$ 的圆柱形颗粒时，可使用近似 $a_r \approx a_R$。不过，一些作者确定了圆柱体的等效椭球轴比。Akczurowski 和 Mason [5] 发现，$a_R = 0.86$ 的圆柱体的等效椭球轴比为 1.0。他们还发现，当 $a_R > 1.68$ 时，$a_r$ 小于 $a_R$，反之亦然。

在无相互作用纤维的剪切流动中，纤维表现出封闭的周期性旋转，称为 Jeffery 轨道，其周期为

$$
T_r = \frac{2\pi}{\dot{\gamma}}\left(a_r + \frac{1}{a_r}\right). \tag{4.73}
$$

Jeffery 解适用于稀悬浮液，但如前所述，商用聚合物通常是浓悬浮液。Vincent [388] 给出了一些典型数字。对于长径比为 10 的纤维，体积分数在 0.01 至 0.10 之间时，悬浮液可视为半稀。使用玻璃和聚合物的典型密度值，这些体积分数对应于 2.5% 至 22% 的重量分数。大多数工程应用的 SFRTP 重量分数超过 30%。事实上，近年来许多供应商已将纤维含量提高到 60%（按重量计）。为了切合实际地处理这些浓悬浮液，必须考虑纤维之间的相互作用。

### 4.7.3 统计方法

处理纤维悬浮液时，概率密度函数（PDF）是描述纤维取向状态的一般方法。我们定义这样一个分布，记为 $\psi(\mathbf{p}, t)$，使得 $\psi(\mathbf{p}, t)\,d\mathbf{p}$ 是 $t$ 时刻发现纤维取向在 $\mathbf{p}$ 到 $\mathbf{p} + d\mathbf{p}$ 方向范围内的概率。概率密度函数的性质之一是它只能取 0 到 1 之间的值，其中 0 表示没有可能，1 表示确定无疑。

如果对概率密度函数在所有可能方向上积分，其值必须为 1，即

$$
\int \psi(\mathbf{p}, t)\, d\mathbf{p} = 1. \tag{4.74}
$$

假设纤维为圆柱形且无优先端，由 $\mathbf{p}$ 和 $-\mathbf{p}$ 定义的方向应当相同。因此 PDF 必须是偶函数，即 $\psi(\mathbf{p}, t) = \psi(-\mathbf{p}, t)$。可以证明 [287]，$\psi(\mathbf{p}, t)$ 满足 Fokker-Planck 方程：

$$
\frac{\partial \psi}{\partial t} = \frac{\partial}{\partial \mathbf{p}} \cdot \left[D^{(r)}(\mathbf{I} - \mathbf{p}\mathbf{p}) \cdot \frac{\partial \psi}{\partial \mathbf{p}} - \left(\mathbb{L} \cdot \mathbf{p} - (\mathbb{L} : \mathbf{p}\mathbf{p})\mathbf{p}\right)\psi\right], \tag{4.75}
$$

其中 $D^{(r)}$ 是扩散系数，$\mathbb{L}$ 是有效速度梯度，定义为 $\mathbb{L} = \mathbf{L} - \xi\mathbf{D}$，$\xi = 2/(a_r^2 + 1)$。

虽然 PDF 提供了悬浮液中取向状态的一般描述，但式 (4.75) 的数值求解计算量很大。事实上，在本书写作之时，我们不知道有任何商业软件求解 PDF。不过，有若干学术代码可用于研究目的的小问题。

下一章我们将考察一种预测成型制件中纤维取向分布的流行方法。该方法存在一些不足，我们将在第 7 章重新讨论这一问题，那里将讨论一些改进模型。此外，我们只处理了短玻璃纤维。使用长玻璃纤维进行增强也很常见，这些纤维在加工力作用下可能弯曲。这些材料需要另外的模型，我们将在第 9 章进一步讨论。

### 4.7.4 力学性能

预测成型 SFRTP 纤维取向的主要动机之一，是利用这些信息预测成型材料的力学性能。这些性能可用于结构分析，或作为收缩与翘曲计算的输入。对于结构分析，主要关注模量预测。对于收缩与翘曲，我们需要模量和热膨胀系数。

为此有多种模型和方法。商业软件中使用的往往是近似方法，将在下一章讨论。第 8 章我们将考察一些尚未在商业软件中实现的先进方法。

## 4.8 收缩与翘曲

注塑成型仿真的主要挑战之一是预测注塑材料的收缩与翘曲。所有聚合物都会收缩，收缩程度取决于成型条件。如果材料均匀收缩，成型制品就只是制件的忠实复制，只是尺寸略小。在这种情况下，模具制造商只需要知道收缩量，就可以相应地把模具做得更大，使成型制品符合所需尺寸。成型制件尺寸的几何缩减称为模具收缩、成型收缩，或简称收缩。收缩可按照标准定义，如《热塑性塑料模具尺寸收缩测量的标准试验方法》（ASTM D955-08）。在该试验中，收缩在制件从注塑机顶出后 24 小时和 48 小时测量。国际标准《塑料——注塑试样——第 4 部分：成型收缩的测定》（ISO 294-4）使用类似的试样和方法。然而，现实是收缩是随时间变化的函数。实践中，成型制件可能在标准规定的 24 或 48 小时之前（或之后）很久就已装配。更糟的是，成型制件在成型后可能经受变化的环境条件。一个例子是汽车部件的喷漆。喷漆过程可能涉及暴露于高于环境温度的温度，这会影响收缩量及其各向异性，进而影响最终形状（翘曲）。我们将这类收缩称为成型后收缩。理想情况下，仿真应将收缩预测为时间的函数。

上述假定收缩在制件内是均匀的。遗憾的是，情况很少如此。聚合物的收缩取决于成型条件，更具体地说，取决于材料冷却时的温度和压力历史。这些是局部条件，因此收缩乃至翘曲可能在制件各处不同。注塑成型仿真真正的挑战是准确预测制件的翘曲。这需要考虑局部收缩以及成型后环境因素的影响。我们真正寻求的是对制件成型后即刻以及其使用寿命期间变形的描述。这需要了解成型后材料的力学性能。除收缩与翘曲外，预测加工后的结构性能也有很大价值。在预测无定形材料因加工产生的屈服应力等性能方面已取得一些进展 [96]。本书第二部分将考察针对半结晶材料的仿真改进，为实现这一宏伟目标做出贡献。我们将在第 13 章把这些思路汇集起来。

## 4.9 流道

实践中，一副模具内可能有多个型腔。各型腔的几何形状未必相同，但每个型腔都需要由流道系统供给熔体。图 1.2 描绘了"冷流道"系统，即流道中的流动与型腔具有相似的温度边界条件：聚合物-模具界面温度固定，或聚合物-模具界面处的热通量给定。另一方面，对于大型模具，可能需要在制件的多个点引入熔体，以最小化流动长度并控制熔接线的位置。在这些情况下，流道系统用电热元件加热，以保持到达型腔的温度近乎恒定，称为热流道。

无论流道是冷是热，流道系统中的流动与型腔中的流动一样，由质量、动量和能量守恒方程决定。差别在于塑料/模具界面处的温度边界条件，不过应当注意，热流道系统内的流动可能很复杂。所用流道的类型影响流动的几何形状，进而影响熔体流经流道进入型腔时的剪切变形。而且，由于热流道可用于大型制件，流量可能相当高，导致显著的剪切加热。热流道中的压力也可能很高，并会影响黏度。我们将在 5.10 节讨论流道的简化数学建模。

</div>
