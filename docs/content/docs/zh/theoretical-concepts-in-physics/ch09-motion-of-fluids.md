---
title: 第 9 章：流体的运动
description: 《物理学中的理论概念》中文译文。
prev: false
next: false
head:
  - tag: script
    attrs:
      type: module
      src: /scripts/moldflow-reading-gate.js
---

<div data-moldflow-protected-content>

## 9.1 引言

首先，我们推导一个表明流体不会“丢失”的方程。采用与电磁学中所用的方法相似的程序（第 7.2 节），考虑由曲面 $S$ 包围的体积 $V$ 的净质量通量。若 $d\mathbf S$ 是一个面元，其矢量方向取为法线向外，则通过 $d\mathbf S$ 的质量流量为 $\rho\mathbf u\cdot d\mathbf S$，其中 $\mathbf u$ 是流体速度，$\rho$ 是其密度（图 9.1）。对该体积的表面积分，质量流出的速率必定等于体积 $V$ 内质量损失的速率，即

$$
\oint_S\rho\mathbf u\cdot d\mathbf S=-\frac{d}{dt}\int_V\rho\,dv.\tag{9.1}
$$

**图 9.1**　说明从体积 $V$ 流出的流体质量通量。

利用散度定理，

$$
\int_V\operatorname{div}(\rho\mathbf u)\,dv=-\frac{d}{dt}\int_V\rho\,dv,
\qquad\text{即}\qquad
\int_V\left[\operatorname{div}(\rho\mathbf u)+\frac{d\rho}{dt}\right]dv=0.
$$

这一结果对于流体内部任何体积都必须成立，因而

$$
\operatorname{div}(\rho\mathbf u)+\frac{\partial\rho}{\partial t}=0.\tag{9.2}
$$

这就是连续性方程。注意，在最后两个方程之间，我们已从全导数改用偏导数。原因在于，在微观形式中，我们用偏导数表示流体性质在空间固定点的变化。这不同于跟随某一特定流体元性质的导数。后者用全导数表示，例如 $d\rho/dt$，如下述论证可见。

我们把 $d\rho/dt$ 定义为流体元在流体中运动时密度的变化率（图 9.2）。在短时间间隔 $\delta t$ 内跟随该流体元的运动。若流体在 $(x,y,z)$ 处的速度为 $\mathbf u=(u_x,u_y,u_z)$，则

$$
\frac{d\rho}{dt}=\lim_{\delta t\to0}\frac{1}{\delta t}[\rho(x+u_x\delta t,y+u_y\delta t,z+u_z\delta t,t+\delta t)-\rho(x,y,z,t)].
$$

**图 9.2**　说明全导数 $d/dt$ 与偏导数 $\partial/\partial t$ 的关系。

现在对方括号内第一项作泰勒展开：

$$
\begin{aligned}
\frac{d\rho}{dt}&=\lim_{\delta t\to0}\frac{1}{\delta t}\left[\rho(x,y,z,t)+\frac{\partial\rho}{\partial x}u_x\delta t+\frac{\partial\rho}{\partial y}u_y\delta t+\frac{\partial\rho}{\partial z}u_z\delta t+\frac{\partial\rho}{\partial t}\delta t-\rho(x,y,z,t)\right]\\
&=\frac{\partial\rho}{\partial t}+u_x\frac{\partial\rho}{\partial x}+u_y\frac{\partial\rho}{\partial y}+u_z\frac{\partial\rho}{\partial z}.
\end{aligned}\tag{9.3}
$$

可将它紧凑地写为

$$
\frac{d\rho}{dt}=\frac{\partial\rho}{\partial t}+\mathbf u\cdot\operatorname{grad}\rho=\frac{\partial\rho}{\partial t}+(\mathbf u\cdot\boldsymbol\nabla)\rho,\tag{9.4}
$$

其中算符 $(\mathbf u\cdot\boldsymbol\nabla)$ 表示

$$
(\mathbf u\cdot\boldsymbol\nabla)=u_x\frac{\partial}{\partial x}+u_y\frac{\partial}{\partial y}+u_z\frac{\partial}{\partial z}.\tag{9.5}
$$

方程 (9.3) 不过是微分中的链式法则，这说明了我们对 $d/dt$ 和 $\partial/\partial t$ 的定义。方程 (9.4) 也是微分算符之间的关系：

$$
\frac{d}{dt}=\frac{\partial}{\partial t}+\mathbf u\cdot\operatorname{grad},\tag{9.6}
$$

它在整个流体动力学中反复出现。

我们可以在任一坐标系中工作。若使用跟随流体元的参考系，坐标称为拉格朗日坐标。若在固定的外部参考系中工作，则称为欧拉坐标。通常使用欧拉坐标，尽管有时采用拉格朗日方法更简单，例如力作用于流体元时。

式 (9.4) 使我们能把连续性方程 (9.2) 改写如下：

$$
\operatorname{div}(\rho\mathbf u)+\frac{d\rho}{dt}=\mathbf u\cdot\operatorname{grad}\rho.
$$

展开 $\operatorname{div}(\rho\mathbf u)$，

$$
\mathbf u\cdot\operatorname{grad}\rho+\rho\operatorname{div}\mathbf u+\frac{d\rho}{dt}=\mathbf u\cdot\operatorname{grad}\rho,
\qquad\text{故}\qquad\frac{d\rho}{dt}=-\rho\operatorname{div}\mathbf u.\tag{9.7}
$$

若流体不可压缩，$\rho=\text{constant}$，流动由 $\operatorname{div}\mathbf u=0$ 描述。若流动不随时间变化，$\partial\rho/\partial t=0$，且无旋，即 $\operatorname{curl}\mathbf u=0$，则速度场 $\mathbf u$ 可由速度势 $\phi$ 表示，定义为 $\mathbf u=\operatorname{grad}\phi$。注意，这与电场强度 $\mathbf E=-\operatorname{grad}\phi$ 的静电势符号约定相反。于是速度势 $\phi$ 可作为拉普拉斯方程的解求得：

$$
\nabla^2\phi=0,\tag{9.8}
$$

并满足边界条件。与静电学和静磁学数学形式的类比是研究这两个学科的富有成效的方法，麦克斯韦充分利用了它，如第 5 章所述。

## 9.2 无黏性不可压缩流体的运动方程

### 9.2.1 欧拉方程

从作用于笛卡儿坐标中尺寸为 $\Delta x,\Delta y,\Delta z$ 的流体元上的力这一最简单情形开始。总是假定流体任一点的压强是各向同性的，但它可随位置变化。正是流体元两侧的压强差导致力作用于它。先考虑作用于 $x$ 方向、面积 $\Delta A=\Delta y\Delta z$ 的表面上的力，并对小 $\Delta x$ 作泰勒展开：

$$
f_x=\rho\Delta v\frac{du_x}{dt}=[p(x)-p(x+\Delta x)]\Delta A=\left[p(x)-p(x)-\frac{\partial p}{\partial x}\Delta x\right]\Delta y\Delta z=-\frac{\partial p}{\partial x}\Delta v,
$$
$$
\rho\frac{du_x}{dt}=-\frac{\partial p}{\partial x},\tag{9.9}
$$

其中 $\Delta v=\Delta x\Delta y\Delta z$ 是流体元体积。流体元在 $y$ 和 $z$ 方向受到类似的力，可将它们作矢量相加，得到

$$
\rho\frac{d\mathbf u}{dt}=-\operatorname{grad}p=-\boldsymbol\nabla p.\tag{9.10}
$$

流动常发生在引力场中，此时可在 (9.10) 中加入项 $-\boldsymbol\nabla\phi$，从而

$$
\rho\frac{d\mathbf u}{dt}=-\operatorname{grad}p-\rho\operatorname{grad}\phi,\tag{9.11}
$$

其中 $\phi$ 是单位质量的引力势。方程 (9.11) 称为欧拉方程。对于地面应用，相对于某一参考值，重力势可以用竖直 $z$ 方向上的重力加速度 $g$ 表示。因此，重力势可简单写成 $\phi=gz$。[^5]

我们特意把 (9.11) 写成拉格朗日导数，这意味着力作用在以流体局部速度运动的参考系中。现在把它改写为欧拉坐标，也就是说，以偏微分而非全微分表示。分析与第 9.1 节完全相同，只是现在考虑的是矢量 $\mathbf u$，而不是标量 $\rho$。这只带来轻微的复杂性，因为矢量 $\mathbf u$ 的三个分量 $(u_x,u_y,u_z)$ 都是标量函数，故关系式 (9.6) 可直接用于每个坐标。例如，

$$
\frac{d}{dt}u_x=\frac{\partial u_x}{\partial t}+\mathbf u\cdot\operatorname{grad}u_x.
$$

