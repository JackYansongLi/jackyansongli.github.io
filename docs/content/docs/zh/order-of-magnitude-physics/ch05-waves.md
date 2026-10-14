---
title: 第 5 章：波
description: 《数量级物理学》中文译文。
prev: false
next: false
head:
  - tag: script
    attrs:
      type: module
      src: /scripts/moldflow-reading-gate.js
---

<div data-moldflow-protected-content>

## 5 波

海洋覆盖地球大部分表面，波浪遍布海洋大部分区域。是什么使波移动，又是什么决定其速度？本章研究水波，并运用、扩展近似技术来回答这些问题。本章主题是：**考虑极限情形。**

### 5.1 色散关系

我们用色散关系研究波。色散关系给出波可具有的频率和波长；关于色散关系可参见 Crawford 的著作 [5]。其通常形式连接角频率 $\omega$ 和波数 $k$。波数定义为 $2\pi/\lambda$，其中 $\lambda$ 是波长。例如，真空中电磁波满足 $\omega=ck$，即波以 $\omega/k=c$ 的速度传播，与频率无关。色散关系蕴含大量波的信息：它给出波峰、波谷移动多快（相速度），波包移动多快（群速度），这些速度怎样依赖频率（色散），以及能量损失率（衰减）。

通常需解令人不快的偏微分方程——波动方程——才能得到色散关系。对水波，须线性化流体力学的欧拉方程，特别是边界条件很棘手。我们既急躁又懒惰，改用量纲分析推导色散关系，再用物理论证补全它。粗略方法不能求无量纲常数，但研究波的妙处在于它们常常为 1。

怎样连接频率和波数？它们的量纲分别为 $[T]^{-1}$ 与 $[L]^{-1}$，须加入具有各种量纲的变量。于是考察决定波行为的物理性质。开放海洋波浪和浴缸波浪不同，想必由于水深不同，记为 $h$。浴缸或海洋宽度也可能重要，但忽略它，只研究垂直于宽度的一维波。

为确定其他重要变量，采用“波像弹簧”的原则，因为每个物理过程都包含弹簧。这并非严格正确，却是有用的概括。弹簧有平衡位置；若系统有静止的未扰动状态，就应寻找弹簧。海洋的未扰动状态是平静海面；电磁波的静止状态是无辐射的真空。弹簧还会振荡：机械系统中，惯性使质量越过平衡点；等价地，动能和势能相互转换。水波将势能储存在表面扰动中，将动能储存在水的运动中。电磁波的能量则在电场和磁场间荡漾；磁场由运动电荷产生，是动能库，电场由静止电荷产生，是势能库。因此电磁场是每个频率各有一个的弹簧组。反例是第 2.3.2 节研究的、在玉米糖浆中缓慢下沉的弹珠：糖浆动能及其惯性微不足道，系统没有动能库，也就没有弹簧。

水面最低能量状态为水平；偏离平面即波，会受到回复力。真实弹簧的回复力来自原子间键。知道弹簧常数的来源后便可计算它，再计算振荡频率。表面变形像拉伸橡皮膜，水的表面张力反抗这种变形；变形也须抬高平均水位，重力反抗此变化。因此回复力是重力与表面张力的结合，变量表中应有表面张力 $\gamma$ 与重力 $g$。第 5.2.1 节的简单模型将说明二者如何恢复水位。

波中回复力与惯性抗衡，惯性在这里由流体密度 $\rho$ 表示。重力不在乎密度：更密物质受更强引力，恰被更大惯性抵消。这一精确抵消重述了爱因斯坦广义相对论所依据的等效原理；第 2.2 节摆的解中摆锤质量消失，也是同一原因。表面张力却不随密度成比例增强，故预期由表面张力提供回复力的波受 $\rho$ 决定。以下常称水波，但结果适用于任何流体。假定波无损失，排除黏性；也排除介质声速 $c_s$，因而忽略声波。还假定振幅 $\xi$ 比波长和水深小，只研究小振幅波。表 5.1 列出变量。

| 变量 | 量纲 | 描述 |
| --- | --- | --- |
| $\omega$ | $[T]^{-1}$ | 角频率 |
| $k$ | $[L]^{-1}$ | 波数 |
| $g$ | $[L][T]^{-2}$ | 重力加速度 |
| $h$ | $[L]$ | 水深 |
| $\rho$ | $[M][L]^{-3}$ | 密度 |
| $\gamma$ | $[M][T]^{-2}$ | 表面张力 |

**表 5.1**　决定水波行为的变量。

六个变量有三个基本量纲，故寻找 $6-3=3$ 个无量纲群。$k$ 是逆长度，$h$ 是长度，故

$$\Pi_1\equiv kh.\tag{5.1}$$

这是无量纲水深：$\Pi_1\ll1$ 是浅水，$\Pi_1\gg1$ 是深水。第二群来自重力；$g$ 的单位除一个长度因子外与 $\omega^2$ 相同，波数补足此差：

