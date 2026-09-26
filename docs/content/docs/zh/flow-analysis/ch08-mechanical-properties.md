---
title: 第 8 章：改进的力学性能建模
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

## 8.1 引言

本章仅限于预测纤维增强复合材料的弹性模量和热膨胀系数。这些性能由成型过程中计算得到的纤维取向分布导出，并用于翘曲或结构分析，如第 5.3.7 节所述。这些分析通常使用短期性能。实际上，这些性能是随时间变化的。关于未填充聚合物长期失效等性能的建模研究进展，可参见 Klompen 等人的工作 [205, 206]。

在纤维增强聚合物中，纤维的几何形状、浓度、热力学性能和取向分布，以及聚合物基体的热力学性能，都会显著影响复合材料的力学和热学性能。材料建模的思想是从微观层面的力学和物理出发，预测注塑复合材料的宏观行为。预测微观结构对整体性能影响的一种有效方法是平均场均匀化方法。Tucker 和 Liang [371] 综述了几种基于平均场均匀化的细观力学模型。他们推荐 Mori-Tanaka 模型 [258] 作为估算注塑中取向短纤维复合材料刚度的最佳选择。

预测过程包括两个主要步骤。第一步是使用细观力学模型预测完全取向材料的单向性能。在轴对称纤维的情况下，单向复合材料的性能是横向各向同性的。第二步是将取向信息与完全取向材料的单向性能相结合，在考虑取向分布影响的情况下，预测更复杂体系的性能。

在下文中，我们使用上标 f 表示与纤维相关的量，使用上标 m 表示基体量。

## 8.2 单向复合材料有效性能的建模

### 8.2.1 有效刚度

考虑由体积分数为 $\phi_m$ 的基体和体积分数为 $\phi_f$ 的纤维组成的两相复合材料（二者满足 $\phi_m+\phi_f=1$），复合材料中的平均应力 $\bar{\sigma}$ 由下式给出：

$$\bar{\sigma} = \phi_f\bar{\sigma}^f + \phi_m\bar{\sigma}^m, \tag{8.1}$$

其中 $\bar{\sigma}^f$ 和 $\bar{\sigma}^m$ 分别为纤维和基体中的体积平均应力，由下式给出：

$$\bar{\sigma}^f = \frac{1}{V_f}\int_{V_f}\sigma(\mathbf{x})\,dV, \quad \bar{\sigma}^m = \frac{1}{V_m}\int_{V_m}\sigma(\mathbf{x})\,dV, \tag{8.2}$$

其中 $V_f$ 和 $V_m$ 分别为纤维和基体所占据的体积。复合材料中的平均应变 $\bar{\varepsilon}$ 由下式给出：

$$\bar{\varepsilon} = \phi_f\bar{\varepsilon}^f + \phi_m\bar{\varepsilon}^m. \tag{8.3}$$

其中 $\bar{\varepsilon}^f$ 和 $\bar{\varepsilon}^m$ 分别为纤维和基体中的体积平均应变。类似地，纤维相和基体相中的应力-应变关系分别为

$$\bar{\sigma}^f = C^f\bar{\varepsilon}^f \tag{8.4}$$

和

$$\bar{\sigma}^m = C^m\bar{\varepsilon}^m. \tag{8.5}$$

复合材料的有效刚度张量为 $C$（$C_{ijkl}$），它按下式将平均应变与平均应力联系起来：

$$\bar{\sigma} = C\bar{\varepsilon}. \tag{8.6}$$

Hill [156] 定义了一个称为应变集中张量的四阶张量 $A$，它本质上是纤维平均应变与复合材料总平均应变之比，即

$$\bar{\varepsilon}^f = A\bar{\varepsilon} \quad (\bar{\varepsilon}^f_{ij} = A_{ijkl}\bar{\varepsilon}_{kl}). \tag{8.7}$$

联立方程 8.1–8.7，可得