对 $u_y$ 和 $u_z$ 有相似方程，因此把三者作矢量相加，

$$
i_x\frac{du_x}{dt}+i_y\frac{du_y}{dt}+i_z\frac{du_z}{dt}=i_x\frac{\partial u_x}{\partial t}+i_y\frac{\partial u_y}{\partial t}+i_z\frac{\partial u_z}{\partial t}+i_x(\mathbf u\cdot\operatorname{grad}u_x)+i_y(\mathbf u\cdot\operatorname{grad}u_y)+i_z(\mathbf u\cdot\operatorname{grad}u_z).
$$

或者，

$$
\frac{d\mathbf u}{dt}=\frac{\partial\mathbf u}{\partial t}+(\mathbf u\cdot\operatorname{grad})\mathbf u.\tag{9.12}
$$

注意，算符 $(\mathbf u\cdot\operatorname{grad})$ 意味着对矢量 $\mathbf u$ 的全部三个分量施行 $[u_x(\partial/\partial x)+u_y(\partial/\partial y)+u_z(\partial/\partial z)]$ 运算，以求出 $(\mathbf u\cdot\operatorname{grad})\mathbf u$ 在各方向的大小。因此，欧拉坐标中的运动方程成为

$$
\frac{\partial\mathbf u}{\partial t}+(\mathbf u\cdot\operatorname{grad})\mathbf u=-\frac1\rho\operatorname{grad}p-\operatorname{grad}\phi.\tag{9.13}
$$

该方程清楚表明了流体力学复杂性的来源。左边第二项 $(\mathbf u\cdot\operatorname{grad})\mathbf u$ 在速度 $\mathbf u$ 的方程中引入令人棘手的非线性，当试图寻找流体动力学问题的精确解时，它造成各种复杂情况。显然，这一学科很快会变得具有高度的数学复杂性。

### 9.2.2 伯努利定理

重写 (9.13) 的一种有趣方法，是引入称为流动涡量的矢量 $\boldsymbol\omega$，定义为 $\boldsymbol\omega=\operatorname{curl}\mathbf u=\boldsymbol\nabla\times\mathbf u$。根据一个标准矢量恒等式，

$$
\mathbf u\times\boldsymbol\omega=\mathbf u\times(\operatorname{curl}\mathbf u)=\frac12\operatorname{grad}u^2-(\mathbf u\cdot\operatorname{grad})\mathbf u,\tag{9.14}
$$

故运动方程成为

$$
\frac{\partial\mathbf u}{\partial t}-(\mathbf u\times\boldsymbol\omega)=-\operatorname{grad}\left(\frac12u^2+\frac p\rho+\phi\right).\tag{9.15}
$$

方程 (9.15) 对于求某些类别流体动力学问题的特定解很有用。例如，若只关心稳态运动，$\partial\mathbf u/\partial t=0$，因而

$$
\mathbf u\times\boldsymbol\omega=\operatorname{grad}\left(\frac12u^2+\frac p\rho+\phi\right).\tag{9.16}
$$

若流动无旋，即 $\boldsymbol\omega=\operatorname{curl}\mathbf u=0$，则 $\mathbf u$ 可由标量势的梯度导出（见附录 A5.4）。这通常称为势流。于是右边必须为零，故

$$
\frac12u^2+\frac p\rho+\phi=\text{constant}.\tag{9.17}
$$

另一个应用此守恒律的重要方法，是引入流线的概念，流线定义为流体中处处平行于瞬时速度矢量 $\mathbf u$ 的线。例如，图 9.3 显示零黏度不可压缩流体绕固体球流动的流线。若沿流线跟随流动，量 $\mathbf u\times\boldsymbol\omega$ 必垂直于 $\mathbf u$，故若沿流线方向对 $(\frac12u^2+p/\rho+\phi)$ 取梯度，$\mathbf u\times\boldsymbol\omega=0$。结果 (9.17) 称为伯努利定理。

**图 9.3**　说明零黏度不可压缩流体绕固体球势流的流线。（知识共享署名，相同方式共享 3.0 未本地化许可。）

## 9.3 伯努利定理的一些应用

### 9.3.1 文丘里流

文丘里效应是伯努利定理用于流经带缩窄部分的管中流线流动的简单应用（图 9.4）。由质量守恒，流体通过缩窄处时必须加速。由于伯努利方程表明

$$
\frac12u^2+\frac p\rho=\text{constant},\tag{9.18}
$$

缩窄处起始端的压强必低于主管部分的压强。图 9.4 中主管和缩窄处的压力计说明了这一点。

**图 9.4**　说明文丘里效应。位置 2 的压强低于位置 1，文丘里流量计测量 1 与 2 处的压强差 $\Delta p$。（知识共享署名，相同方式共享许可。）

这只是流体行为似乎违背直觉的许多例子之一。在此情形，压强差必须存在，才能使流体沿管子的狭窄部分加速。若缩窄处末端敞开，加速的流体射流会从此时成为喷嘴的地方喷出。在拉瓦尔喷嘴中，文丘里效应扩展到上游的高温高压气体和下游的超音速射流，构成喷气发动机的动力来源。

### 9.3.2 何时可以忽略可压缩性和黏性？

在下列一些例子中，我们考虑把伯努利定理用于气体流动，并作出看似惊人的近似，即气体可视为不可压缩，且可忽略黏性。依照 Faber，我们从通过缩窄处的流动开始（图 9.4）。取压强差很大的极限，因此可近似为

$$
p_1-p_2=\Delta p=\frac12\rho U^2,\tag{9.19}
$$

其中 $U$ 是缩窄处下游流体的速度。若流体为气体，密度改变多少？

以如下定义引入流体的可压缩率 $\beta$：

$$
\beta=-\frac1V\frac{\partial V}{\partial p}.\tag{9.20}
$$

于是流体密度的变化为 $\Delta\rho/\rho=\beta\Delta p$。此式对任何流体都成立，但考虑定压、定容比热容之比 $c_p/c_V=\gamma$ 的理想气体。可压缩率为 $\beta=1/\gamma p$。因此，

$$
\frac{\Delta\rho}{\rho}=\frac12\frac1{\gamma p}\rho U^2.\tag{9.21}
$$

但声速为 $c_s=(\gamma p/\rho)^{1/2}$，故量级上

$$
\frac{\Delta\rho}{\rho}\sim\left(\frac U{c_s}\right)^2=M^2,\tag{9.22}
$$

其中 $M$ 是马赫数。因此，对高度亚声速流动 $M\ll1$，气体的密度变化很小，远小于沿流线的压强或流速变化。Faber 建议，流速小于声速五分之一时可使用不可压缩近似，许多重要气体动力学问题正属此情形。

黏性又如何？我们将在第 9.5 节和下一章处理这一主题，但先从当前问题的角度引入雷诺数 $\operatorname{Re}$。引入雷诺数最简单的方法，是把 (9.19) 中单位面积压强力 $p_1-p_2=\Delta p=\frac12\rho U^2$ 与存在剪切速度梯度时的单位面积黏滞力 $f=\eta\partial u/\partial z$ 比较，其中 $\eta$ 是剪切黏度系数。这些力之比的量级为

$$
\frac{\frac12\rho U^2}{\eta U/L}\sim\frac{\rho LU}{\eta}=\frac{LU}{\nu}=\operatorname{Re},\tag{9.23}
$$

其中 $L$ 是发生速度梯度的尺度，$\nu=\eta/\rho$ 称为运动黏度。显然，若雷诺数远大于 1，便可忽略黏性，若小于 1，黏性效应则占主导。如 Faber 强调的，这个简单关系在流体流动中黏性的作用方面有微妙之处，但对于当前目的，雷诺数高时 $\operatorname{Re}\ge100$ 可忽略黏滞力这一一般规则已经足够。任何给定问题开始时都需估计马赫数和雷诺数。

流体动力学中黏性起本质作用的一个关键方面是边界层。这些效应涉及应力通过壁面与流体之间的“摩擦”向材料主体传递。思考这里黏性作用的一种方法是注意到，边界层厚度 $L$ 往往确实远小于系统尺度，因此由 (9.23) 雷诺数变小，分析中必须包括黏滞力。

### 9.3.3 缩流断面、直升机和风车