$$\Pi_2=\frac{\omega^2}{gk}.\tag{5.2}$$

此群不含密度。若排除表面张力，只有 $\Pi_1,\Pi_2$；重力单独使波传播，等效原理说明密度不可能出现。第三群应含表面张力，并衡量重力和表面张力的相对重要性。$\gamma$ 是单位长度的力，$\rho g$ 是单位体积的力，故 $\gamma/\rho g$ 有长度平方单位，以两个 $k$ 中和：

$$\Pi_3\equiv\frac{\gamma k^2}{\rho g}.\tag{5.3}$$

也可取 $\gamma k^3/\rho\omega^2$；无量纲群的选择很多。这里的选择突出重力，方便研究多数海洋中的重力回复波。

我们要求 $\omega(k)$。仅 $\Pi_2$ 含 $\omega$，故最一般的无量纲关系为

$$\Pi_2=f(\Pi_1,\Pi_3),\tag{5.4}$$

即

$$\frac{\omega^2}{gk}=f\left(kh,\frac{\gamma k^2}{\rho g}\right).\tag{5.5}$$

解出 $\omega^2$：

$$\omega^2=gk\,f\left(kh,\frac{\gamma k^2}{\rho g}\right).\tag{5.6}$$

此式适用于深浅水、表面张力或重力主导，以及中间情况。**图 5.1**　波的世界地图。无量纲群 $\Pi_1$ 和 $\Pi_3$ 将世界分为四区；$\Pi_1=kh$ 衡量水深（是水洼还是海洋），$\Pi_3=\gamma k^2/\rho g$ 衡量表面张力与重力的相对贡献（是涟漪还是重力波）。$\Pi_1$ 划分深浅水；$\Pi_3$ 的划分更微妙：大 $g$ 或小 $k$ 都使 $\Pi_3$ 小，故长波如强重力，属于重力波；大 $\Pi_3$ 区属于表面张力波。

<img src="/images/order-of-magnitude-physics/fig-5-1.png" alt="图 5.1：原书扫描页" loading="lazy" decoding="async" />

**图 5.2**　地球上的水波。以熟悉的水深和波长为坐标，粗分界线依据 $\Pi_1=hk$ 与 $\Pi_3=\gamma k^2/\rho g$；每区列有一两个例子。取 $g=1000\ \mathrm{cm\ s^{-2}}$、$\rho\sim1\ \mathrm{g\ cm^{-3}}$，涟漪与重力波的边界波长略大于 $1\ \mathrm{cm}$。

<img src="/images/order-of-magnitude-physics/fig-5-2.png" alt="图 5.2：原书扫描页" loading="lazy" decoding="async" />

尚不知魔术函数 $f$ 在任何区域的形式。为找出它，建立简单物理模型并研究极限情形。像拼图者先做物理最简单的角，再沿边连接，最后进入内部。本章是分而治之的大例子，极限情形便是拼块。

### 5.2 深水

先研究 $kh\gg1$ 的深水（图 5.3 阴影区域）。深水意指波感受不到海底。波的“触角”伸多深？波内唯一长度标度是 $\lambda=2\pi/k$，故预计深度 $d\sim1/k$（照例忽略 $2\pi$）。可由拉普拉斯方程验证。设波在 $x$ 方向周期性，$z$ 是表面下深度（图 5.4），则

<img src="/images/order-of-magnitude-physics/fig-5-4.png" alt="图 5.4：原书扫描页" loading="lazy" decoding="async" />

<img src="/images/order-of-magnitude-physics/fig-5-3.png" alt="图 5.3：原书扫描页" loading="lazy" decoding="async" />

$$\frac{\partial^2\phi}{\partial x^2}+\frac{\partial^2\phi}{\partial z^2}=0,\tag{5.7}$$

其中 $\phi$ 是速度势；它具体为何并不重要，只须知道它衡量波效应、$\phi=0$ 处无波，且满足拉普拉斯方程。波形如 $\sin kx$，取

$$\phi\sim Z(z)\sin kx.\tag{5.8}$$

$Z(z)$ 衡量波随深度衰减。$x$ 的二阶导数带来两个 $k$ 和负号：

$$\frac{\partial^2\phi}{\partial x^2}=-k^2\phi.\tag{5.9}$$

故 $z$ 项须给出 $+k^2\phi$：

$$\frac{\partial^2\phi}{\partial z^2}=k^2\phi,\tag{5.10}$$

从而 $Z(z)\sim e^{\pm kz}$。海底处不指数爆炸的物理解为 $Z(z)\sim e^{-kz}$，海底相对表面的效应为 $\sim e^{-kh}$；当 $kh\gg1$，海底仿佛在月球上。无量纲因子 $kh$ 比较水深与触角深度：

$$\frac{\text{水深}}{\text{触角深度}}\sim\frac{h}{1/k}=hk.\tag{5.11}$$