$$\bar{\sigma} = C\bar{\varepsilon} = \phi_f\bar{\sigma}^f + \phi_m\bar{\sigma}^m = \phi_f C^f\bar{\varepsilon}^f + \phi_m C^m\bar{\varepsilon}^m = \phi_f C^f\bar{\varepsilon}^f + C^m(\bar{\varepsilon} - \phi_f\bar{\varepsilon}^f) = C^m\bar{\varepsilon} + \phi_f(C^f - C^m)\bar{\varepsilon}^f = C^m\bar{\varepsilon} + \phi_f(C^f - C^m)A\bar{\varepsilon}, \tag{8.8}$$

因此，

$$C = C^m + \phi_f\left(C^f - C^m\right)A. \tag{8.9}$$

这就是有效刚度张量 $C$ 所需的方程。由于 $C^f$、$C^m$ 和 $\phi_f$ 都是已知的，因此只需求出应变集中张量 $A$。一旦确定了 $A$，就可以计算有效刚度。$A$ 的不同表达式代表不同的模型。例如，如果 $A = I$，其中 $I$（$I_{ijkl} = (1/2)(\delta_{ik}\delta_{jl} + \delta_{il}\delta_{jk})$）是四阶单位张量，则方程 8.9 简化为

$$C = \phi_m C^m + \phi_f C^f, \tag{8.10}$$

这就是 Voigt 平均。Voigt 平均是有效刚度的上限。

Eshelby [98] 得到了稀薄（dilute）情形下的解。对于嵌入无限大基体中的单个椭球形颗粒，应变集中张量记为 $A^{Eshelby}$，由下式给出：

$$A = A^{Eshelby} = \left[I + ES^m(C^f - C^m)\right]^{-1}, \tag{8.11}$$

其中 $E$ 是四阶 Eshelby 张量 [98]，$S^m = (C^m)^{-1}$ 是弹性柔度张量。Eshelby 模型仅适用于颗粒之间无相互作用的低浓度情形。

Mori 和 Tanaka [258] 将上述模型推广到了非稀薄情形。我们将应变集中张量 $A$ 记为 $A^{MT}$。要求 $A^{MT}$ 在两个极端浓度下满足下列条件：

$$A^{MT}\big|_{\phi_f\to 0} = A^{Eshelby}, \quad A^{MT}\big|_{\phi_f\to 1} = I. \tag{8.12}$$

显然，下面的方程满足两端的必要条件：

$$A = A^{MT} = \left[I + (1-\phi_f)ES^m(C^f - C^m)\right]^{-1}. \tag{8.13}$$

将方程 8.13 代入方程 8.9，得到

$$C = C^m + \phi_f\left(C^f - C^m\right)\left[I + (1-\phi_f)ES^m(C^f - C^m)\right]^{-1}, \tag{8.14}$$

或等价地，

$$C = C^m + \phi_f\left[(C^f - C^m)^{-1} + (1-\phi_f)ES^m\right]^{-1}. \tag{8.15}$$

该模型最早由 Mori 和 Tanaka [258] 推导，因此称为 Mori-Tanaka 模型，后来 Benveniste [32] 和 Christensen [61] 以更简单、更直接的方式对其进行了描述。该模型在低浓度下给出正确的稀薄解，在高浓度下也给出正确的复合材料性能。Tandon 和 Weng [354] 给出了各向同性基体的 Eshelby 张量 $E$ 的实用封闭形式表达式。Eshelby 张量的一般形式见 Mura 的著作 [262]，也可以通过数值方法计算（Gavazzi 和 Langodas [129]）。

方程 8.15 的一种等价形式为

$$C = C^m + \phi_f\left(C^f - C^m\right)A^{Eshelby}\left(\phi_m I + \phi_f A^{Eshelby}\right)^{-1}, \tag{8.16}$$

这就是 Benveniste [32] 论文中给出的方程。

### 8.2.2 有效热膨胀系数

复合材料的热弹性本构关系可表示为

$$\bar{\varepsilon} = S\bar{\sigma} + \alpha\triangle T, \tag{8.17}$$

其中 $\alpha$ 是有效热膨胀系数张量。Benveniste 和 Dvorak [33] 证明了

$$\alpha = \alpha^f + (S^f - S)(S^m - S^f)^{-1}(\alpha^f - \alpha^m). \tag{8.18}$$

弹性柔度张量 $S = C^{-1}$ 可由 Mori-Tanaka 模型计算。方程 8.18 与 Rosen 和 Hashin [314] 的下述方程等同：