忽略可压缩性和黏性大大简化了流体动力学问题简单解的获得。推导某些结果的有用工具之一是缩流断面概念，意为“收缩的流脉”。图 9.5 表示容器侧面面积为 $A$ 的小圆孔流出流体，形成水平射流时的情形。孔外短距离内，流线变窄，因为流体接近并通过孔口时流线弯曲。因此，对离开孔口的流体有横向压强力，故 $S$ 处压强大于 $T$ 处大气压。因而有收缩系数或流出系数 $C$，用以描述射流在远离孔口、达到稳态时的面积相对于孔口面积的比值。缩流断面的面积因此为 $CA$，其中 $A$ 是孔口面积。对大雷诺数，$C$ 通常约为 $0.62$。这是自由射流的例子。

**图 9.5**　说明流体从孔口流出的缩流断面。孔口面积 $A$ 大于射流面积 $CA$，其中 $C<1$。（据 T. E. Faber，1995。）

伯努利方程和缩流断面的结合，使我们能理解直升机和风车的基本特征。下文采用 Faber 的细致分析，他讨论了这些机器实际例子所涉及的各种近似和微妙之处。

对于理想化直升机，桨叶的功能是从上方吸入空气并从下方排出（图 9.6）。桨叶两侧的气流是亚声速的，故空气可视为不可压缩。由于空气不可压缩，桨叶正上方和正下方的 $P$、$Q$ 点气流速度必须相同。然而，桨叶做功，故 $Q$ 处压强大于 $P$ 处压强。但除非桨叶正上方压强低于远处的大气压，空气不会被吸入桨叶。此外，若 $Q$ 处压强高于大气压，射流会在桨叶下方加速并收窄，形成图 9.6 所示缩流断面。换言之，桨叶的功能是降低其上方压强、提高其下方压强，两者均相对于远离直升机处的大气压而言。

**图 9.6**　理想化直升机旋翼桨叶上下的流线。（据 T. E. Faber，1995。）

沿中央流线从远离桨叶处的大气压应用伯努利定理至气流速度为 $u_P$ 的 $P$ 点，则

$$
p_P+\frac12\rho u_P^2=p_A.\tag{9.24}
$$

从 $Q$ 处中央流线至下游 $R$ 点作同样计算，得

$$
p_Q+\frac12\rho u_Q^2=p_Q+\frac12\rho u_P^2=p_A+\frac12\rho u_R^2,\tag{9.25}
$$

其中 $u_R$ 是 $R$ 点下游速度。从 (9.25) 减去 (9.24)，得

$$
p_Q-p_P=\frac12\rho u_R^2.\tag{9.26}
$$

在简单近似中，令压强差作用于桨叶扫过的整个表面积 $A$，并令速度 $u_R$ 在 $R$ 处缩流断面上相同。因此，将直升机向上的推力 $(p_Q-p_P)A$ 与每单位时间赋予射流的向下动量 $\rho u_R^2CA$ 相等，

$$
(p_Q-p_P)A=\frac12\rho u_R^2A=\rho u_R^2CA,\tag{9.27}
$$

其中 $C$ 是收缩因子，缩流断面面积为 $CA$。故 $C=\frac12$。

类似例子是风车的运行，现在要估计多少风能可转变为风帆的转动运动。图 9.7 概略显示理想化风车，风在遇到风车叶片前的上游速度为 $U$。从风中提取能量后，其下游速度仅为上游速度的分数 $f$。由于不可压缩空气的质量守恒，下游较慢的风膨胀至面积 $A/f$。所得流线图形见图 9.7，恰与直升机相反。

**图 9.7**　穿过并绕过理想化风车的流线。（据 T. E. Faber，1995。）

近似分析与直升机情形遵循相同逻辑。考虑风车风帆两侧的中央流线。先考虑上游侧，无穷远处压强为 $p_0$，图 9.6 中与 $P$ 等价点的压强为 $p_1$。因而，应用伯努利方程，

$$
p_1+\frac12\rho U^2=p_0.\tag{9.28}
$$

从与 $Q$ 等价点到下游无穷远处，伯努利定理给出

$$
p_2+\frac12\rho f^2U^2=p_0.\tag{9.29}
$$

相减，作用于风车的净力为

$$
(p_1-p_2)A=\frac12\rho U^2(1-f^2)A.\tag{9.30}
$$

但这必须等于“射流”动量损失率，即上游侧每单位体积为 $\rho UCA$，下游侧为 $\rho UCAf$。动量损失率因而为 $\rho U^2CA(1-f)$。将其与 (9.30) 相等，收缩因子 $C=\frac12(1+f)$。故从风中提取动能的速率为

$$
\frac12\rho U^3CA(1-f^2)=\frac14\rho U^3(1-f^2)(1+f).\tag{9.31}
$$

可从风中提取的功率有最大值，通过对 $f$ 微分使 (9.31) 最大即可找到。该值对应于 $f=\frac13$，最大功率为

$$
P=\frac{8\rho AU^3}{27}.\tag{9.32}
$$

此功率可与入射到风帆上的风的功率 $\frac12\rho AU^3$ 比较，因此理想化风车发电的最大效率为 $16/27$，即 $59\%$。Faber 强调这些论证涉及许多近似和简化，但这些理想化模型展示了不可压缩流体动力学中相关力的基本物理。

### 9.3.4 绕球的势流

一个简单例子是零黏度不可压缩流体绕固体球的势流。需要求拉普拉斯方程 $\nabla^2\phi=0$ 的解，边界条件是球面速度的径向分量为零，以及无穷远处流动沿 $x$ 方向均匀，速度为 $U$。自然要在球坐标中解这个问题，球半径为 $a$。流动关于 $x$ 方向对称，故没有方位角分量。因此，由 A5.5 中拉普拉斯算子的表达式，拉普拉斯方程为

$$
\nabla^2\phi=\frac1r\frac{\partial^2}{\partial r^2}(r\phi)+\frac1{r^2\sin\theta}\frac\partial{\partial\theta}\left(\sin\theta\frac{\partial\phi}{\partial\theta}\right)=0.\tag{9.33}
$$

用分离变量法得该方程通解

$$
\phi=\sum_{n=0}^{\infty}(A_nr^n+B_nr^{-(n+1)})P_n(\cos\theta),\tag{9.34}
$$

其中 $A_n$ 和 $B_n$ 是由边界条件确定的常数，$P_n$ 是 $n$ 次勒让德多项式。我们需要的有 $P_0(\cos\theta)=1$，$P_1(\cos\theta)=\cos\theta$ 和 $P_2(\cos\theta)=\frac32\cos^2\theta-\frac12$。

在 $r=\infty$，流动沿 $x$ 方向均匀，故速度势 $\phi=Ux=Ur\cos\theta$ 满足此条件。这提示我们检验总体流动的 $n=1$ 试探解，即

$$
\phi=(Ur+B_1r^{-2})\cos\theta.\tag{9.35}
$$

在球半径 $r=a$ 处，流体速度不能有径向分量，即 $d\phi/dr=0$。因此，

$$
U=\frac{2B_1}{a^3},\qquad \phi=Ur\left(1+\frac{a^3}{2r^3}\right)\cos\theta.\tag{9.36}
$$

这是拉普拉斯方程的解并符合边界条件，故为所需的唯一解。为求速度场，利用 A5.5 中梯度表达式，在球坐标中取 (9.36) 的梯度，得

$$
\mathbf u=\boldsymbol\nabla\phi=\left(\frac{\partial\phi}{\partial r},\frac1r\frac{\partial\phi}{\partial\theta},0\right)=\left(U\cos\theta\left(1-\frac{a^3}{r^3}\right),-U\sin\theta\left(1+\frac{a^3}{2r^3}\right),0\right).\tag{9.37}
$$

$\mathbf u$ 的解表明球面径向速度分量确为零，且 $\theta=\pi/2$ 处的切向速度为 $\frac32U$，对应于图 9.3 所示场线受压缩而产生的流动加速。值得注意的是，由于此处理中没有黏性，球上没有净力。这是因为球上游和下游两侧的压强力完全对称。这常称为达朗贝尔佯谬。然而，我们需要包含无论多小的黏性效应，才能解释球上确有阻力，如第 9.5 节所述。

## 9.4 浅水和深水中的重力波

浅水和深水重力波的色散关系及其他性质可由伯努利方程导出。首先重述 Faber 对水深为 $d$、波长 $\lambda\gg d$ 的浅水表面小振幅波的分析。取表面张力和黏性为零，故可忽略表面效应。在以波速运动的参考系中工作很方便，该系中的流线概略示于图 9.8。由于流线压缩和膨胀，在波谷处流速 $u$ 略大于平均值 $\bar u$，在波峰处则慢 $\Delta u$。可忽略竖直方向的速度变化，因为相对于 $\Delta u$，波振幅 $\xi$ 很小。由质量守恒，即用连续性方程，沿 $\mathbf u$ 方向的质量通量为常数：

