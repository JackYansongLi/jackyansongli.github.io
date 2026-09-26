---
title: 第 11 章：结晶对流变与热性能的影响
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

## 11.1 结晶对流动特性的影响

### 11.1.1 黏度增强因子模型
注塑成型模拟需要同时考虑材料的熔融流动和固化。为了在流动分析中获得准确的结果，准确预测固化层厚度至关重要。确定固化层厚度的方法有两种：  
1. 使用无流动温度的概念，该温度表示液固相变发生时的温度。  
2. 使用基于黏度增加的固化准则：黏度增加一个数量级的区域将确定固化层。  
对于无定形聚合物，无流动温度与玻璃化转变温度 $T_g$ 相关。$T_g$ 不太依赖于冷却速率和流动。这一事实使得可以使用单一温度作为确定熔融和固态的准则。因此，无流动温度的概念在无定形材料的注塑成型模拟中提供了一个有用的简化（第5.3.5节）。  
半结晶聚合物的固化行为更难建模。这些聚合物在高于玻璃化转变温度的温度下由于结晶而固化。结晶速率受热历史和流动的影响。众所周知，在较高冷却速率下，半结晶聚合物会在较低温度下固化。

对于半结晶聚合物而言，不存在单一的“无流动温度”值。为了模拟固化行为，使用粘度增加准则会更好。因此，在结晶过程中了解材料的流变学特性非常重要。为了考虑结晶动力学对流变学的影响，需要建立粘度与材料相对结晶度之间的关系。构建这种关系的最简单方法是将增强因子 $ f_{\eta}(\alpha) $ 引入现有的本构方程中。基于这一想法，Pantani 等人 [283] 采用了以下修改后的 Cross 模型：
$$
\begin{aligned}
\eta &= \eta_0 f_{\eta}(\alpha), \\
1 &+ \left(\frac{\eta_0 \dot{\gamma}}{\tau^*}\right)^{1-n}
\end{aligned}
\quad (11.1)
$$
其中，$\eta_0$ 是无剪切应力下的粘度，$\tau^*$ 是与牛顿流体和幂律行为过渡时的剪切应力相关的常数，$n$ 是幂律指数，衡量剪切稀释行为的程度。增强因子 $ f_{\eta}(\alpha) $ 假设具有以下经验形式（Titomanlio 等人 [365]）：
$$
f_{\eta} = 1 + \beta_1 \exp \left(-\frac{\beta_2}{\alpha^2}\right), \quad (11.2)
$$
其中，$\beta$、$\beta_1$ 和 $\beta_2$ 是拟合参数。

Tanner [357] 基于悬浮理论，考虑了半结晶聚合物在线性粘弹性应变范围内的流变学特性。他提出了分别使用低浓度和高浓度两种模型，并通过两种模型解的插值确保在中间体积分数（结晶度）处实现连续过渡。

如果低浓度和高浓度下的复剪切模量分别为 $G_0^*$ 和 $G_1^*$，总体复剪切模量 $G^*$ 可以表示为：
$$
G^*(\omega, \alpha) = f_G(\alpha)G_0^*(\omega) + h_G(\alpha)G_1^*(\omega) \quad (11.3)
$$
其中 $\omega$ 为频率。Tanner [357] 通过拟合 Boutahar 等人 [44] 对不同球晶体积分数的聚丙烯熔体的振荡剪切数据，直接确定了 $f_G(\alpha)$ 和 $h_G(\alpha)$。对于非线性粘弹性流动，Tanner 及其同事 [357, 359] 提出了使用修改后的 Phan-Thien-Tanner (PTT) 模型：
$$
\frac{\Delta \tau_{\text{tr}}}{\Delta t} \left( \frac{\tau}{\mu} \right) \left( \lambda_a + \frac{\tau}{\exp(\lambda_a)} \right) \varepsilon = 2 f_\eta(\alpha) \eta_0 D \quad (11.4)
$$