**图 5.3**　波的深水部分。**图 5.4**　无限长波的一段。正弦剖面的波长为 $\lambda$；水深为 $h$；研究 $y$ 方向宽度 $w$。

深水中 $h$ 不影响传播，故从变量表及 $\Pi_1$ 中消失（$k$ 仍在 $\Pi_3$ 中）。所谓 $h$ 大本身无意义，必须问相对哪个长度大；拉普拉斯方程说明标准为 $1/k$，即 $kh$ 大。数学上即假定 (5.6) 的 $f$ 在 $kh\to\infty$ 有极限：

$$\omega^2=gk f_{\rm deep}\left(\frac{\gamma k^2}{\rho g}\right).\tag{5.12}$$

深水边有两个角：重力或表面张力提供回复力。

#### 5.2.1 深水上的重力波

现在专门考察水深、重力强的图 5.5 区域，包括多数风生波和船尾波。$\gamma k^2/\rho g\to0$，故

<img src="/images/order-of-magnitude-physics/fig-5-5.png" alt="图 5.5：原书扫描页" loading="lazy" decoding="async" />

$$\omega^2=f_{\rm deep}(0)gk=C_1gk.\tag{5.13}$$

懒惰方法不能给出 $C_1$，通常取 1；幸运的是精确计算也给 $C_1=1$：

$$\omega^2=gk.\tag{5.14}$$

**图 5.5**　波的世界中深水—重力波部分。

为理解而非魔术般接受此式，追随水的运动。波峰的水并不流入波谷；较高波峰在其下方造成比波谷更高的压力，迫使水由波峰下流向波谷，抬高波谷，表面像秋千越过平衡位置般产生新波峰并循环。**图 5.6**　波峰下的较高压力。波峰比波谷高约振幅 $\xi$，故压力差约 $\Delta p\sim\rho\xi g$，使水由波峰下流向波谷，波遂前进。

<img src="/images/order-of-magnitude-physics/fig-5-6.png" alt="图 5.6：原书扫描页" loading="lazy" decoding="async" />

以矩形近似取代速度随深度的复杂衰减：水到某深度整体运动，以下静止（图 5.7）。拉普拉斯方程说明压力变化尺度为 $1/k$，故板块深度为 $1/k$；其波峰到波谷的长度亦为 $1/k$（实际为 $\pi/k$），宽度 $w$ 任意，最终会消失。压力差 $\Delta p\sim\rho g\xi$ 作用于面积 $A\sim w/k$，产生

<img src="/images/order-of-magnitude-physics/fig-5-7.png" alt="图 5.7：原书扫描页" loading="lazy" decoding="async" />

$$F\sim\frac wk\rho g\xi=\frac{\rho gw\xi}{k}.\tag{5.15}$$

板块质量为

$$m=\rho\times\frac{w}{k^2}.\tag{5.16}$$

故加速度为

$$a_{\rm slab}\sim\frac{\rho gw\xi/k}{\rho w/k^2}=g\xi k.\tag{5.17}$$

重力加速度被近似波面斜率的无量纲因子 $\xi k$ 减小。板块移动距离 $x$ 扫过体积 $xA$，在波谷下推表面上升 $V/A_{\rm top}$；$A_{\rm top}\sim A\sim w/k$，故表面与板块移动相同距离，因而

$$a\sim a_{\rm slab}\sim g\xi k.\tag{5.18}$$

浅水时海底会在 $1/k$ 前截断板块，此等价不再成立。简谐运动中 $a\sim\omega^2\xi$；波亦然，故

$$\omega^2\xi\sim g\xi k,\tag{5.19}$$

即

$$\omega^2\sim gk.\tag{5.20}$$

**图 5.7**　水板块。波峰下（左）压力高于波谷方向（右）；阴影端面面积 $A\sim w/k$，额外压力 $\Delta p\sim\rho\xi g$，故 $F\sim\rho w\xi g/k$。板块质量 $m\sim\rho w/k^2$，可据此计算加速度和动能。

亦可由能量推导。**图 5.8**　造波所需能量。阴影水块必须抬高约 $\xi$；实际水并不由波谷移至波峰，但这个方便图像不改变能量计算。上移体积为 $\xi w/k$，势能为

<img src="/images/order-of-magnitude-physics/fig-5-8.png" alt="图 5.8：原书扫描页" loading="lazy" decoding="async" />

$$PE_{\rm gravity}\sim\frac{\rho\xi w}{k}g\xi\sim\frac{\rho gw\xi^2}{k}.\tag{5.21}$$

板块与表面速度近似相同，横向和向上运动能量相近；忽略常数，只算横向。表面在 $1/\omega$ 内移动 $\xi$，速度为 $\omega\xi$，故

$$KE_{\rm deep}\sim\frac{\rho w}{k^2}\omega^2\xi^2\sim\frac{\rho\omega^2\xi^2w}{k^2}.\tag{5.22}$$