$$
(d+\xi)\bar u=(d+\xi)(\bar u+\Delta u)=\text{constant}.\tag{9.38}
$$

展开此关系，只保留一阶小量，得

$$
\Delta u\,d=-\xi\bar u.\tag{9.39}
$$

水面压强总是大气压，故为常数。于是伯努利方程 (9.17) 成为

$$
\frac12u^2+g(d+\xi)=\text{constant}.\tag{9.40}
$$

将 (9.40) 展开到小量一阶，得

$$
\bar u\Delta u=-g\xi.\tag{9.41}
$$

将 (9.39) 除以 (9.41)，得到

$$
\bar u=\sqrt{gd}.\tag{9.42}
$$

这就是在波静止参考系中，水在图 9.8 里向左漂移的速度。变换到流动为零的参考系，显然波向右的速度为 $c=\sqrt{gd}$。

**图 9.8**　在与波共动的参考系中，浅水重力波的流线。（据 T. E. Faber，1995。）

此解有两个有趣推论。第一，波的相速度 $c=\omega/k=\sqrt{gd}$ 为常数，故波不色散。第二，此结果解释了为什么缓坡海滩上的浅水波波峰与海岸线平行。水深 $d$ 变浅时，波速按 (9.42) 降低，如同光学中一样，波的方向发生折射，波矢方向朝坡度梯度矢量弯折，正如光从空气进入水中。

这种行为与深水表面波不同，后者水深 $d$ 远大于波长，$|\xi|\ll\lambda\ll d$。为简化分析，再次假定可忽略表面张力和黏性。因为水没有涡量，其运动由拉普拉斯方程决定。考虑在正 $x$ 方向传播的水面波，$z$ 方向垂直于未扰动水面 $z=0$ 和固体水下海床 $z=-d$。因此需在二维中解拉普拉斯方程：

$$
\nabla^2\phi=\frac{\partial^2\phi}{\partial x^2}+\frac{\partial^2\phi}{\partial z^2}=0,\tag{9.43}
$$

并满足边界条件。求通解形式很直接。采用如下形式的试探解

$$
\phi\propto e^{ik_xx}e^{ik_zz},\tag{9.44}
$$

其中 $k_x$ 和 $k_z$ 是复数，则

$$
k_x^2+k_z^2=0.\tag{9.45}
$$

寻找沿正 $x$ 方向行进的小振幅波解，故 $k_x$ 必为实数，$k_z$ 为虚数。因此可写 $k_x=k$、$k_z=\pm ik$。

现在处理边界条件。在平坦海床，流体的竖直速度必须为零：

$$
u_z(-h)=\frac{\partial\phi}{\partial z}=0.\tag{9.46}
$$

由 (9.44) 得 $\phi$ 的通解可写为

$$
\phi=e^{ikx}(Ae^{kz}+Be^{-kz}).\tag{9.47}
$$

在 $z=-h$，$\phi$ 对 $z$ 的导数必须为零，因此 $\phi$ 的表达式变为

$$
\phi=\phi_0e^{ikx}[\cosh k(z+h)]e^{-i\omega t},\tag{9.48}
$$

其中现已用 $e^{-i\omega t}$ 项包含波解的时间依赖性。

在表面，由于流动无旋可应用伯努利方程，但因为存在波，流动不再是稳态而是随时间变化。该流动的运动方程由 (9.15) 给出，略去涡量项：

$$
\frac{\partial\mathbf u}{\partial t}=\operatorname{grad}\frac{\partial\phi}{\partial t}=-\operatorname{grad}\left(\frac12u^2+\frac p\rho+\Phi\right).\tag{9.49}
$$

这里用引力势 $\Phi$，以区别于速度势 $\phi$。寻求关于平坦未扰动表面 $z=0$ 的一阶微扰方程。考察 (9.49) 形式中伯努利方程的各项，

$$
\frac12u^2+\frac p\rho+\Phi+\frac{\partial\phi}{\partial t}=\text{constant}.\tag{9.50}
$$

扰动速度 $u$ 的第一项是小量二阶，故略去。表面压强为大气压，沿扰动表面是常数。引力势为 $\Phi=g\xi$，由于取梯度求速度，可略去该常数。因此伯努利方程成为

$$
g\xi+\frac{\partial\phi}{\partial t}=0.\tag{9.51}
$$

表面的竖直速度分量为

$$
\frac{\partial\xi}{\partial t}=u_z=\frac{\partial\phi}{\partial z}.\tag{9.52}
$$

对 (9.51) 取时间偏导，在 (9.52) 中代入 $\partial\xi/\partial t$，得到熟悉的“扩散”方程，

$$
g\frac{\partial\phi}{\partial z}=-\frac{\partial^2\phi}{\partial t^2}.\tag{9.53}
$$

将解 (9.48) 代入 (9.53)，并令 $z=0$，得到色散关系，即波的角频率和波长之间的关系：

$$
\omega^2=gk\tanh(kh).\tag{9.54}
$$

对于深水波，$kh\gg1$，$\tanh(kh)$ 趋于 1，故色散关系成为

$$
\omega=\sqrt{gk}.\tag{9.55}
$$

波是色散的，因为 (9.55) 不是频率和波长的线性关系。群速度 $u_{\rm gr}=d\omega/dk=\frac12\sqrt{g/k}$，因而群速度为相速度的一半。解 (9.54) 也适用于浅水波。在 $kh\ll1$ 极限，$\tanh(kh)=kh$，故色散关系成为 $\omega=\sqrt{gh}\,k$，相速度和群速度均为 $\sqrt{gh}$，如 (9.42)。

深水波中水的运动可由 (9.48) 导出，因为

$$
u_x=\frac{\partial\phi}{\partial x};\qquad u_z=\frac{\partial\phi}{\partial z}.\tag{9.56}
$$

注意 $\xi\ll h$，

$$
u_x=\frac{\partial\phi}{\partial x}=ik\phi_0e^{i(kx-\omega t)}\cosh kh,\tag{9.57}
$$
$$
u_z=\frac{\partial\phi}{\partial z}=k\phi_0e^{i(kx-\omega t)}\sinh kh.\tag{9.58}
$$

这些解的关键特征是，由于 (9.57) 中虚数单位 $i$，$x$ 和 $z$ 方向的波相差 $\pi/2$，所以水的运动一般为椭圆形，水平和竖直方向振幅之比为 $\cosh kh/\sinh kh$。在 $kh\gg1$ 极限，$\cosh kh/\sinh kh=1$，故水作圆周运动，如图 9.9 所示。其振幅随深入水中的深度呈指数减小，双曲正弦函数 $\sinh z=\frac12(e^z-e^{-z})$ 掩盖了这样的事实：随深度增加，每一个波长，波振幅就减小 $1/e$ 倍。这是 (9.53) 形式扩散方程波解的共同特征。此外，水深趋近零时，$\cosh kh\to1$ 而 $\sinh kh\to0$。结果圆变为椭圆，且水深越小，椭圆越狭长。

**图 9.9**　深水重力波中水粒子的运动。表面波向右传播。（据夏威夷大学教育学院课程研究与开发组 Byron Inouye 的图像。）

这只是流体中波的性质这一漫长而引人入胜的故事的开端。任何波形都可由傅里叶级数或傅里叶积分描述，然后可跟踪各独立分量在线性区并进入非线性区的演化，在非线性区会遇到破波、水跃、涌潮、孤子等现象。建议进一步阅读这些主题。

## 9.5 包含黏滞力的不可压缩流体运动方程

为了推导包含黏性效应的流体流动方程，若不写下流体的应力和应变张量，我们几乎已走到尽头。将概述纳维,斯托克斯方程的推导，并指出其中一些微妙之处。

目标是求出剪切黏度为 $\eta$ 的流体所受单位体积黏滞力。流体内各处可存在随位置变化的 $x,y,z$ 方向速度梯度。先回顾牛顿的洞见，剪切黏滞力线性依赖于速度梯度。在图 9.10 所示一维情形中，速度 $u_x$ 沿 $y$ 方向有均匀梯度。牛顿假定，此时流动的相邻层之间有剪应力。所谓剪应力，是指作用在 $x$ 方向平面上、每单位面积的力：

$$
s_{yx}=\eta\frac{\partial u_x}{\partial y}.\tag{9.59}
$$

$\eta$ 称为剪切黏度。

**图 9.10**　说明沿正 $x$ 方向的一维流动中黏滞力的作用，$y$ 方向速度梯度由粗箭头表示。

现在求体积 $dV=dx\,dy\,dz$ 的流体元所受黏滞力（图 9.10）。体积在 $y$ 处底面所受黏滞力由 (9.59) 给出。顶面所受力为 $\eta dx\,dz\,\partial u_x(y+dy)/\partial y$。流体元所受净力是这些力的差。作泰勒展开，