$$
\frac{\Delta \tau_{\text{tr}}}{\Delta t} = \frac{\Delta \tau_{ij}}{\Delta t} = \frac{\partial \tau_{ij}}{\partial t} + u_k \frac{\partial \tau_{ij}}{\partial x_k} - L_{ik} \tau_{kj} - L_{jk} \tau_{ki} \quad (11.5)
$$
其中 $\varepsilon$ 为参数，$\tau_{\text{tr}}$ 为 $\tau$ 的迹，$\eta_0$ 为无剪切流动相的零剪切粘度，$D$ 为变形率张量。函数 $f_\eta$ 根据 Metzner [248] 的悬浮理论表达如下：
$$
f_\eta = \frac{1}{(1 - \alpha/A)^2} \quad (11.6)
$$
其中 $A$ 为表示几何效应的参数。对于光滑球形，$A \approx 0.68$；对于粗糙紧密晶体，$A \approx 0.44$。通过改变 $A$，方程 11.6 也可以应用于非球形形状。Pantani 等人 [281] 提供了多种具有不同增强因子的模型的综述。通常，这些模型预测随着相对结晶度的增加，粘度会出现急剧上升。

一些模型，如方程11.6所示，在相对较低的结晶度下，粘度会增加并趋向于无穷大，而其他模型，如方程11.2所示，粘度首先增加然后趋于平稳，最终达到一个有限值。

### 11.1.2 两相模型
Doufas等人[87, 88]提出了一种两相模型，其中半结晶相被建模为刚性双链节，无定形相则使用修改后的Giesekus本构方程进行建模。系统的总额外应力张量遵循加法规则：$ \tau = \tau_a + \tau_{sc} $，其中下标“a”表示无定形基体，而“sc”表示在球晶内部的半结晶、半无定形材料，即半结晶相。无定形额外应力张量$\tau_a$通过修改后的Giesekus模型计算得出，其松弛时间依赖于相对结晶度：$ \lambda_a(\alpha, T) = \lambda_a(0, T)(1 - \alpha)^2 $。这里，结晶度被纳入无定形本构方程中，以考虑由于结晶导致的链段损失。半结晶贡献的额外应力张量$\tau_{sc}$通过刚性双链节模型计算得出，表达式为：$ \tau_{sc} = \mu \left(3 - I + 6\lambda_{sc} D : \hat{u} \hat{u} \right) $，其中$\mu = n_0 k_B T$是熔体剪切模量，$n_0$是分子数密度，$k_B$是玻尔兹曼常数，$T$是绝对温度。$\lambda_{sc}$是半结晶相的松弛时间，$D$是变形率张量，$\hat{u}$是取向单位向量。

尖角括号表示半结晶相分布函数下的平均值，〈uu和〈uuuu分别是第二和第四方向张量。方向张量的变化遵循形式为 $ \frac{D \boldsymbol{\underline{uu}}}{Dt} = \frac{1}{\lambda_{sc}} - \mathbf{L} \cdot \boldsymbol{\underline{uu}} - \boldsymbol{\underline{uu}} \cdot \mathbf{L}^T + \frac{2D : \boldsymbol{\underline{uuuu}}}{3} + \boldsymbol{\underline{uu}}, $（11.10）的方程，这正是Bird等人[36]提出的刚性哑铃模型的表达式。Zheng和Kennedy[418]遵循两相模型的方法。在他们的研究中，半结晶相也通过刚性哑铃模型进行建模，但无定形相则为了简化而采用FENE-P模型。FENE-P模型是一种非线性弹性哑铃模型，其中哑铃受到最大允许长度的约束。该模型相对简单，但能够捕捉聚合物溶液中大多数重要的非线性流变学特性，如记忆效应和剪切稀化。其流变学性质已为人所熟知[399]。在Zheng和Kennedy的方法[418]中，结晶度的影响并未嵌入到无定形参数中。相反，系统被视为半结晶相（球晶或串珠模型为刚性棒）悬浮在无定形材料基体中的体系。无定形相的物理性质，如黏度ηa和弛豫时间λa，与相对结晶度无关，而整个系统的性质则依赖于相对结晶度。

让我们考虑当 $ u $ 接近等向平衡分布时模型的响应。在这种情况下，满足 $ u $ 空间中的福克-普朗克方程（方程 4.75 和 C.27）的分布函数的主要项为 $(4\pi)^{-1}$。根据 Brenner [45] 描述的积分定理，我们得到：