平衡 (5.21)：

$$\frac{\rho\omega^2\xi^2w}{k^2}\sim\frac{\rho gw\xi^2}{k},\tag{5.23}$$

约去 $\rho w\xi^2$，再次得到

$$\omega^2\sim gk.\tag{5.24}$$

能量法与力法一致。它给出 $\Pi_2$ 的意义：

$$\Pi_2\sim\frac{\text{板块动能}}{\text{重力势能}}\sim\frac{\omega^2}{gk}.\tag{5.25}$$

因此 $\omega^2=gk$ 等价于 $\Pi_2\sim1$，即动能与重力势能可比；对像弹簧的波并不意外。三种推导（量纲、力、能量）相互增加了对结论和方法的信心。

波峰以 $v_{\rm ph}=\omega/k$ 移动。深水重力波中

$$v_{\rm ph}=\sqrt{\frac gk},\tag{5.26}$$

或用 $\omega$ 代 $k$：

$$v_{\rm ph}=\frac g\omega.\tag{5.27}$$

无限单频波列的峰谷以此速度移动；有限波列含混合频率，各频率速度不同，深水有色散。波包以 $v_g=\partial\omega/\partial k$ 移动，波峰在包络下缩长以适应它：

$$v_g=\frac{\partial\sqrt{gk}}{\partial k}=\frac12\sqrt{\frac gk}=\frac12v_{\rm ph}.\tag{5.28}$$

群速度为相速度一半，故船尾波拖在船后：船速 $v$ 产生 $v_{\rm ph}=v$ 的重力波，波包却以半个船速前进，在船看来向后行，且形成开角取决于 $1/2$ 的楔形。

##### 5.2.1.1 冲浪

洛杉矶一次冬季风暴后，海浪约每 18 秒到达。风推动比它慢的波峰；推得足够久后波峰速度近似风速。由 (5.27)，$v_{\rm ph}=gT/2\pi$：

$$v_{\rm wind}\sim v_{\rm ph}\sim\frac{10\ \mathrm{m\ s^{-2}}\times18\ \mathrm{s}}{2\times3}\sim30\ \mathrm{m\ s^{-1}}.\tag{5.29}$$

约为 $60\ \mathrm{mph}$ 的强风。波长为

$$\lambda=v_{\rm ph}T\sim30\ \mathrm{m\ s^{-1}}\times18\ \mathrm{s}\sim500\ \mathrm{m}.\tag{5.30}$$

波峰相距半千米；近岸时感到海底而拥挤，源自第 5.3.1 节浅水色散关系。次日波间隔为 17 秒。应先检验此周期变短是否合理：群速度正比于 $1/\omega$，即正比于周期，故长周期 18 秒波更快，应先到，事实如此。可由间隔下降推出风暴距离：18 秒波在长途中领先 1 天，速度比为

$$\frac{\text{速度（18 秒波）}}{\text{速度（17 秒波）}}=\frac{18}{17}=1+\frac1{17}.\tag{5.31}$$

故赛跑约持续 $t\sim17$ 天 $\sim1.5\cdot10^6\ \mathrm{s}$。波包以 $v_g=v_{\rm ph}/2\sim15\ \mathrm{m\ s^{-1}}$ 移动，风暴距 $d\sim tv_g\sim2\cdot10^4\ \mathrm{km}$，约半个地球！**图 5.9**　实际世界（粗略地图）。近南极风暴产生向外传播的波，一些抵达洛杉矶，使冲浪者和教材作者欢喜。

<img src="/images/order-of-magnitude-physics/fig-5-9.png" alt="图 5.9：原书扫描页" loading="lazy" decoding="async" />

##### 5.2.1.2 快艇

下一应用是快艇：船最快多快？排除滑行艇。长船通常比短船快，故船长 $l$ 可能决定极限速度。仅从 $v,\rho,l$ 无法组成无量纲群，须加变量。黏性无关：即使 5 m 小船以 $2\ \mathrm{m\ s^{-1}}$ 缓行，

$$\mathrm{Re}\sim\frac{500\ \mathrm{cm}\times200\ \mathrm{cm\ s^{-1}}}{10^{-2}\ \mathrm{cm^2\ s^{-1}}}\sim10^7.\tag{5.32}$$

雷诺数巨大，流动湍流且不依赖黏性；表面张力也无关，船远长于约 1 cm 的涟漪。重力也许相关。由 $v,\rho,g,l$ 可组成弗劳德数：

$$\mathrm{Fr}\equiv\frac{v^2}{gl}.\tag{5.33}$$

临界弗劳德数是决定最大船速的无量纲常数，照例取 1：

$$v\sim\sqrt{gl}.\tag{5.34}$$

机制是船产生船首重力波并骑在其上，$v_{\rm ph}\sim v_{\rm boat}$。因 $v_{\rm ph}^2=\omega^2/k^2$，