$$
\eta dx\,dz\frac{\partial u_x(y+dy)}{\partial y}=\eta dx\,dz\left[\frac{\partial u_x(y)}{\partial y}+\frac{\partial^2u_x(y)}{\partial y^2}dy\right].
$$

因此，由 $y$ 方向速度梯度导致作用于体积 $V$ 的净力为

$$
\eta dx\,dz\frac{\partial^2u_x}{\partial y^2}dy=\eta\frac{\partial^2u_x}{\partial y^2}dV.\tag{9.60}
$$

故流体元运动方程为

$$
\rho dV\frac{du_x}{dt}=\eta\frac{\partial^2u_x}{\partial y^2}dV;\qquad \frac{du_x}{dt}=\frac\eta\rho\frac{\partial^2u_x}{\partial y^2}.
$$

这个简单公式提示完整三维分析中将出现的黏滞项 $\mu\nabla^2\mathbf u/\rho$ 形式，即纳维,斯托克斯方程。

然而，这句话掩盖了存在黏性时流动物理的一些关键方面。首先，一般而言，边长 $\Delta x,\Delta y,\Delta z$ 的基本流体体积所受力由 $3\times3$ 张量描述。在最简单情形，立方体每个面都承受一个法向压强和两个位于垂直于表面法线平面内的正交剪应力。一般地，应力张量 $s_{ij}$ 具有形式

$$
s_{ij}=\begin{bmatrix}\tau_{11}&\tau_{12}&\tau_{13}\\\tau_{21}&\tau_{22}&\tau_{23}\\\tau_{31}&\tau_{32}&\tau_{33}\end{bmatrix}.\tag{9.61}
$$

**图 9.11**　说明二维中黏滞力的作用。未标注矢量表示流体中平衡的压强和应力。（据 T. E. Faber，1995。）

在微观层次，基本体积尺寸 $d$ 趋于零时，即使存在速度梯度，体积两侧也必须压强平衡，否则当 $d\to0$ 时体积会受到无限大的加速度（图 9.11）。同样，$\tau_{12}$ 必须等于 $\tau_{21}$，否则基本体积元当 $d\to0$ 时会受到无限大的角加速度。为避免这一情况，通过写出应力张量分量，将与 $x$,$y$ 平面速度梯度有关的剪应力表达式对称化：

$$
\tau_{12}=\tau_{21}=\eta\left(\frac{\partial u_x}{\partial y}+\frac{\partial u_y}{\partial x}\right).\tag{9.62}
$$

因此应力张量只有六个独立元，三个对角压强和三个非对角项。

### 9.5.1 库埃流

让我们在二维情形说明其工作方式，考虑夹在两个同心旋转圆柱之间的黏性流体，即所谓库埃流，得名于发明这种黏度计的法国物理学家 Maurice Couette。外圆柱角速度为 $\omega_b$，内圆柱以角频率 $\omega_a$ 旋转。流体在两圆柱间沿圆形流线运动，故用 $x=r\cos\phi$、$y=r\sin\phi$ 将黏性剪应力表达式从笛卡儿坐标转换到极坐标 $r,\phi$ 很方便。把速度分量写为柱坐标形式，

$$
u_x=u_r\cos\phi-u_\phi\sin\phi;\qquad u_y=u_r\sin\phi+u_\phi\cos\phi,\tag{9.63}
$$

其中 $u_r$ 是径向速度，$u_\phi$ 是随半径 $r$ 变化的圆周速度。用关系式可将 (9.62) 中微分转换为极坐标：

$$
\frac\partial{\partial x}=\cos\phi\frac\partial{\partial r}-\frac{\sin\phi}{r}\frac\partial{\partial\phi};\qquad \frac\partial{\partial y}=\sin\phi\frac\partial{\partial r}+\frac{\cos\phi}{r}\frac\partial{\partial\phi}.\tag{9.64}
$$

由于问题具有圆柱对称性，在 $\phi=0$ 求微分很方便，此时

$$
\tau_{12}=\tau_{21}=\eta\left(\frac{\partial u_x}{\partial y}+\frac{\partial u_y}{\partial x}\right)=\eta\left(\left.\frac1r\frac{\partial u_x}{\partial\phi}\right|_{\phi=0}+\left.\frac{\partial u_y}{\partial r}\right|_{\phi=0}\right),\tag{9.65}
$$
$$
\left.\frac1r\frac{\partial u_x}{\partial\phi}\right|_{\phi=0}=-\frac{u_\phi}{r};\qquad\left.\frac{\partial u_y}{\partial r}\right|_{\phi=0}=\frac{\partial u_\phi}{\partial r}.\tag{9.66}
$$

因而

$$
f=\eta\left(-\frac{u_\phi}{r}+\frac{\partial u_\phi}{\partial r}\right)=\eta r\frac\partial{\partial r}\left(\frac{u_\phi}{r}\right)=\eta r\frac{\partial\omega}{\partial r}.\tag{9.67}
$$

所以若流体像刚体一样旋转，$\omega(r)=\text{constant}$，就没有剪应力，这很合理。

接着求作用在距中心 $r$、厚度 $dr$、单位深度流体环形圆柱上的转矩（图 9.12）。环带内边缘 $r$ 处的转矩为

$$
G=\eta r^2(2\pi r)\frac{\partial\omega}{\partial r}.\tag{9.68}
$$

环带外边缘的转矩为

$$
G(r+dr)=G(r)+\frac{\partial G}{\partial r}dr,\tag{9.69}
$$

故作用在环带上的净转矩为这些转矩之差 $(\partial G/\partial r)dr$。环带的运动方程于是为

$$
\frac{\partial L}{\partial t}=\frac{\partial G}{\partial r}dr=\frac\partial{\partial r}\left[\eta r^2(2\pi r)\frac{\partial\omega}{\partial r}\right]dr,\tag{9.70}
$$

其中 $L=2\pi r^2\rho u_\phi dr$ 是环带角动量。因此，

$$
r^2\frac{\partial u_\phi}{\partial t}=\frac\eta\rho\frac\partial{\partial r}\left(r^3\frac{\partial\omega}{\partial r}\right).\tag{9.71}
$$

**图 9.12**　说明两个旋转圆柱间流体流动中作用于圆柱环带的力，即所谓库埃流。

写 $\nu=\eta/\rho$，其中 $\nu$ 是运动黏度，圆周速度 $u_\phi$ 的运动方程为

$$
\frac{\partial u_\phi}{\partial t}=\frac\nu{r^2}\frac\partial{\partial r}\left(r^3\frac{\partial\omega}{\partial r}\right).\tag{9.72}
$$

这就是我们所寻求的关系。关心稳态速度分布，此时 $\partial u_\phi/\partial t=0$，因而

$$
\frac{\partial\omega}{\partial r}=Ar^{-3},\tag{9.73}
$$

其中 $A$ 是常数。积分得

$$
\omega=-\frac{2A}{r^2}+B.\tag{9.74}
$$

拟合在 $a$ 和 $b$ 处角速度分别为 $\omega_a$ 和 $\omega_b$ 的边界条件，得

$$
A=\frac{a^2b^2}{2(b^2-a^2)}(\omega_b-\omega_a);\qquad B=\frac{b^2\omega_b-a^2\omega_a}{b^2-a^2}.\tag{9.75}
$$

最后，由 (9.67) 和 (9.72) 得转矩 $G$：

$$
G=\eta r^2(2\pi rl)\frac{\partial\omega}{\partial r}=\eta r^2(2\pi rl)\frac{A}{r^3}=\frac{4\pi\eta la^2b^2}{b^2-a^2}(\omega_b-\omega_a),\tag{9.76}
$$

其中 $l$ 为圆柱长度。注意，转矩作为半径的函数是常数，正如稳态所预期。

推导纳维,斯托克斯方程时，这一看似离题的推导有两个优点。第一，已说明如何用库埃黏度计测量流体黏度。内圆柱以恒定角速度旋转，外圆柱由弹簧秤强制保持静止，弹簧秤测量转矩 $G$ 的大小。第二，已说明对应力张量非对角项表达式定义的自洽性。

### 9.5.2 纳维,斯托克斯方程

将应力张量和所得应变之间的关系写成适用于全部三个坐标的形式：

$$
\tau_{ij}=\eta\left(\frac{\partial u_i}{\partial x_j}+\frac{\partial u_j}{\partial x_i}\right).\tag{9.77}
$$

作用在基本体积上的力由相对两面上应力张量元素的导数给出，如导出 (9.60) 的简单计算所示。因此，随流动运动的单位体积所受总力为