$$
2D : \int u \otimes u \, du = D, \quad (11.11)
$$

$$
2L \cdot \int u \, du + \int u \, du \cdot L^T = D. \quad (11.12)
$$

从方程 11.10，假设稳态 $(D_{\Delta u \Delta u}/D t = 0)$ 并使用方程 11.11 和 11.12，我们得到：

$$
6 \Delta u \Delta u - I = \lambda_{sc} D. \quad (11.13)
$$

将方程 11.11 和 11.13 代入方程 11.9，得到：

$$
\tau_{sc} = 2\mu \lambda_{sc} D, \quad (11.14)
$$

其中 $\mu \lambda_{sc}$ 应该是 $\alpha$ 的函数。在 $\alpha \rightarrow 0$ 的极限下，无定形相占主导地位，$\mu \lambda_{sc} \rightarrow 0$。在 $\alpha$ 的高值下，半结晶相主导响应。$\mu \lambda_{sc}$ 对相对结晶度的依赖关系近似为 [418]：

$$
\mu \lambda_{sc} = \frac{\eta_a \left(\frac{\alpha}{A}\right)^{\beta_1}}{\left(1 - \frac{\alpha}{A}\right)^{\beta}} \quad (11.15)
$$

其中 $A$ 与方程 11.6 中定义相同，$\beta$ 和 $\beta_1$ 是经验常数。我们可将方程 11.14 写为：

$$
\tau_{sc} = \frac{2\eta_a \left(\frac{\alpha}{A}\right)^{\beta_1}}{\left(1 - \frac{\alpha}{A}\right)^{\beta}} D \quad (11.16)
$$

在简单的剪切流动中，方程 11.16 可简化为：

$$
\tau^{(sc)}_{13} = \frac{\left(\frac{\alpha}{A}\right)^{\beta_1}}{\left(1 - \frac{\alpha}{A}\right)^{\beta}} \eta_a \dot{\gamma} \quad (11.17)
$$

而无定形相贡献的剪切应力为：

$$
\tau^{(a)}_{13} = \eta_a \dot{\gamma}. \quad (11.18)
$$

总的剪切应力为：

$$
\tau_{13} = \tau^{(a)}_{13} + \tau^{(sc)}_{13} = \left[1 + \frac{\left(\frac{\alpha}{A}\right)^{\beta_1}}{\left(1 - \frac{\alpha}{A}\right)^{\beta}}\right] \eta_a \dot{\gamma} \quad (11.19)
$$

因此，我们可以将剪切黏度函数写为：

$$
\eta = \frac{\tau_{13}}{\dot{\gamma}} = \left[1 + \frac{\left(\frac{\alpha}{A}\right)^{\beta_1}}{\left(1 - \frac{\alpha}{A}\right)^{\beta}}\right] \eta_a \quad (11.20)
$$

其行为类似于悬浮模型（方程 11.6）。显然，上述所有方程仅适用于 $\alpha < A$。

当α→A时，会发生堵塞和流动停止，此时粘度增加并趋于无穷大。然而，如Tanner [357] 所指出的，方程11.7中的应力法则过于简化了结构的真实图景。叠加规则假定在每个点上存在无定形相和结晶相的并行成分。Koscher和Fulchiron [211] 所展示的聚丙烯结晶照片并不支持这一假设。

## 11.2 结晶对PVT的影响

考虑一个包含结晶相和无定形相的代表性体积V。结晶相占据的体积为Vc，无定形相占据的体积为Va。由于我们仅考虑两相系统，我们有

$$
V = V_c + V_a \quad (11.21)
$$

并且

$$
\rho V = \rho_c V_c + \rho_a V_a \quad (11.22)
$$

其中，ρ是代表性体积的密度，ρc和ρa分别是结晶相和无定形相的密度。绝对结晶度简单地表示为

$$
\chi = \frac{V_c}{V}
$$

无定形相的体积分数为

$$
1 - \chi = \frac{V_a}{V}
$$

因此，从方程11.22中我们得到