$$v_{\rm boat}^2\sim\frac{\omega^2}{k^2}=\frac gk=g\bar\lambda,\tag{5.35}$$

其中 $\bar\lambda=1/k=\lambda/2\pi$。因此波长约 $v_{\rm boat}^2/g$，并可解释

$$\mathrm{Fr}=\frac{v_{\rm boat}^2/g}{l}\sim\frac{\text{船首波波长}}{\text{船长}}.\tag{5.36}$$

当 $\mathrm{Fr}\sim1$，船长与 $\bar\lambda$ 可比，船骑在自己的波上而上翘，向水呈现大截面，阻力巨大，故

$$v_{\rm boat}\sim\sqrt{gl}.\tag{5.37}$$

5 m 小快艇约为 $7\ \mathrm{m\ s^{-1}}$ 或 15 mph；可更快，但须大量功率抗阻。双体船和水翼船掠过水面，故这种阻力不限制它们。弗劳德数还决定动物从走路变为小跑或跑步的速度；它近似动能与势能之比：

$$\mathrm{Fr}=\frac{v^2}{gl}=\frac{mv^2}{mgl}\sim\frac{\text{动能}}{\text{势能}}.\tag{5.38}$$

人腿长 $l\sim1\ \mathrm m$ 时，$\mathrm{Fr}\sim1$ 给 $v\sim3\ \mathrm{m\ s^{-1}}$，约 6 mph，粗略为竞走速度上限。

#### 5.2.2 深水涟漪

短波长（大 $k$）时表面张力提供回复力（图 5.10）。最终色散关系中 $g$ 应消失；不能直接丢弃 $\Pi_3$，否则也丢了决定回复力的 $\gamma$。深水式 (5.12) 前有一个 $g$，函数自变量分母中也有一个 $g$，取 $f_{\rm deep}(x)\sim x$ 便抵消它，得 $\omega^2\sim\gamma k^3/\rho$。幸运地，常数仍是 1：

<img src="/images/order-of-magnitude-physics/fig-5-10.png" alt="图 5.10：原书扫描页" loading="lazy" decoding="async" />

$$\omega^2=\frac{\gamma k^3}{\rho}.\tag{5.39}$$

**图 5.10**　波的世界中深水—涟漪部分。

用水板块能量论证：表面像橡皮膜，波拉伸它、增加面积。振幅 $\xi$、波数 $k$ 的正弦波典型斜率为 $\xi k$。不积分弧长，而以同样典型斜率的直线近似（图 5.11）；相对水平线，其长度因子为 $1+(\xi k)^2$。取 $x$ 向特征长度 $1/k$、宽 $w$，额外面积为

<img src="/images/order-of-magnitude-physics/fig-5-11.png" alt="图 5.11：原书扫描页" loading="lazy" decoding="async" />

$$\Delta A\sim\frac wk(\xi k)^2\sim w\xi^2k.\tag{5.40}$$

故势能为

$$PE_{\rm ripple}\sim\gamma\Delta A\sim\gamma w\xi^2k.\tag{5.41}$$

动能仍为

$$KE\sim\frac{\rho\omega^2\xi^2w}{k^2}.\tag{5.42}$$

平衡二者：

$$\frac{\rho\omega^2\xi^2w}{k^2}\sim\gamma w\xi^2k,\tag{5.43}$$

所以

$$\omega^2\sim\frac{\gamma k^3}{\rho}.\tag{5.44}$$

**图 5.11**　用直线近似正弦波。为求造波所需的额外表面积，本想求正弦波弧长，却懒得积分；以同样特征斜率的直线替代。正弦波典型斜率为 $\xi k$：在约 1 弧度、即 $1/k$ 长度内上升 $\xi$。小斜率时斜边长约 $l_0[1+(\xi k)^2]$。

$\Pi_3$ 现可精确解释为两类势能之比：

$$\Pi_3\sim\frac{\text{涟漪势能}}{\text{重力波势能}}\sim\frac{\gamma w\xi^2k}{\rho gw\xi^2/k}\sim\frac{\gamma k^2}{\rho g}.\tag{5.45}$$

等价地，

$$\Pi_3\equiv\frac{\gamma k^2/\rho}{g}.\tag{5.46}$$

这提示表面张力像强度为

$$g_{\rm surface\ tension}=\frac{\gamma k^2}{\rho}\tag{5.47}$$

的有效重力场。气球的橡胶表面张力使内压高于外压；同理，波峰下弯曲的水皮压力较高，波谷下较低。将重力波势能中的 $g$ 换为有效 $g$，便有

$$\frac{\rho gw\xi^2}{k}\ \xRightarrow{g\to\gamma k^2/\rho}\ \gamma w\xi^2k.\tag{5.48}$$

对 (5.14) 作同样替换：