$$
\sum_j\frac{\partial\tau_{ij}}{\partial x_j}=\eta\sum_j\left(\frac{\partial^2u_i}{\partial x_j\partial x_j}+\frac{\partial^2u_j}{\partial x_i\partial x_j}\right).\tag{9.78}
$$

用矢量记号重写此表达式很方便：

$$
\mathbf f=\eta\left[\nabla^2\mathbf u+\boldsymbol\nabla(\boldsymbol\nabla\cdot\mathbf u)\right],\tag{9.79}
$$

故可将该项直接纳入力方程 (9.13)，得到

$$
\frac{\partial\mathbf u}{\partial t}+(\mathbf u\cdot\operatorname{grad})\mathbf u=-\frac1\rho\operatorname{grad}p-\operatorname{grad}\phi+\frac\eta\rho\nabla^2\mathbf u+\frac{\eta+\eta'}\rho\boldsymbol\nabla(\boldsymbol\nabla\cdot\mathbf u).\tag{9.80}
$$

其中，在 (9.80) 的散度项前加入与流体抗体积变化有关的附加项，即所谓体积黏度 $\eta'$。该项导致穿过介质的声波衰减。因此，此式适用于可压缩和不可压缩流动。最常见的力方程形式假定流体不可压缩，此时 $\boldsymbol\nabla\cdot\mathbf u=0$，纳维,斯托克斯方程可写为

$$
\frac{\partial\mathbf u}{\partial t}+(\mathbf u\cdot\operatorname{grad})\mathbf u=-\frac1\rho\operatorname{grad}p-\operatorname{grad}\phi+\frac\eta\rho\nabla^2\mathbf u.\tag{9.81}
$$

这种对应力存在时流体流动的简化处理掩盖了完整推导 (9.81) 时的许多微妙之处。标准教材讨论了这些问题，Faber 对不同情形中应力张量分量的意义给出了强烈的物理解释。[^6]

为日后使用，现在把 (9.81) 转换为流动涡量 $\boldsymbol\omega$ 的演化方程。使用矢量恒等式

$$
(\mathbf u\cdot\boldsymbol\nabla)\mathbf u=(\boldsymbol\nabla\times\mathbf u)\times\mathbf u+\frac12\boldsymbol\nabla(\mathbf u\cdot\mathbf u).\tag{9.82}
$$

将该式代入 (9.81) 的 $(\mathbf u\cdot\boldsymbol\nabla)\mathbf u$，然后取方程的旋度，得

$$
\frac{\partial\boldsymbol\omega}{\partial t}=\boldsymbol\nabla\times(\mathbf u\times\boldsymbol\omega)+\frac\eta\rho\nabla^2\boldsymbol\omega.\tag{9.83}
$$

此表达式对于理解流体流动动力学将极有价值。

### 9.5.3 泊肃叶流

纳维,斯托克斯方程解析解很少，但在特殊情形可解。最容易的情形之一是内半径 $a$ 的细管中的速度分布，例如针筒针头中，雷诺数 $\operatorname{Re}=Lu\rho/\eta$ 远小于 1。如上文和第 10.2.3 节所述，在此极限，流动由黏性而非流体惯性支配。考察 (9.81) 可知，由于管内流动稳态且速度梯度垂直于流动，纳维,斯托克斯方程左边为零。也忽略引力势 $\phi$ 的影响，故需解

$$
\frac1\rho\operatorname{grad}p=\frac\eta\rho\nabla^2\mathbf u.\tag{9.84}
$$

取长度 $l$ 的管两端压强差为 $P$，且在管横截面上均匀。需要柱极坐标中径向方向的拉普拉斯算子（见 A5.5 节），故解方程

$$
\frac Pl=\frac\eta\rho\frac1r\frac d{dr}\left(r\frac{du(r)}{dr}\right).\tag{9.85}
$$

对 $r$ 积分两次，得径向速度分布

$$
u(r)=\frac{\rho P}{4\eta l}(a^2-r^2).\tag{9.86}
$$

速度分布为抛物线，管中心速度最大，管壁处为零。通过在管面积分，求得通过管子的体积流率：

$$
\text{体积流率}=\int_0^a2\pi r\,dr\,\frac{\rho P}{4\eta l}(a^2-r^2)=\frac{\pi Pa^4}{8\eta l}.\tag{9.87}
$$

该公式称为泊肃叶定律或哈根,泊肃叶定律。泊肃叶是一位研究血液流经动脉的医师，哈根则是一位水力工程师。该公式为小雷诺数极限下估计流体黏度提供了简单方法。

## 9.6 高黏性流动的斯托克斯公式

斯托克斯关于球在高黏性介质中运动时阻力的著名公式，是流体动力学的经典之一，$f_D=6\pi\eta aU$。它看起来如此简单，而且如第 10.2.3 节将说明的，其形式可由量纲分析导出，但求得公式中的常数需要大量计算。斯托克斯的原始论文篇幅很长，他把此公式用于空气中黏滞阻力对球形摆锤振动的阻尼。[^7] 但它有多种应用，包括密立根著名实验中油滴终端速度的公式，以及沉降。

回忆无黏性时球上没有阻力（第 9.3.4 节）。黏滞摩擦的存在戏剧性地改变了情形。这可由 Thorne 和 Blandford 给出的简单论证看出。[^8] 将说明纳维,斯托克斯方程化为 $\boldsymbol\nabla P=\eta\nabla^2\mathbf u$，其中 $P$ 是球两侧压强差。量级上，压强差为 $P\sim\eta U/a$，故作用在球上的力量级为 $f_D\sim Pa^2\sim\eta Ua$。难题是求此关系中的常数。因此，黏性的效应是在球两侧产生压强差，造成阻力。当黏性为零时无阻力，这与第 9.3.4 节的势流论证一致。

小雷诺数稳态流动极限中，不可压缩流体的纳维,斯托克斯方程 (9.81) 化为

$$
\operatorname{grad}p=\eta\nabla^2\mathbf u,\tag{9.88}
$$

其中略去了远小于黏滞项的惯性项 $(\mathbf u\cdot\operatorname{grad})\mathbf u$，以及引力势项。与纯势流情形一样，当 $r$ 很大时，流动必须以速度 $U$ 均匀。求解须使球面径向速度为零，但现在有与 $r=a$ 处“无滑移”边界条件有关的 $\theta$ 方向圆周分量。这是与势流情形的关键区别，现在 $r=a$ 处流体在圆周方向的速度必须为零，其在表面的导数有限，因而产生黏滞阻力。

这里只概述步骤，不试图推导证明细节。Landau 和 Lifshitz、Faber 以及 Thorne 和 Blandford 的书都投入相当篇幅，仔细考察纳维,斯托克斯方程，以确定哪些量必须保留才能使方程可解并符合边界条件。这些讨论说明即使在这个相对简单问题中所需的近似。注意求解 (9.88) 所采用的不同方法很有意思。

* 最传统的方法或许是斯托克斯自己的论文，他系统地以相当的普遍性和细节着手解决问题。
* Landau 和 Lifshitz 用物理论证确定问题解的形式，特别要求解包含轴矢量或极矢量“量纲上”齐次的组合。
* Faber 采用寻求 (9.88) 的主积分和补函数所构成合适解的标准方法，但也使用物理论证，并采用有依据的试探解来符合边界条件。
* Thorne 和 Blandford 结合所有这些论证来求所需解。

这些计算的结果是球周围速度场的一对方程，形式为

$$
u_r=U\cos\theta\left(1-\frac{3a}{2r}+\frac{a^3}{2r^3}\right),\tag{9.89}
$$
$$
u_\theta=-U\sin\theta\left(1-\frac{3a}{4r}-\frac{a^3}{4r^3}\right),\tag{9.90}
$$

其中 $u_r$ 和 $u_\theta$ 是速度场在径向 $\mathbf i_r$ 和极向 $\mathbf i_\theta$ 的分量。现在可确定球面上作为极坐标函数的过量应力。引用 Faber 给出的球坐标结果。径向上，单位面积力，即作为 $\theta$ 函数的过量压强 $p^*$，为[^9]

$$
p_r^*=p^*-2\eta\left.\frac{\partial u_r}{\partial r}\right|_{r=a}=-\frac{3\eta U\cos\theta}{2a},\tag{9.91}
$$

其中使用 Faber 导出的结果

$$
p^*=-\frac{3}{2r^2}\eta U\cos\theta.\tag{9.92}
$$

平行于球面的单位面积力由应力张量的 $\theta r$ 分量给出，即[^10]

$$
s_{\theta r}=\eta a\left.\left(\frac{\partial(u_\theta/r)}{\partial r}+\frac1{r^2}\frac{\partial u_r}{\partial\theta}\right)\right|_{r=a}=-\frac{3\eta U\sin\theta}{2a}.\tag{9.93}
$$

最后取平行于流动方向的力分量，故阻力 $f_D$ 为

$$
f_D=p_r^*\cos\theta+s_{\theta r}\sin\theta=-\frac{3\eta U}{2a}.\tag{9.94}
$$

值得注意的是，球面上每单位面积的力在整个表面相同，故总阻力为

$$
f_D=4\pi a^2\frac{3\eta U}{2a}=6\pi\eta aU,\tag{9.95}
$$

即著名的斯托克斯定律。流线图样见图 9.13。

**图 9.13**　说明小但有限黏度极限中，不可压缩流体绕固体球流动的流线。应将流线图样与图 9.3 比较。（知识共享署名，相同方式共享 3.0 未本地化许可。）

将此结果与第 9.3.4 节分析的势流比较很有意思。如 Faber 所指出，两者差异很大。其根源在于势流情形的假设，即没有黏性时，流体像超流体一样行为。流动和球之间没有摩擦，故在球面处，流体在 $\mathbf i_\theta$ 方向的速度不受限制。由于此解中流线受挤压，赤道面 $\theta=\pi/2$ 的速度场随 $r$ 增大而降至渐近值 $U$。相反，黏性情形中，该速度在球面为零，随 $r$ 增大而升至渐近值 $U$。解还表明，因 $a/r$ 幂次项随 $r$ 增加缓慢减小，球造成的流动扰动是长程的。换一种思考方式，球周围边界层的尺度与球本身相同，并不局限于狭窄边界区域。

但这仍未解释为什么极小黏性的流体和完全没有黏性的流体之间会有表观行为不连续。如费曼指出，需要考察雷诺数中包含的参数值，$\operatorname{Re}=\rho LU/\eta=LU/\nu$。势流解对应 $\eta=\nu=0$，但实际上黏性仍极小而有限。于是，在尺度 $L\sim\nu/U$ 上，解从势流变为由黏性支配的解。问题的解决在于，黏性决定速度梯度的边界层确实极窄。

## 9.7 涡量、环量和开尔文环量定理

### 9.7.1 涡量

第 9.2.2 节引入的涡量概念 $\boldsymbol\omega=\operatorname{curl}\mathbf u$ 是流体动力学的中心概念，并使人对流体流动性质有物理认识。先考虑图 9.14 所示简单流动的几个涡量例子。

* 情形 (a) 显示流体刚体转动，即流体转动速度为 $\mathbf u=\boldsymbol\Omega\times\mathbf r$，其中 $\boldsymbol\Omega=\Omega_0\mathbf i_z$ 是沿纸面向外 $z$ 方向的恒定角速度矢量。在柱极坐标 $(r,\phi,z)$ 中，$\mathbf u=(0,\Omega_0r,0)$，用附录 5.2.2 给出的 $\boldsymbol\nabla\times\mathbf u$ 表达式，得

$$
\boldsymbol\omega=\boldsymbol\nabla\times\mathbf u=\frac1r\frac{\partial(\Omega_0r^2)}{\partial r}\mathbf i_z=2\Omega_0\mathbf i_z,\tag{9.96}
$$

即涡量是流动角速度的两倍。

* 情形 (b) 说明圆柱流，其中单位质量角动量 $j$ 随半径保持不变，$\mathbf j=\mathbf r\times\mathbf u=|\mathbf r||\mathbf u|\mathbf i_z=\text{constant}$。速度矢量为 $\mathbf u=(0,j/r,0)$，故涡量为

$$
\boldsymbol\omega=\boldsymbol\nabla\times\mathbf u=\frac1r\frac{\partial j}{\partial r}\mathbf i_z=0.\tag{9.97}
$$

这是水流入排水孔和龙卷风所关联的流动类型。尽管这看似是清楚的涡旋流，涡量为零，除 $r=0$ 外，那里速度发散至无穷大。涡量为零的原因是，若两个流体元在圆周方向相距 $x$，其角速度为 $+j/x^2$。若流体元在径向相距 $x$，其角速度为 $-j/x^2$。这两个角运动彼此抵消。然而，若积分沿包含涡核的闭合回路进行，环量为 $2\pi j$，如下文所见。

* 情形 (c) 显示层流（第 9.5 节），对应于 (a) 中讨论的刚体转动的一维变体。此时 $v_x\propto y$，在笛卡儿坐标中对速度取旋度，$\boldsymbol\omega=-(v_x/y)\mathbf i_z$。因此，尽管流动是层流，它仍有有限涡量。我们可把它想象为与随流动运动的矢量转动有关，这一转动由 $y$ 方向微分速度场引起。因此，流动无须有“转动”也能有有限涡量。

**图 9.14**　二维流动中涡量的示例。(a) 恒定角速度，$\Omega$ 与半径 $r$ 无关。(b) 单位质量角动量恒定，$\mathbf u\times\mathbf r=\text{constant}$。(c) 层流剪切流，$u_x=ay$，如图 9.10。（据 K. S. Thorne 和 R. D. Blandford，2017，*Modern Classical Physics*，第 732 页。普林斯顿，新泽西州：Princeton University Press。）

### 9.7.2 环量

接下来引入流动环量 $\Gamma$ 的概念，定义为流体中闭合曲线 $C$ 周围速度 $\mathbf u$ 的线积分：

$$
\Gamma=\oint_C\mathbf u\cdot d\mathbf l.\tag{9.98}
$$

其中 $d\mathbf l$ 是闭合回路长度元。用斯托克斯定理（第 A5.1 节），可将此定义转化为涡量穿过曲面 $S$ 的通量的面积分：

$$
\Gamma=\int_S\boldsymbol\omega\cdot d\mathbf A.\tag{9.99}
$$

现在可重访上文情形 (b)，确定微分转动流体的环量，但现在积分绕涡核进行。半径 $r$ 圆柱周围的圆周速度 $u_\phi=j/r$。因此，

$$
\Gamma=\oint_C\mathbf u\cdot d\mathbf l=2\pi ru_\phi=2\pi j,\tag{9.100}
$$

其中 $j$ 是单位质量角动量，在此例中取为常数。形式上，当 $r\to0$ 时涡量发散，但事实上在足够小、不能忽略黏性的尺度，旋转流体有有限尺度的核心，导致该区域涡量为有限值。

### 9.7.3 涡线

现在引入涡线概念。回忆用涡量 $\boldsymbol\omega$ 描述流体流动的三个表达式：

$$
\boldsymbol\nabla\cdot\mathbf u=0,\tag{9.101}
$$
$$
\boldsymbol\omega=\boldsymbol\nabla\times\mathbf u,\tag{9.102}
$$
$$
\frac{\partial\boldsymbol\omega}{\partial t}=\boldsymbol\nabla\times(\mathbf u\times\boldsymbol\omega),\tag{9.103}
$$

它们适用于零黏度不可压缩流动。所谓涡线，是追踪流动中涡量矢量的场线。涡线方向由 $\boldsymbol\omega$ 的方向给出，涡量大小由单位面积上垂直于 $\boldsymbol\omega$ 的涡线数密度给出。必须区分涡线和流线，后者使我们可视化速度分布 $\mathbf u$。具体说，与涡量有关的流线 $\mathbf u$ 总是垂直于 $\boldsymbol\omega$，如第 9.7.1 节例子所示。与磁场的类比特别有帮助。对 (9.101) 取旋度，$\operatorname{div}\boldsymbol\omega=0$，故在此情形，涡线类似于自由空间中磁通密度线，后者满足 $\operatorname{div}\mathbf B=0$。

与完全电离等离子体中磁通密度线动力学的类比引人注目。在该情形，磁通密度场 $\mathbf B$ 的动力学行为方程为

$$
\frac{\partial\mathbf B}{\partial t}=\boldsymbol\nabla\times(\mathbf v\times\mathbf B)+\frac1{\sigma\mu_0}\nabla^2\mathbf B.\tag{9.104}
$$

此方程形式与 (9.83) 相同，十分显著。对于电导率 $\sigma$ 无限大的完全电离等离子体，(9.104) 最后一项为零。如我的书 *High Energy Astrophysics* 第 11.2 节详细讨论，方程 (9.104) 导致磁通冻结概念，磁力线随等离子体运动而“冻结”在其中。[^11] 磁力线跟随等离子体中的运动。流体中的涡线也发生完全相同的现象。没有与黏性有关的扩散项时，涡线冻结在流体中并随之运动。

### 9.7.4 开尔文环量定理

给出该定理的流体动力学证明。依照 Lautrup，最简单的是在拉格朗日坐标中工作，导数在跟随流动的参考系中取得。具体而言，$C$ 是随流体共动的闭合曲线。目标是表明环量遵循规则

$$
\frac{d\Gamma}{dt}=\frac{d\Gamma(C(t),t)}{dt}=0.\tag{9.105}
$$

换言之，尽管轮廓 $C$ 被流体拖曳并扭曲，环量 $\Gamma$ 保持不变。

在小时间间隔 $\delta t$ 内，环量变化为

$$
\delta\Gamma(C(t),t)=\Gamma(C(t+\delta t),t+\delta t)-\Gamma(C(t),t),\tag{9.106}
$$
$$
=\oint_{C(t+\delta t)}\mathbf u(\mathbf r',t+\delta t)\cdot d\mathbf l'-\oint_{C(t)}\mathbf u(\mathbf r,t)\cdot d\mathbf l.\tag{9.107}
$$

现在用变换 $\mathbf r'=\mathbf r+\mathbf u(\mathbf r,t)\delta t$ 将曲线 $C(t)$ 映射到 $C(t+\delta t)$。对速度矢量 $\mathbf u$ 的三个分量应用 (9.5)，随流动运动的线元变为 $d\mathbf l'=d\mathbf l+(d\mathbf l\cdot\boldsymbol\nabla)\mathbf u\,\delta t$：

$$
\delta\Gamma(C(t),t)=\oint_{C(t)}\mathbf u(\mathbf r+\mathbf u(\mathbf r,t)\delta t,t+\delta t)\cdot[d\mathbf l+(d\mathbf l\cdot\boldsymbol\nabla)\mathbf u\,\delta t]-\oint_{C(t)}\mathbf u(\mathbf r,t)\cdot d\mathbf l.\tag{9.108}
$$

展开至 $\delta t$ 一阶，并回忆计算在共动系中进行，得

$$
\delta\Gamma(C(t),t)=\delta t\oint_{C(t)}\frac{d\mathbf u}{dt}\cdot d\mathbf l+\delta t\oint_{C(t)}\mathbf u\cdot(d\mathbf l\cdot\boldsymbol\nabla)\mathbf u.\tag{9.109}
$$

现在用 (9.21) 形式的欧拉定理替换 $\mathbf u$ 的全导数，并将第二项改写为较透明的形式：

$$
\delta\Gamma(C(t),t)=\delta t\oint_{C(t)}\left(-\boldsymbol\nabla\phi-\frac{\boldsymbol\nabla p}{\rho}\right)\cdot d\mathbf l+\delta t\oint_{C(t)}\frac12\boldsymbol\nabla u^2\cdot d\mathbf l,\tag{9.110}
$$
$$
=\delta t\oint_{C(t)}\left(-\boldsymbol\nabla\phi-\boldsymbol\nabla\frac p\rho+\frac12\boldsymbol\nabla u^2\right)\cdot d\mathbf l\tag{9.111}
$$
$$
=0.\tag{9.112}
$$

最后一行成立，因为 (9.111) 积分内所有三项现在都是梯度场，故其沿闭合回路的积分为零，证明了开尔文环量定理。

### 9.7.5 开尔文环量定理的应用

开尔文环量定理是理解流体动力学现象的有力工具。基本结果见图 9.15，其中显示一个被流体拖曳的涡管。涡管内实线和虚线是涡线，表示涡量矢量 $\boldsymbol\omega$ 演化的方向和大小。椭圆显示流体运动的流线，正如预期，它们总是垂直于涡量矢量。点线显示流体粒子的运动，由此可见涡线仿佛“冻结在流体中”一样运动。因此，在亚声速运动和没有黏性效应的约束下，涡管是流体流动中的稳定结构。

**图 9.15**　说明在无黏性不可压缩流体流动中“冻结”的涡管运动。实线和虚线竖线是定义涡管的涡线。点线显示流体粒子运动。椭圆实线显示涡管周围速度场的流线。

自然界中这些现象最熟悉的例子或许是龙卷风，它们是大气中稳定的涡管，可以长途行进而不失形态，并在路径上造成严重破坏。另一个例子是图 9.16 概略显示的烟圈稳定性。该环是闭合环面涡管，虚线表示涡线，椭圆实线表示烟圈物质的速度矢量。开尔文定理再次说明烟圈稳定性。最后，在流体黏度为零的超流体流动中，涡管是很稳定的结构，例如在中子星内部物理中起关键作用。

最终，这些结构会被完整纳维,斯托克斯方程 (6.81) 中项 $\eta\nabla^2\boldsymbol\omega$ 所示的黏性效应阻尼。该项使涡线扩散并通过摩擦耗散。

**图 9.16**　说明烟圈的流体动力学结构。实椭圆表示流体流动的流线。点线是与烟圈环面结构有关的涡线。

### 9.7.6 涡管和磁通管的类比

第 5.3 节已经讨论过这些流体动力学现象在十九世纪对电磁学理解的深远影响。由方程 (9.83) 和 (9.104) 的比较可见，类比对应于磁通密度矢量 $\mathbf B$ 和涡量矢量 $\boldsymbol\omega$：

$$
\text{涡量：}\qquad\frac{\partial\boldsymbol\omega}{\partial t}=\boldsymbol\nabla\times(\mathbf u\times\boldsymbol\omega)+\frac\eta\rho\nabla^2\boldsymbol\omega,
$$
$$
\text{磁通密度：}\qquad\frac{\partial\mathbf B}{\partial t}=\boldsymbol\nabla\times(\mathbf v\times\mathbf B)+\frac1{\sigma\mu_0}\nabla^2\mathbf B.
$$

注意，提供流体流动和磁学类比的是涡线而非流线。这些类比对 William Thomson，后来的 Lord Kelvin，和 Maxwell 制定电磁场理论非常重要。

Kelvin 和 Maxwell 采用涡旋模型解释原子和分子的稳定性，这很有意思。十九世纪中叶还没有能够决定原子大小的自然基本常数，普朗克常数 $h$ 直到 1900 年才出现。他们的思考基于这样的想法：原子可能是无摩擦以太中的稳定涡旋，以太被假定为电磁现象传播的介质。Maxwell 用此图像建立三原子分子模型，其中三个涡旋代表分子的三个原子，彼此做稳定运动。为制作该模型的“活动图像”，Maxwell 制作了一条有十二幅图像的西洋镜带，显示相互穿透的涡旋沿彼此周围的稳定轨迹运动（图 9.17）。

**图 9.17**　Maxwell 的三原子分子模型，由以太中三个无摩擦相互作用的涡旋组成。这是 Maxwell 画作西洋镜带的十二幅图像中的四幅，以说明它们彼此周围的稳定运动。（剑桥大学卡文迪许实验室惠赠。）

## 9.8 结语

本章对流体流动方程相关的一些较为显著现象作了简要介绍，意在说明流体动力学的微妙性、复杂性和极广的适用范围。我们仅触及这一主题的表面，它对日常生活具有至关重要的实际意义，例如鸟类和飞机飞行、大气物理、气象学和海洋学，仅举几项显而易见的应用。本章不宜更深入讨论诸如流动稳定性、温度效应，温度效应例如导致通过对流的能量输运，以及边界层物理等现象。Faber 的 *Fluid Dynamics for Physicists* 为这些主题提供了极好的导论。[^4] 第 10 章考察一些高度非线性的流体流动例子时，将回到其中一些主题。

## 注释

[^1]: Batchelor, G. K. (1967). *An Introduction to Fluid Dynamics*. Cambridge: Cambridge University Press.
[^2]: Landau, L. D. and Lifshitz, E. M. (1959). *Fluid Mechanics*, Vol. 5 of *Course of Theoretical Physics*. Oxford: Pergamon Press.
[^3]: Feynman, R. P. (1964). *The Feynman Lectures on Physics*, Vol. 2, eds. R. Feynman, R. B. Leighton and M. L. Sands. Redwood City, California: Addison-Wesley Publishing Company.
[^4]: Faber, T. E. (1995). *Fluid Dynamics for Physicists*. Cambridge: Cambridge University Press.
[^5]: 注意，例如在地球引力场中，引力势为负量，且随高度增加而变得较不负，这就是可以写 $\phi=gz$ 的原因。
[^6]: Faber 的书第 6 章（前引书）仔细阐述了纳维,斯托克斯方程中看似无害的项 $(\eta/\rho)\nabla^2\mathbf u$ 背后的微妙之处。
[^7]: G. G. Stokes (1851). “On the Effect of the Internal Friction of Fluids on the Motion of Pendulums,” *Transactions of the Cambridge Philosophical Society*, 9, 8–106.

</div>