$$\alpha = \phi_f\alpha^f + \phi_m\alpha^m + (S - \phi_f S^f - \phi_m S^m)(S^f - S^m)^{-1}(\alpha^f - \alpha^m). \tag{8.19}$$

### 8.2.3 纤维浓度和长径比的影响

前面几节描述的细观力学模型的行为，将通过七个有效热力学性能的预测来说明：弹性模量 $E_{11}$、$E_{22}$、$G_{12}$，泊松比 $\nu_{12}$ 和 $\nu_{23}$，以及热膨胀系数（CTE）$\alpha_{11}$ 和 $\alpha_{22}$，计算范围为整个体积分数区间 $0 \leq \phi_f \leq 1$ 和不同的长径比。下面给出的结果是针对沿 1 方向取向的纤维计算的。计算中，我们假定纤维/基体体系的性能由表 8.1 给出。

表 8.1 短玻璃纤维增强复合材料各组分的性能数据

| 性能 | 基体 | 纤维 |
|---|---|---|
| 杨氏模量 | $E^m = 1.57$ GPa | $E^f = 72.5$ GPa |
| 泊松比 | $\nu^m = 0.335$ | $\nu^f = 0.2$ |
| 热膨胀系数 | $\alpha^m = 108.3\times 10^{-6}$ K$^{-1}$ | $\alpha^f = 4.9\times 10^{-6}$ K$^{-1}$ |

#### 8.2.3.1 纤维浓度的影响

图 8.1 和图 8.2 绘制了基于 Mori-Tanaka 模型在固定长径比 $a_r = 20$ 下，五个有效弹性常数 $E_{11}$、$E_{22}$、$G_{12}$（均以 $E^m$ 归一化）、$\nu_{12}$ 和 $\nu_{23}$ 随纤维体积分数 $\phi(\equiv\phi_f)$ 变化的数值结果。注意到 $E_{11}/E^m$ 和 $E_{22}/E^m$ 在 $\phi=0$ 时收敛于 1，在 $\phi=1$ 时收敛于 $E^f/E^m$。$E_{11}/E^m$ 随体积分数的变化接近线性，表明对于该长径比，Mori-Tanaka 模型预测的 $E_{11}$ 与混合定律的偏差不大。横向模量和剪切模量 $E_{22}/E^m$ 和 $G_{12}/E^m$ 的值在达到高体积分数之前相对较低，表明这些模量的值由基体主导。

有效热膨胀系数（CTE）随纤维体积分数 $\phi$ 的变化绘于图 8.3 中。低体积分数下横向膨胀系数的轻微增大归因于纤维的轴向约束 [321]。

*图 8.1：长径比 $a_R = 20$ 时以 $E^m$ 归一化的有效模量随纤维体积分数的变化，采用 Mori-Tanaka 模型预测*

*图 8.2：长径比 $a_R = 20$ 时有效泊松比随纤维体积分数的变化，采用 Mori-Tanaka 模型预测*

#### 8.2.3.2 纤维长径比的影响

图 8.4 和图 8.5 给出了体积分数 $\phi_f = 0.2$ 时，Mori-Tanaka 模型对五个有效弹性常数 $E_{11}$、$E_{22}$、$G_{12}$（均以 $E^m$ 归一化）、$\nu_{12}$ 和 $\nu_{23}$ 在很宽长径比范围内的预测结果。纤维长径比对 $E_{22}/E^m$、$G_{12}/E^m$ 和 $\nu_{12}$ 的影响很小，但对纵向杨氏模量 $E_{11}/E^m$ 和泊松比 $\nu_{23}$ 有显著影响。最大的影响出现在小长径比处。然而，当长径比超过 50 时，$E_{11}/E^m$ 和 $\nu_{23}$ 对长径比的敏感性降低并趋近于渐近值。

*图 8.3：长径比 $a_R = 20$ 时有效热膨胀系数随纤维体积分数的变化，采用 Rosen-Hashin 模型预测*

图 8.6 给出了 $\phi = 0.2$ 时热膨胀系数随纤维长径比变化的建模结果，由 Rosen 和 Hashin [314] 模型预测。