$$\omega^2=gk\ \xRightarrow{g\to\gamma k^2/\rho}\ \omega^2=\frac{\gamma k^3}{\rho}.\tag{5.49}$$

相速度和群速度为

$$v_{\rm ph}\equiv\frac\omega k=\sqrt{\frac{\gamma k}{\rho}},\tag{5.50}$$

$$v_g\equiv\frac{\partial\omega}{\partial k}=\frac32v_{\rm ph}.\tag{5.51}$$

故涟漪波包比波峰快，领先于船；重力波则拖后。典型 $\lambda\sim1\ \mathrm{cm}$ 涟漪有 $k\sim6\ \mathrm{cm^{-1}}$、$\gamma\sim72\ \mathrm{erg\ cm^{-2}}$，

$$v_{\rm ph}=\left(\frac{72\ \mathrm{erg\ cm^{-2}}\times6\ \mathrm{cm^{-1}}}{1\ \mathrm{g\ cm^{-3}}}\right)^{1/2}\sim21\ \mathrm{cm\ s^{-1}}.\tag{5.52}$$

群速度约 $30\ \mathrm{cm\ s^{-1}}$。1 cm 约是仍称涟漪的最长波长，其

$$\Pi_3\equiv\frac{\gamma k^2}{\rho g}\sim\frac{72\ \mathrm{erg\ cm^{-2}}\times36\ \mathrm{cm^{-2}}}{1\ \mathrm{g\ cm^{-3}}\times1000\ \mathrm{cm\ s^{-2}}}\sim2.6.\tag{5.53}$$

稍小 $k$ 即进入 $\Pi_3\approx1$ 灰区，更小则为重力波。更短波更快，故 21 cm/s 是涟漪大致最小相速度；石子激起各种波长，短波先行，约 1 cm 的落后，因不与其他涟漪混合而清晰可见。

#### 5.2.3 合并深水涟漪与重力波

连接深水的两个角（图 5.12）。为方便重述：

<img src="/images/order-of-magnitude-physics/fig-5-12.png" alt="图 5.12：原书扫描页" loading="lazy" decoding="async" />

$$\omega^2=\begin{cases}gk,&\text{重力波};\\\gamma k^3/\rho,&\text{涟漪} .\end{cases}\tag{5.54}$$

二者均由动能与势能平衡得到，差别只在势能来源。中间区两势能贡献相加，故最简单猜测且正确：

$$\omega^2=gk+\gamma k^3/\rho.\tag{5.55}$$

亦可将真实和有效重力相加：

$$g_{\rm total}=g+g_{\rm surface\ tension}=g+\frac{\gamma k^2}{\rho},\tag{5.56}$$

代入 $\omega^2=gk$：

$$\omega^2=\left(g+\frac{\gamma k^2}{\rho}\right)k=gk+\gamma k^3/\rho.\tag{5.57}$$

任意波长的相速度为

$$v_{\rm ph}\equiv\frac\omega k=\sqrt{\frac{\gamma k}{\rho}+\frac gk}.\tag{5.58}$$

高 $k$ 时表面张力项占优，低 $k$ 时重力项占优，故中间有最小速度 $k_0$。平衡两项：

$$\frac{\gamma k_0}{\rho}\sim\frac g{k_0}.\tag{5.59}$$

得

$$k_0\sim\sqrt{\frac{\rho g}{\gamma}}.\tag{5.60}$$

此处 $\Pi_3=1$，正处涟漪—重力波边界，相速度为

$$v_0\sim\sqrt{2g/k_0}\sim\left(\frac{4\gamma g}{\rho}\right)^{1/4}.\tag{5.61}$$

水中 $k_0\sim4\ \mathrm{cm^{-1}}$，$\lambda_0\sim1.5\ \mathrm{cm}$，

$$v_0\sim23\ \mathrm{cm\ s^{-1}}.\tag{5.62}$$

平衡法不诚实地替代了微积分；微积分同意最小相速度，并给出最小群速度

$$v_g\approx17.7\ \mathrm{cm\ s^{-1}}.\tag{5.63}$$

诚实地最小化，选单位使

$$\rho=\gamma=g=1.\tag{5.64}$$

三基本量纲使这是最大自由度，即选典范质量、长度和时间而令一切无量纲。最小化平方速度：

$$v_{\rm ph}^2=k+\frac1k.\tag{5.65}$$

对正 $a,b$，算术—几何平均不等式为

$$\frac{a+b}{2}\ge\sqrt{ab},\tag{5.66}$$

等号仅在 $a=b$。**图 5.13**　无字证明：算术—几何平均不等式的几何证明。可自行把图译为传统证明（提示：画一个三角形）。取 $a=k,b=1/k$，几何平均为 1，故

<img src="/images/order-of-magnitude-physics/fig-5-13.png" alt="图 5.13：原书扫描页" loading="lazy" decoding="async" />

$$k+\frac1k\ge2,\tag{5.67}$$

等号在 $k=1$。此单位制中