$$
\rho = \rho_c \chi + \rho_a (1 - \chi) \quad (11.23)
$$

我们可以假设固体聚合物的结晶度达到了最终值χ∞。那么固体的密度为

$$
\rho_{sc} = \rho_c \chi_\infty + \rho_a (1 - \chi_\infty) \quad (11.24)
$$

回忆到 $\chi = \alpha \chi_\infty$，方程 11.23 可以重新写为

$$
\rho = \rho_{sc} \alpha + \rho_a (1 - \alpha) \quad (11.25)
$$

这个方程也可以用比容的形式重写为：

$$
\frac{1}{\hat{V}} = \frac{\alpha}{\hat{V}_{sc}} + \frac{1 - \alpha}{\hat{V}_a} \quad (11.26)
$$

其中 $\hat{V}_{sc} \equiv \frac{1}{\rho_{sc}}$，$\hat{V}_a \equiv \frac{1}{\rho_a}$，$\hat{V} \equiv \frac{1}{\rho}$ 分别是半结晶相、无定形相和整个系统的比容。$\hat{V}_{sc}$ 和 $\hat{V}_a$ 随温度和压力的变化由泰特方程给出：

$$
\hat{V}_i(T, P) = \hat{V}_{0(i)}(T) \left[1 - 0.0894 \ln \left(1 + \frac{P}{B_i(T)}\right)\right], \quad (i = sc, a) \quad (11.27)
$$

其中

$$
\hat{V}_{0(i)} = b_1(i) + b_2(i)(T - b_5) \quad (11.28)
$$

$$
B_i(T) = b_3(i) \exp \left(-b_4(i)(T - b_5)\right) \quad (11.29)
$$

其中 $b_1(i)$ 到 $b_4(i)$ 和 $b_5$ 是需要通过拟合 PVT 测量数据确定的模型常数。方程 11.26 考虑了 PVT 过渡区随冷却速率和材料变形的变化，因为结晶动力学对这些变量有很强的依赖性。在模拟中使用方程 11.26 的关键在于允许 PVT 图，通常是在接近稳态条件下测量的，随着加工条件的变化而变化。

*图 11.1：不同冷却速率下的 PVT 图（经 John Wiley and Sons 许可，转载自 Luyé 等人 [234]）*

由于冷却速率效应导致的 PVT 过渡区的移动。Luyé 等人的论文中的比容方程为 $\hat{V} = \alpha \hat{V}_{sc} + (1 - \alpha) \hat{V}_{a}$，这显然与方程 11.26 不同。然而，需要注意的是，Luyé 等人论文中的符号 $\alpha$ 表示相对质量结晶度，实际上这两个表达式是等价的。

## 11.3 结晶对比热容的影响

如第3章所述，比热容表示将单位质量的材料温度升高1℃所需的热量。为了模拟结晶度对比热容的影响，Le Bot [43] 和 Luyé 等 [234] 提出了以下近似公式：

$ c_{p-1} = \alpha^{-1} c_{p(s)} + (1 - \alpha)^{-1} c_{p(a)} $

其中，

$ c_{p(s)} = a_1 + a_2 T, \quad c_{p(a)} = b_1 + b_2 T $

这里，$ c_{p(s)} $ 是固相的比热容，$ c_{p(a)} $ 是液相的比热容，$ a_1 $, $ a_2 $, $ b_1 $, 和 $ b_2 $ 是拟合参数。在 [43, 234] 中，相应的方程写作 $ c_{p-1} = \alpha c_{p(s)} + (1 - \alpha) c_{p(a)} $，因为在这些论文中，符号 $ \alpha $ 被定义为相对质量结晶度。

## 11.4 结晶对热导率的影响

### 11.4.1 非傅里叶热传导

在注塑成型过程的冷却阶段，热量从较热的聚合物熔体传递到较冷的金属模具，两者之间存在物理接触。这种热量传递的形式称为热传导。热传导是通过扩散发生的，即原子或分子将部分动能传递给相邻的原子或分子。单位长度的热传导速率，即改变材料温度1℃所需的热量传递率，称为热导率。