*图 8.4：纤维体积分数 $\phi = 0.20$ 时以 $E^m$ 归一化的有效模量随纤维长径比的变化，采用 Mori-Tanaka 模型预测*

*图 8.5：纤维体积分数 $\phi = 0.20$ 时有效泊松比随纤维长径比的变化，采用 Mori-Tanaka 模型预测*

*图 8.6：纤维体积分数 $\phi = 0.20$ 时有效热膨胀系数随纤维长径比的变化，采用 Rosen-Hashin 模型预测*

## 8.3 纤维取向平均

在实际情形中，短纤维在复合材料中很少完全取向。这里特别关注的是预测纤维取向分布如何影响热力学性能。其基本方法是对大量子单元进行平均处理，每个子单元可视为由一根纤维及其周围的基体材料组成。整体性能就是所有子单元性能在所有方向上的平均，并按子单元的数量加权。这一过程称为取向平均。

如前所述，纤维取向张量定义为纤维单位取向向量 $\mathbf{p}$ 的并矢积乘以分布函数并在所有方向上积分。纤维取向张量可用于进行取向平均（Advani 和 Tucker [2]）。横向各向同性子单元的四阶刚度张量 $C_{ijkl}$ 可按下式进行平均，得到复合材料刚度 $\langle C_{ijkl}\rangle$ [2]：

$$\langle C_{ijkl}\rangle = B_1 a_{ijkl} + B_2(a_{ij}\delta_{kl} + a_{kl}\delta_{ij}) + B_3(a_{ik}\delta_{jl} + a_{il}\delta_{jk} + a_{jl}\delta_{ik} + a_{jk}\delta_{il}) + B_4(\delta_{ij}\delta_{kl}) + B_5(\delta_{ik}\delta_{jl} + \delta_{il}\delta_{jk}). \tag{8.20}$$

常数 $B_i$ 是张量 $C_{ijkl}$ 的不变量，由下式给出：

$$B_1 = C_{1111} + C_{2222} - 2C_{1122} - 4C_{1212}, \tag{8.21}$$

$$B_2 = C_{1122} - C_{2233}, \tag{8.22}$$

$$B_3 = C_{1212} + 0.5(C_{2233} - 2C_{2222}), \tag{8.23}$$

$$B_4 = C_{2233}, \tag{8.24}$$

$$B_5 = 0.5(C_{2222} - C_{2233}). \tag{8.25}$$

一般而言，$\langle C_{ijkl}\rangle$ 不再是横向各向同性的。方程 8.20 表明，复合材料刚度同时依赖于二阶取向张量 $a_{ij}$ 和四阶取向张量 $a_{ijkl}$。事实上，只需要知道四阶张量即可。注意到 $p_k p_k = 1$，可以证明

$$a_{ijkk} = \langle p_i p_j p_k p_k\rangle = \langle p_i p_j\rangle = a_{ij}. \tag{8.26}$$

这意味着，对于横向各向同性子单元的情形，二阶张量已包含在四阶张量之中。

取向平均方法也可用于预测平均热膨胀系数。其结果为

$$\langle\alpha_{kl}\rangle = \langle C_{ijkl}\rangle^{-1}\langle C_{ijmn}\alpha_{mn}\rangle, \tag{8.27}$$

其中四阶刚度张量的平均由方程 8.20 给出。另一个涉及二阶张量的取向平均由 Bay [29] 给出：

$$\langle C_{ijmn}\alpha_{mn}\rangle = \left[(C_{1111} - C_{1122})\alpha_{11} + (2C_{1122} - C_{2222} - C_{2233})\alpha_{22}\right]a_{ij} + \left[C_{2211}\alpha_{11} + (C_{2222} + C_{2233})\alpha_{22}\right]\delta_{ij}. \tag{8.28}$$

知道了 $\langle C_{ijkl}\rangle$ 和 $\langle\alpha_{ij}\rangle$ 的平均值，就可以在翘曲或结构分析中预测构件的结构性能。

也有比方程 8.20 更精细的其他方法。例如可参见 Eduljee 等人 [93] 和 Lin 等人 [226] 的工作。

</div>