$$\omega=\sqrt{k^3+k},\tag{5.68}$$

且

$$v_g=\frac\partial{\partial k}\sqrt{k^3+k},\tag{5.69}$$

即

$$v_g=\frac12\frac{3k^2+1}{\sqrt{k^3+k}}.\tag{5.70}$$

$k=1$ 时群速度也为 2，故边界波相、群速度相等。换回普通单位，$k=1$ 实为 $k=1\times\sqrt{\rho g/\gamma}$，补上的常数确为 1。

最小群速度较复杂，最小化 $v_g^2$：

$$\frac\partial{\partial k}\frac{9k^4+6k^2+1}{k^3+k}=\frac{(3k^2+1)(3k^4+6k^2-1)}{(k^3+k)^2}.\tag{5.71}$$

令其为零，解 $3k^4+6k^2-1=0$，正根为

$$k_1=\sqrt{-1+\sqrt{4/3}}\sim0.393.\tag{5.72}$$

此时

$$v_g(k_1)\approx1.086,\tag{5.73}$$

故普通单位中

$$v_g\approx1.086\left(\frac{\gamma g}{\rho}\right)^{1/4}.\tag{5.74}$$

代水的密度和表面张力即为 (5.63) 的 17.7 cm/s。向池塘投石后，先见落点周围静圆，再以该最小群速度扩张；可在厨房水槽滴硬币试验。最小相速度对水黾有用：若移动慢于 23 cm/s，便不生波，节省行走能量。

### 5.3 浅水

浅水中，深水计算里消失的 $h$ 回来，使变量更复杂（图 5.14）。仅靠量纲分析不能确定 (5.6) 中魔术函数的浅水形式，须修改水板块论证。深水板块深 $1/k$；浅水 $h\ll1/k$ 时，海底先到，板块深为 $h$、长仍为 $1/k$、宽仍为 $w$。连续性论证改变：深水中板块深长相同，板块和表面移动同距离；浅水板块薄了 $hk$ 倍，表面速度比板块慢 $hk$ 倍。表面速度为 $\xi\omega$，故板块横速 $v_{\rm slab}\sim\xi\omega/hk$；主要动能在板块中：

<img src="/images/order-of-magnitude-physics/fig-5-14.png" alt="图 5.14：原书扫描页" loading="lazy" decoding="async" />

$$KE_{\rm shallow}\sim\rho wh/k\times(\xi\omega/hk)^2\sim\frac{\rho w\xi^2\omega^2}{hk^3}.\tag{5.75}$$

**图 5.14**　波的世界中浅水部分。

#### 5.3.1 浅水上的重力波

先考察水浅、波长长的图 5.15 区，包括潮波和海底地震波。重力波势能仍为 (5.21)：

<img src="/images/order-of-magnitude-physics/fig-5-15.png" alt="图 5.15：原书扫描页" loading="lazy" decoding="async" />

$$PE\sim\rho gw\xi^2/k.\tag{5.76}$$

它来自表面变形，只要振幅比水深、波长小，浅水中也相同；主导力决定势能，水深决定动能。平衡 (5.75)：

$$\frac{\rho w\xi^2\omega^2}{hk^3}\sim\frac{\rho gw\xi^2}{k}.\tag{5.77}$$

故

$$\omega^2=ghk^2.\tag{5.78}$$

等号仍因无量纲常数为 1；浅水重力波中

$$f_{\rm shallow}\left(kh,\frac{\gamma k^2}{\rho g}\right)=kh.\tag{5.79}$$

相速和群速相等且与频率无关：

$$v_{\rm ph}=\frac\omega k=\sqrt{gh},\qquad v_g=\frac{\partial\omega}{\partial k}=\sqrt{gh}.\tag{5.80}$$

浅水无色散，各频率同速，脉冲不展宽。智利外海地震使海底下降时，产生的浅水波可无畸变到达日本。$h\sim3000\ \mathrm m$ 时，$v\sim\sqrt{3000\ \mathrm m\times10\ \mathrm{m\ s^{-2}}}\sim170\ \mathrm{m\ s^{-1}}$，可在一天穿越 $10^4$ km 海洋；接近海岸水深减小，波减速、振幅增大，登陆时成为破坏性巨浪。**图 5.15**　波的世界中浅水—重力波部分。

#### 5.3.2 浅水上的涟漪

图 5.16 的浅水涟漪罕见：雨滴落在深小于 1 mm 的浅水坑时才有，且只有 $\lambda\sim1$ cm 的最长涟漪能感到坑底。势能仍为 (5.41)，因水深不影响势能，主导的表面张力才影响它。将之与 (5.75) 平衡：

<img src="/images/order-of-magnitude-physics/fig-5-16.png" alt="图 5.16：原书扫描页" loading="lazy" decoding="async" />

$$\frac{\rho w\xi^2\omega^2}{hk^3}\sim\gamma(k\xi)^2\frac wk.\tag{5.81}$$