热导率的数学定义由方程3.17给出。在经典的傅里叶定律中，流矢量与温度梯度成正比，热导率作为比例系数，表达式为 $ q = k \nabla T $ （11.31），其中 $ q $ 是热流矢量，$ k $ 是热导率。在傅里叶的经典理论中，热导率是一个可以随温度和压力变化的标量。显然，经典定律假设热流矢量总是与温度梯度平行。在注塑成型流动分析中的材料热计算中使用热导率是必不可少的，因为它影响材料的固化行为和初始应力的发展。然而，在注塑成型加工过程中，聚合物熔体由于取向结构而高度取向，并表现出可观察的物理各向异性。经典的傅里叶定律不足以描述变形聚合液体中的热传导。Van den Brule [374] 建议，聚合物链的主链上的热传输机制应该比相邻链之间的机制更有效，因此由流动诱导的聚合物链段的各向异性取向导致了各向异性的热导率。为了描述各向异性热传导，方程11.31必须推广为：$ q = \mathbf{k} \cdot \nabla T $ （11.32），其中 $\mathbf{k}$ 是热导率张量。

如果导热系数 $ k = k_0 I $，其中标量 $ k_0 $ 仅依赖于温度和/或压力，$ I $ 为单位张量，那么这种热流被称为符合傅里叶定律的热传导。任何偏离这一规律的情况将被称为非傅里叶热传导 [168]。因此，Speight 等人 [339] 最近讨论的温度和压力对热导率的影响仍然属于经典的傅里叶定律范畴。另一方面，van den Brule [374, 375] 的研究表明，由于导热张量依赖于流动引起的分子取向，因此会产生非傅里叶效应。同样，纤维填充的热塑性塑料具有各向异性的热导率，因此应使用公式 11.32 [57, 421]。

### 11.4.2 van den Brule 法则对于无定形聚合物
基于网络理论，van den Brule [374] 提出无定形聚合物的热导率张量 $ k $ 与应力张量 $ \sigma $ 之间存在线性关系：
$$
\frac{1}{3} \left( k - \text{tr}(k)I \right) = k_0 C_t \left( \sigma - \text{tr}(\sigma)I \right),
$$
其中 $\text{tr}$ 表示张量的迹，$ C_t $ 为应力-热系数，$ k_0 $ 为未受扰动的平衡标量导热系数。这种应力-热规则类似于广为人知的应力-光学规则（Janeschitz-Kriegl [180]）。Venerus 等人 [383, 384] 发现，几种受应力的聚合物（聚异丁烯和聚硅氧烷橡胶）的无量纲应力-热系数几乎具有通用值，即 $ C_t G_N \approx 0.03 $，其中 $ G_N $ 为熔体平台模量。

这些材料的热扩散系数 $C_t$ 大约在 $1.2 \sim 1.9 \times 10^{-7} \, \text{Pa}^{-1}$ 之间。

### 11.4.3 延伸范登布鲁尔方法至半结晶聚合物

Dai 和 Tanner [74] 使用玻林-VOG 粘弹仪在低剪切速率下制备了等规聚丙烯（iPP）试样，并将其分为两组。第一组试样是在高剪切速率下进行注射成型并变形的，而第二组试样是在低剪切速率下制备的，然后迅速冷却。他们使用符合 ASTM E1952-01 标准的调制差示扫描量热法测量了沿剪切方向和垂直于剪切方向的热导率（分别标记为 $k_{\parallel}$ 和 $k_{\perp}$）。实验结果显示，剪切聚合物的热导率具有各向异性，在剪切方向上增加；$k_{\parallel}/k_{\perp} > 1$。该比值随施加的变形和应力而变化。通过使用应力-热规则将热导率的变化与应力相关联，Dai 和 Tanner 发现系数 $C_t$ 大约在 $10^{-5}$ Pa$^{-1}$，约为 Venerus 等人 [383, 384] 报告的无定形聚合物值的 5 倍。Dai 和 Tanner 将结果解释为“范登布鲁尔效应”总体效应和结构变化效应的结果。从模拟半结晶聚合物加工的角度出发，他们建议使用增强后的应力-热规则来模拟。