得

$$\omega^2\sim\frac{\gamma hk^4}{\rho}.\tag{5.82}$$

相速度为

$$v_{\rm ph}=\sqrt{\frac{\gamma hk^2}{\rho}},\tag{5.83}$$

群速度 $v_g=2v_{\rm ph}$，因为 $\omega\propto k^2$。若 $h\sim1$ mm，

$$v\sim\left(\frac{72\ \mathrm{erg\ cm^{-2}}\times0.1\ \mathrm{cm}\times36\ \mathrm{cm^{-2}}}{1\ \mathrm{g\ cm^{-3}}}\right)^{1/2}\sim16\ \mathrm{cm\ s^{-1}}.\tag{5.84}$$

**图 5.16**　波的世界中浅水—涟漪部分。**图 5.17**　波的世界浅水部分（同图 5.14）。

<img src="/images/order-of-magnitude-physics/fig-5-17.png" alt="图 5.17：原书扫描页" loading="lazy" decoding="async" />

#### 5.3.3 合并浅水涟漪与重力波

已研究浅水世界的两个角，现连接它们，研究图 5.17 的一般浅水波。可直接相加 (5.78)、(5.82)，或将 (5.56) 的有效重力代入 (5.78)，均得

$$\omega^2\sim k^2\left(gh+\frac{\gamma hk^2}{\rho}\right).\tag{5.85}$$

### 5.4 合并深浅水重力波

现在考察图 5.18 的重力波边。由 (5.14)、(5.78)：

<img src="/images/order-of-magnitude-physics/fig-5-18.png" alt="图 5.18：原书扫描页" loading="lazy" decoding="async" />

$$\omega^2=gk\times\begin{cases}1,&\text{深水};\\hk,&\text{浅水} .\end{cases}\tag{5.86}$$

须找 $f(hk)$，使 $hk\to\infty$ 时趋于 1、$hk\to0$ 时趋于 $hk$。一个简单函数为 $\tanh hk$，故猜测“唯一真实重力波色散关系”为

$$\omega^2=gk\tanh hk.\tag{5.87}$$

其可信之处在于 $h\to\infty$ 时 $\tanh hk$ 指数衰减，符合拉普拉斯方程论证；事实上猜测正确。**图 5.18**　波的世界中重力波部分。

### 5.5 合并深浅水涟漪

最后考察图 5.19 的涟漪边。第 5.4 节中 $\tanh kh$ 在 $hk$ 从 0 到 $\infty$ 时成功插值 $hk$ 与 1。拉普拉斯方程的论证不依赖回复力，故猜同一技巧适用于涟漪。相关关系为

<img src="/images/order-of-magnitude-physics/fig-5-19.png" alt="图 5.19：原书扫描页" loading="lazy" decoding="async" />

$$\omega^2=\begin{cases}\gamma k^3/\rho,&kh\gg1;\\\gamma hk^4/\rho,&kh\ll1 .\end{cases}\tag{5.88}$$

提出 $\gamma k^3/\rho$ 后：

$$\omega^2=\frac{\gamma k^3}{\rho}\times\begin{cases}1,&kh\gg1;\\hk,&kh\ll1 .\end{cases}\tag{5.89}$$

这与重力波结果相似，故作同样替换：

$$\begin{cases}1,&kh\gg1;\\hk,&kh\ll1\end{cases}\quad\text{变为}\quad\tanh kh.\tag{5.90}$$

得到一般涟漪色散关系：

$$\omega^2=\frac{\gamma k^3}{\rho}\tanh kh.\tag{5.91}$$

它实际价值不大：付出比深水涟漪式 (5.39) 更大复杂性，只涵盖罕见的池塘涟漪；为完整起见仍列出，以便下一步合并世界的四条边。**图 5.19**　波的世界中涟漪部分。

### 5.6 合并所有分析

将 (5.56) 的 $g_{\rm total}$ 代入，得到唯一真实色散关系：

$$\omega^2=(gk+\gamma k^3/\rho)\tanh kh.\tag{5.92}$$

### 5.7 我们做了什么

我们通过研究色散关系研究水波：先绘出波的世界地图，探索角落，再探索边，最后拼合结果，理解复杂的完整解。现在可画出完整地图（图 5.20）。如本章所做，先考虑极限情形再将其缝合，使分析既可处理，更重要的是可理解。

<img src="/images/order-of-magnitude-physics/fig-5-20.png" alt="图 5.20：原书扫描页" loading="lazy" decoding="async" />

**图 5.20**　我们做了什么。每个框代表一个极限；框旁数字标示研究该极限的顺序。最后一步（9）把全部分析合并到中央超级框，其中含适用于所有波的色散关系：重力波或涟漪、浅水或深水。箭头显示如何将较小、较专门的角框合并为较一般的边框（双线），再将边区合并为通用中央框（三线）。

</div>