郑等人 [421, 425] 将这一理念应用于注塑成型的模拟中。在他们的模拟中，平衡电导率 $ k_0 $ 被假设依赖于结晶度，并可粗略地通过“片层模型”近似表示如下：
$$
\frac{1}{k_0(\alpha, T)} = \frac{\alpha}{k_a(T)} + \frac{1 - \alpha}{k_s(T)} \quad (11.34)
$$

其中 $ k_a(T) $ 和 $ k_s(T) $ 分别是熔融态和固态下的温度依赖平衡热导率。它们可以从实验中获得。图 11.2 显示了典型聚丙烯在固态和熔融态下热导率随温度变化的实验数据。不同的曲线表示实验的重复性。方程 11.34 基于以下假设：

*图 11.2：聚丙烯未受扰动的平衡热导率随温度的变化（转载自 Speight 等人 [339]）*

Speight 等人 [339] 提出了以下假设：
1. 玻璃态（液态）组分和固态（半结晶态）组分串联排列。
2. 通过两组分的热流相等：$ k_0 \nabla T = k_a \nabla T_a = k_s \nabla T_s $
3. 两组分的温度梯度与整体平均值的关系为：$ \nabla T = \alpha \nabla T_s + (1 - \alpha) \nabla T_a $

这些假设较为粗糙。方程 11.34 在两个极端情况下是准确的，并且预测了过渡区平衡热导率值的下限。

## 11.5 结晶对传热的影响

### 11.5.1 斯特藩解

涉及液固相变的瞬态传热问题通常被称为“斯特藩问题”，这一问题最早由斯特藩在1891年关于极地海洋冰形成的研究中提出 [342]。在这里，对于注塑成型的应用，我们考虑一个简化系统，即两个半无限体在完美接触下的情况。第一个体是金属模具。第二个体是具有初始温度 $T_{\text{initial}}$ 和结晶温度 $T_c$ 的聚合物介质。聚合物-金属接触表面的界面温度用 $T_w$ 表示，可以证明该温度与时间无关。如果 $T_w > T_c$，聚合物介质将保持液态；否则，聚合物介质将固化。假设聚合物的固态和液态密度没有差异。此外，在聚合物的液相中不考虑对流效应。如果 $x$ 轴从模具-聚合物接触面开始并指向聚合物介质，则聚合物介质中固态相的温度具有以下解析解 [231]：

$$
T_{\text{solid}}(x, t) - T_w = \frac{\text{erf}\left[\frac{x}{2a_{\text{solid}}t}\right]}{\frac{T_c - T_w}{\text{erf}(\xi)}} \quad (11.35)
$$

聚合物介质中液态相的温度由以下公式给出：

$$
T_{\text{liquid}}(x, t) - T_{\text{initial}} = \frac{\text{erfc}\left[\frac{x}{2a_{\text{liquid}}t}\right]}{\frac{T_c - T_{\text{initial}}}{\text{erfc}(\xi \sqrt{\frac{a_{\text{solid}}}{a_{\text{liquid}}}})}} \quad (11.36)
$$

其中，$a_{\text{solid}}$ 和 $a_{\text{liquid}}$ 分别是聚合物在固态和液态下的热扩散系数。

热扩散率定义为 $a = \frac{k}{\rho c_p}$，其中 $k$ 是热导率，$\rho$ 是密度，$c_p$ 是比热容。参数 $\xi$ 通过求解以下超越方程确定：$ \frac{k_{\text{液}}}{a_{\text{液}}} \exp(-\xi^2) \left( \frac{T_c - T_{\text{初}}}{\pi} + \frac{\Delta H_c}{c_{p\text{固}} (T_c - T_w)} \text{erfc}\left(\frac{\xi a_{\text{固}}}{a_{\text{液}}}\right) \right) = \frac{k_{\text{固}}}{a_{\text{固}}} \left( T_c - T_w \right) \exp\left(-\xi^2 \frac{a_{\text{固}}}{a_{\text{液}}}\right) $ 其中，$k_{\text{固}}$ 和 $k_{\text{液}}$ 分别是固态和液态聚合物的热导率，$\Delta H_c$ 是结晶潜热，$c_{p\text{固}}$ 是固态聚合物的比热容。更多细节请参见 Loulou 和 Delaunay [231]。聚合物介质中固-液界面的位置由下式给出：$ x_{\text{界面}}(t) = 2\xi a_{\text{固}} t. $ Stefan 解决方案的基本假设是凝固发生在单一温度下。然而，对于半结晶聚合物而言，相变总是伴随着结晶的发展，因此材料是在一个温度范围内凝固，而不是在单一温度下。还有其他重要的假设：1. 实际情况中，所有介质都不是无限的。2. 注射成型流动中的对流效应可能不容忽视。在下一节中，我们将考虑三维热传递问题的数值解。

### 11.5.2 结晶动力学的数值求解
通过在方程4.67中的热源项中使用结晶潜热项，热传递方程可以写为：
$$
\frac{\partial (\rho c_p T)}{\partial t} = \frac{\partial}{\partial x_i} \left( \mu \frac{\partial T}{\partial x_i} \right) + \frac{\partial}{\partial t} \left( \rho \tau_{ij} D_{ij} \right) - \frac{\partial q_i}{\partial x_i} + \rho \Delta H_c \chi_\infty, \quad (11.39)
$$
其中，$ p $ 是压力，$\tau_{ij} D_{ij}$ 是由于粘性耗散产生的热量，$\tau_{ij}$ 是额外应力张量，$D_{ij}$ 是变形率张量，$q_i$ 是热流矢量，$\Delta H_c$ 是完美晶体的结晶潜热（单位为 J/kg），$\frac{D\alpha}{Dt}$ 是由上述结晶动力学给出的相对结晶速率，$\chi_\infty$ 是最终的绝对结晶度。

*图 11.3：注塑制件核心区域的温度演变*

图11.3展示了对注塑成型聚丙烯（iPP）部件核心区域计算得到的温度演变。可以注意到，在14-16秒时，温度曲线上出现了一个平台状的过渡区，对应的温度约为120℃。平台的存在是由结晶潜热的释放引起的，它补偿了由冷模具带走的热量。平台温度是熔体向固态转变的结晶温度。

## 11.6 Hele-Shaw 方程的修改
第5章详细展示了如何推导出适用于任意几何薄腔中广义牛顿流体流动的二维压力方程（方程5.71，称为Hele-Shaw方程）。

为了将相关结晶度的演变纳入Hele-Shaw方程，需要注意的是，流体密度不仅取决于压力和温度，还取决于相对结晶度α，因此有
$$
\frac{\partial \rho}{\partial t} = \frac{\partial \rho}{\partial p} \frac{\partial p}{\partial t} + \frac{\partial \rho}{\partial T} \frac{\partial T}{\partial t} + \frac{\partial \rho}{\partial \alpha} \frac{\partial \alpha}{\partial t}. \quad (11.40)
$$

按照第五章中描述的相同推导过程，我们得到
$$
\frac{\partial}{\partial x} \left( \frac{\partial p}{\partial x} \right) + \frac{\partial}{\partial y} \left( \frac{\partial p}{\partial y} \right) = a(x, y) - b(x, y) \frac{\partial^2 p}{\partial t^2} + 2S^2 \frac{\partial^2 p}{\partial x^2} + 2S^2 \frac{\partial^2 p}{\partial y^2}
= a(x, y) - b(x, y) \frac{\partial^2 p}{\partial t^2} + 2S^2 \left( \frac{\partial^2 p}{\partial x^2} + \frac{\partial^2 p}{\partial y^2} \right), \quad (11.41)
$$
其中 $S^2$、$a(x, y)$、$b(x, y)$ 和 $d(x, y)$ 与第五章中的方程5.71中使用的相同，但上述方程右侧的最后一项并未出现在方程5.71中。

如果我们使用 $\rho = \rho_{sc} \alpha + \rho_a (1 - \alpha)$，即方程11.25来近似密度 $\rho$，则有
$$
\frac{\partial \rho}{\partial \alpha} = \rho_{sc} - \rho_a. \quad (11.42)
$$

其中 $\frac{\partial \alpha}{\partial t}$ 由结晶动力学确定。

</div>
