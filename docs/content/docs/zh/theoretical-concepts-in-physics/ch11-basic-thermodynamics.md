---
title: 第 11 章：基础热力学
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

## 11.1 热与温度

同导致现代科学诞生的革命的许多方面一样，对热和温度的科学研究可追溯到十七世纪初。¹ 对热和温度的定量研究，取决于能对“热的程度”这类概念作出定量测量的仪器的发展。“thermomètre”一词最早出现于 1624 年法国耶稣会士 Jean Leurechon 的《数学消遣》中。William Oughtred 于 1633 年将其译为英文，写作“温度计，或测量空气冷热程度的仪器”。《牛津英语词典》将 thermometer 一词在英国文学中的首次出现定为 1633 年。

伽利略等人曾较早描述以气体膨胀测温，但与现代仪器相似的第一批温度计建于 1640 至 1660 年代。玻璃泡中的有色酒精作膨胀物质，液体伸入温度计长茎，长茎密封以防蒸发损失。1701 年 Daniel Fahrenheit 制成密封管抽真空的酒精玻璃温度计。1714 年，他改用汞而非沸点较低的酒精等液体，从而扩大温度范围。1714 至 1724 年间，他确定后来称为华氏温标的定点，水的沸点为 $212\,^{\circ}\mathrm{F}$，冰的熔化温度为 $32\,^{\circ}\mathrm{F}$。1742 年，瑞典乌普萨拉天文台创始人、天文学教授 Anders Celsius 向瑞典科学院展示汞玻璃温度计，采用百分温标，熔冰温度为 $0\,^{\circ}\mathrm{C}$，水的沸点为 $100\,^{\circ}\mathrm{C}$。C 称为摄氏度，已被国际采用为温度的标准 SI 单位。

先后任格拉斯哥与爱丁堡化学和医学教授的 Joseph Black，是揭示热和温度本质的关键人物。耐人寻味的是，1760 年代协助其实验的助手之一正是 James Watt，他将在后续故事中居于中心。Black 的重大成就包括定量地区分热和温度，并定义今天称为比热容的量；他还发现并定义了潜热。

他的实验简单而有效。为量化热的研究，Black 使用恒定供热法，以恒定速率向物体供热并测量其升温。细致实验表明，供给质量 $m$ 的物质的热量 $Q$ 与温差 $\Delta T$ 成正比，即 $Q=mc\Delta T$，其中 $c$ 定义为物质的比热容，specific 如通常所指，意为单位质量。他的伟大认识是，不同材料的比热容不同，这为热的数学理论奠定基础。

研究冰熔化的潜热时，他注意到，对冰加热的唯一效果是将其变成同温度的液态水。正如他所说，进入水中的热“被水吸收并隐藏，因而不能用温度计的应用发现”。² 在一项经典实验中，他在一个大空厅内放置两个直径各四英寸的玻璃容器。第一个装有处于熔点的冰，另一个装有同温度的水。半小时后，水升温 $7\,^{\circ}\mathrm{F}$，第二个容器中的冰却仅部分融化；事实上，十个半小时后冰才完全融化。由此可得冰的熔化潜热为 $80\ \mathrm{cal\,gm^{-1}}$。他以类似巧思确定沸点处蒸汽凝结成水的潜热。

## 11.2 热作为运动与热质说

十八世纪末，关于热的本质发生重大争论。热是运动形式的观念可追溯至公元前五世纪希腊哲学家 Democritus 的原子论。他认为物质由不可分粒子组成，粒子的运动产生自然界物质呈现的无数不同形式。十七世纪科学家和哲学家思想中也有这些观念的回响。Francis Bacon 写道：“热本身，其本质和实体，就是运动，别无他物。”³ Robert Boyle 也赞同动力学说，钉子被锤入木块产生的热使他信服；他认为锤击施加了“对铁的微小部分强烈且以不同方向确定的搅动；它原来是冷的物体，因这种附加的全体微小部分的骚动，以各种意义变热”。⁴ Thomas Hooke 也持此见，他称流动性“不过是热的一种脉动或摇动；因为热不过是物体各部分极活泼、强烈的搅动，物体各部分因而彼此松开，得以容易向任何方向运动，并成为流体”。⁵

Isaac Newton、Gottfried Leibniz、Henry Cavendish、Thomas Young、Humphry Davy，以及十七世纪哲学家 Thomas Hobbes 和 John Locke 也有类似见解。

然而十八世纪形成另一图景，其起源是燃素概念：这种假想元素可与物体结合使其可燃。Joseph Priestley 于 1774 年发现氧后，现代化学之父 Antoine-Laurent Lavoisier 说明燃烧应视为氧化过程，不必引入燃素。但仍有强大意见认为热应被看成一种物理物质。Lavoisier 等人把这种“热的物质”命名为 caloric，即热质，设想为“不可称量流体”，也就是无质量流体；当热从一物体流向另一物体时它守恒。它的流动被设想为类似水车中质量守恒的水流。为说明热的扩散，假定热质是自斥、有弹性但受物质吸引的流体。若两物体温度不同并热接触，热质从较热物体流向较冷物体，直至同温平衡。物体越热，所含热质越多；因其自斥，体积增大，从而说明热膨胀。Lavoisier 在 1789 年《化学基础论》的简单物质表中列入热质。⁶

热质说有问题。例如暖物体接触冰时，热质流入冰，冰虽变成水，冰水混合物温度却不变，故必须假定热质能与冰结合形成水。Joseph Black、Pierre-Simon Laplace、John Dalton、John Leslie、Claude Berthollet 和 Johan Berzelius 等杰出科学家支持此说。Sadi Carnot 构建完美热机的先驱思想时，也用热质说描述热机内的热流。

两种理论在十八世纪末冲突。反热质说最重要证据之一是 Rumford 伯爵的实验。Rumford 原名 Benjamin Thomson，出生于美国马萨诸塞州沃本小镇，经历异常非凡，正如 G. I. Brown 的传记标题《科学家、军人、政治家、间谍：Rumford 伯爵》所概括。⁷ 他还是英国皇家研究所创办人，与 Lavoisier 的遗孀有一桩不幸福婚姻。尽管对社会有许多实际贡献，他并不受喜爱，当时有人称他“冷酷得难以置信、天生自我中心且势利”，另有人称他是“自 Isaac Newton 以来科学史上最令人不快的人物”。

Rumford 对物理学的伟大贡献，是认识到摩擦力可无限地产生热。1798 年用钝钻头镗制大炮的实验最生动地显示此现象（图 11.1）。在最著名实验中，他把约 19 磅水置于炮筒周围的箱内，两半小时后水竟沸腾。他写道：“难以描述旁观者见到如此大量的水无火加热且竟被煮沸时脸上表现的惊讶和震惊……推理此问题时，不能忘记最值得注意的情形，即本实验中摩擦产生的热源显然取之不尽。无须补充说明，任何孤立物体或物体系统能无限继续供给的东西不可能是物质；在我看来，若非**运动**，极难，甚至完全不可能，对本实验中能被激发和传递的任何东西形成明确观念。”⁷ 图 11.1：Rumford 在慕尼黑兵工厂于 1798 至 1799 年进行的大炮镗孔实验模型。（慕尼黑德国博物馆惠赐。）

<img src="/images/theoretical-concepts-in-physics/fig-11-1.png" alt="图 11.1：原书扫描页" loading="lazy" decoding="async" />

Rumford 成就的顶点，是首次测定热功当量。他由马匹转动钻具所做的功得到 1798 年的 $5.60\ \mathrm{J\,cal^{-1}}$，四十多年后 Mayer 和 Joule 才重返此问题。另一项关键贡献是 Fourier 1822 年出版的《热的解析理论》。⁸ Fourier 以微分方程建立热传递数学理论，并不要求为热的物理本性构造特定模型。他的方法牢固基于法国理性力学传统，给出热效应的数学表达而不追问其原因。

十八世纪论著已讨论应用于今日所谓能量的机械系统守恒律，特别是 Leibniz 的工作。他主张现在称为动能的“活力”或 *vis viva* 在机械过程中守恒。至 1820 年代，动能和所做功的关系得到澄清。

1840 年代，若干科学家沿 Rumford 开辟道路，独立得出热和功可互相转换的正确结论。Julius Mayer 是最早者之一，1840 年他被任命为三桅船 *Java* 远东航程的船医。他有充裕时间思考科学问题，包括生物体内生热。在泗水，数位船员患病，他给他们放血时发现热带静脉血比温带红得多。当地人称，这是因为维持正常体温所需氧气比寒冷气候少。Mayer 推理，食物产生的能量一部分化为热维持体温，一部分化为肌肉所做功。回到欧洲后，他于 1842 年据压缩和加热气体所做功的实验提出功与能等价，并将结果提升为能量守恒原理，由气体绝热膨胀估得热功当量 $3.58\ \mathrm{J\,cal^{-1}}$。Mayer 很难发表著作，其先驱工作被 James Joule 遮蔽，后者称 Mayer 的工作是“未经支持的假说，而非实验确立的定量定律”，随后 Joule 以精密实验检验这一假说。

James Prescott Joule 出身于以祖父创办酿酒厂致富的家庭。其父在酿酒厂旁为他建实验室，他在那里完成先驱实验。他的天才在于严谨实验，之所以在 1840 年代诸先驱中突出其名，是因他将热的科学置于坚实实验基础。其工作尤其重要之处是准确测量极小温度变化的能力。追踪 Joule 执着地得到可靠热功当量估计是令人欣喜的。⁹ 为保持历史真实，暂不严格遵守 SI 单位，而采用他的单位。热能单位为英国热单位（BTU），即在标准温压下使 1 磅水升高 $1\,^{\circ}\mathrm{F}$ 所需热量；机械能单位为英尺磅达。现行热功当量为 $4.1868\ \mathrm{J\,cal^{-1}}$，对应 $778.2\ \mathrm{foot\!\text{-}\!poundal\,BTU^{-1}}$。

* **1843** Joule 的发电机实验比较驱动发电机所做功与电流产生的热，发表《伏打电产生热》。早期实验确立热量正比于 $RI^2$，其中 $R$ 为电阻、$I$ 为电流。至 1843 年，他从电学实验导得 $838\ \mathrm{foot\!\text{-}\!poundal\,BTU^{-1}}$。
* **1843** 在论文附记中，他说其他实验已表明“水通过细管会放出热”，给出 $770\ \mathrm{foot\!\text{-}\!poundal\,BTU^{-1}}$；这些实验预示其著名桨轮实验。
* **1845** Joule 进行自己的 Mayer 实验，测量空气绝热膨胀温变。压缩一体积空气，后测空气膨胀的能量损失，估计为 $798\ \mathrm{foot\!\text{-}\!poundal\,BTU^{-1}}$。
* **1847** 1845 年 Joule 认识到：“若我的观点正确，瀑布落差 817 英尺当然会产生一度热，尼亚加拉河经 160 英尺落差温度将升约五分之一度（华氏）。”¹⁰ 两周后，William Thomson 从夏蒙尼下山开始环勃朗峰旅行，遇见 Joule 手持长温度计上山，附近马车中坐着一位女士。Joule 告诉他自己自牛津分别后已结婚，正去试测瀑布升温。¹¹ 物理学家的未来配偶应知，这绝非物理学家在蜜月做物理的孤例。
* **1845 至 1878** 首次桨轮实验于 1845 年完成，实验装置图于 1850 年发表（图 IV.1）。重物驱动桨轮所做功，借水与叶片间摩擦化为热。1845 年初步值为 $890\ \mathrm{foot\!\text{-}\!poundal\,BTU^{-1}}$；1847 年报告 $781$ 至 $788$；更精细实验持续至 1878 年，最终值为 $772.55\ \mathrm{foot\!\text{-}\!poundal\,BTU^{-1}}$，即 $4.13\ \mathrm{J\,cal^{-1}}$，可与现代采用值 $4.1868\ \mathrm{J\,cal^{-1}}$ 比较。

1847 年，22 岁的 William Thomson 对桨轮实验结果极为兴奋。在上述牛津英国科学促进会会议，他听 Joule 介绍热功当量实验。在此以前，他接受 Carnot 关于热机运行中热（或热质）守恒的假定。他发现 Joule 结果惊人，正如其弟 James 所写，Joule 的“观点略有使人的心智不安定的倾向”。¹² Joule 结果在欧洲大陆广传；至 1850 年 Helmholtz 和 Clausius 已表述今天称为能量守恒定律或热力学第一定律的定律。Helmholtz 尤其首先以数学形式表达守恒律，纳入机械、电现象、热和功。1854 年 Thomson 发明 *thermo-dynamics* 一词，描述他将作出重大贡献的新热科学。

## 11.3 热力学第一定律

本节目标是尽可能清楚地说明第一定律内容。两条定律的处理深受 Brian Pippard《经典热力学要素》¹³影响，此书因阐述清晰深刻而值得推荐。

### 11.3.1 第零定律与经验温度的定义

先须确立经验温度的含义及其如何来自热力学第零定律。我们立刻遇到热力学推理的特征：许多论述形如“经验事实是……”，并由此类公理导出适当数学结构。

从流体，即液体或气体的热性质开始，因为流体内各点压强各向同性，也因为可改变容器形状而不改变体积，故不做功。此时我们没有温度定义，提出第一公理：

> 经验事实是，流体性质完全由仅仅两个性质，即压强 $p$ 和容器体积 $V$ 决定。

假定流体未受其他影响，例如置于电场或磁场。系统若完全由两个性质定义，称为双坐标系统。我们处理的大多数系统为双坐标系统，多坐标系统的形式体系也相对容易发展。

仔细注意这一断言的含义。使某体积流体经历一系列过程，最后压强为 $p_1$、体积为 $V_1$。再取另一份相同量流体，施以完全不同操作而同样终止于 $p_1,V_1$。断言这两份流体物理性质完全不可区分。

取坐标为 $p_1,V_1$ 和 $p_2,V_2$ 的两个孤立流体系统，使其热接触并放置很久。一般而言，它们性质改变，达到热力学平衡，即二者间无净热传递的状态。热力学平衡概念至关重要：组成系统的所有成分已获准热相互作用，直至很久后系统宏观性质不再变化。达到此状态时一般有热交换和做功。平衡中二系统坐标为 $p_1,V_1,p_2,V_2$，这四值不能任意；经验事实表明，两个流体不能以任意这些值而处于热平衡。四量间必须有数学关系：

$$F(p_1,V_1,p_2,V_2)=0.$$

若已知其他三个量，此式给出第四个量。

至此尚未使用温度一词。由另一普遍经验事实，且其核心地位使其升格为热力学定律的第零定律，获得适当定义：

> 若两个系统 1 和 2 分别与第三个系统 3 处于热平衡，则它们彼此也必处于热平衡。

系统 1 与 3 平衡意味着 $F(p_1,V_1,p_3,V_3)=0$，或 $p_3=f(p_1,V_1,V_3)$；系统 2 与 3 平衡同样意味着 $p_3=g(p_2,V_2,V_3)$。因而热平衡时

$$f(p_1,V_1,V_3)=g(p_2,V_2,V_3).\tag{11.1}$$

第零定律又说明 1 与 2 平衡，故必有函数

$$h(p_1,V_1,p_2,V_2)=0.\tag{11.2}$$

式 (11.2) 表明式 (11.1) 必须使两侧对 $V_3$ 的依赖抵消，即必须有 $f(p_1,V_1,V_3)=\phi_1(p_1,V_1)\zeta(V_3)+\eta(V_3)$ 的形式。因此代入 (11.1)，得

$$\phi_1(p_1,V_1)=\phi_2(p_2,V_2)=\phi_3(p_3,V_3)=\theta=\text{常数}.\tag{11.3}$$

这是第零定律的逻辑后果：在给定温度彼此热平衡的所有系统中，存在 $p,V$ 的函数取同一常数。不同平衡状态由不同常数表征。表征平衡状态的常数称为状态函数，即对特定平衡状态取确定值的量。此常数定义为经验温度 $\theta$，因而得到平衡态中联系 $p,V$ 和经验温度的状态方程：

$$\phi(p,V)=\theta.\tag{11.4}$$

现可实验找出对应固定 $\theta$ 的所有 $p,V$ 组合。定义平衡态有 $p,V,\theta$ 三量，但任意两量足以完整定义它。常 $\theta$ 线称为等温线。

图 11.2 说明定容气体温度计原理。温度计利用低压下气体紧密遵从理想气体定律 $pV=RT$，故体积固定时压强差直接量度温度。经验温度尚不像通常的温度；为建立坚实实验基础，须决定温标。一旦为一个系统固定，因所有热平衡系统有相同经验温度，它对所有系统均固定。温标题目极广，这里仅指出定容气体温度计的重要性。尽管笨重，实验证明所有气体在低压有相同压强体积变化，即固定温度下足够低压时所有气体每摩尔 $pV$ 相同；并且这些气体以极好近似为理想或完全气体，故可将其压强、体积测量联系到热力学温度 $T$。关系为完全气体定律：

<img src="/images/theoretical-concepts-in-physics/fig-11-2.png" alt="图 11.2：原书扫描页" loading="lazy" decoding="async" />

$$pV=RT,\tag{11.5}$$

其中 $R$ 是 1 摩尔气体的普适气体常数。第 11.5.5 节将说明此标度能联系到热力学温标，为热研究提供严格理论基础，故低压极限中气体温度计可直接测热力学温度：

$$T=\lim_{p\to0}(pV)/R.\tag{11.6}$$

一般而言，尤其高压和相变附近，$p,V$ 是 $T$ 的复杂得多的函数。

### 11.3.2 第一定律的数学表达

第一定律已表述为：

> 若计及热，能量守恒。

要赋予它数学内容，须精确定义热、能量、功。后两者直接。功定义为

$$W=\int_{\mathbf r_1}^{\mathbf r_2}\mathbf f\cdot d\mathbf r,\tag{11.7}$$

其中力 $\mathbf f$ 的作用使物体移动距离增量 $d\mathbf r$。对物体做功使能量增加。对系统做功有不同方式：

* 在外压 $p$ 作用下压缩流体，做功视为正量。对流体做机械功时体积减小，故 $dW=-p\,dV$。若流体膨胀做功，周围所受功为正，系统所受功为负，体积增量符号重要：$dW=-p\,dV$。\tag{11.8}
* 拉伸导线 $dl$：$dW=\mathbf f\cdot d\mathbf l$。
* 电场 $\mathbf E$ 对电荷 $q$ 做功：$dW=q\mathbf E\cdot d\mathbf r$。
* 克服表面张力使面积增 $dA$：$dW=\gamma\,dA$，$\gamma$ 为表面张力系数。
* 力偶或转矩 $\mathbf G$ 造成角位移 $d\boldsymbol\theta$：$dW=\mathbf G\cdot d\boldsymbol\theta$。
* 电场 $\mathbf E$ 对介质单位体积做功：$dW=\mathbf E\cdot d\mathbf P$，$\mathbf P$ 为极化，即单位体积偶极矩（见第 7.11 节）。
* 磁场 $\mathbf B$ 对可磁化介质单位体积做功：$dW=\mathbf B\cdot d\mathbf M$，$\mathbf M$ 为介质磁化强度，即单位体积磁偶极矩（见第 7.11 节）。

功是广义力 $X$ 与广义位移 $dx$ 的标量积，$dW=X\cdot dx$。功总是强度变量 $X$，即材料某点定义的性质，与广度变量 $dx$ 的乘积，后者描述系统在强度变量作用下的“位移”。

考虑一个不与环境热相互作用的孤立系统。经验事实是，对系统以任何方式做功，它达到新平衡态，做功方式无关。例如可压缩气体、以桨轮搅拌，或使电流通过。Joule 的重大贡献是精密实验证明此事实。不同过程均增加系统能量，称系统因做功其内能 $U$ 增加。既然方式无关，$U$ 必为状态函数。对该孤立系统：

$$W=U_2-U_1\quad\text{或}\quad W=\Delta U.\tag{11.9}$$

若系统不孤立，而与环境有热相互作用，系统达到新内能态，变化并不全由功造成。因此定义供给的热 $Q$ 为

$$Q=\Delta U-W.\tag{11.10}$$

这就是热的定义。它似乎迂回，却有逻辑一致的重大优点，完全避免精确规定热是什么。这一问题正是约 1850 年前将热纳入守恒律时许多概念困难的根源。微分形式为

$$dQ=dU-dW.\tag{11.11}$$

还应区分状态函数微分与非状态函数微分。$dU$ 是状态函数微分，$dp,dV,dT$ 亦然；$dQ,dW$ 则不是，因为从 $U_1$ 到 $U_2$ 可加上不同量的 $dQ,dW$。将后两种写为 $\delta Q,\delta W$：

$$\delta Q=dU-\delta W.\tag{11.12}$$

式 (11.12) 是第一定律的正式数学表达，可应用于多种问题。

### 11.3.3 第一定律的若干应用

**(i) 热容。** $U$ 是状态函数，气体性质完全由两个状态函数描述。写 $U=U(V,T)$，则

$$dU=\left(\frac{\partial U}{\partial T}\right)_VdT+\left(\frac{\partial U}{\partial V}\right)_T dV.\tag{11.13}$$

代入 (11.12) 并用 (11.8)：

$$\delta Q=\left(\frac{\partial U}{\partial T}\right)_VdT+\left[\left(\frac{\partial U}{\partial V}\right)_T+p\right]dV.\tag{11.14}$$

在定容下，1760 年代 Black 先以实验描述的热容 $C$ 为 $C_V=\left(\frac{\delta Q}{dT}\right)_V=\left(\frac{\partial U}{\partial T}\right)_V$。定压下，

$$C_p=\left(\frac{\delta Q}{dT}\right)_p=\left(\frac{\partial U}{\partial T}\right)_V+\left[\left(\frac{\partial U}{\partial V}\right)_T+p\right]\left(\frac{\partial V}{\partial T}\right)_p.\tag{11.15}$$

这些式给出既定热输入的温升。它们不指特定体积或质量，惯用单位质量的比热容，特定量按惯例用小写：

$$c_V=C_V/m;\qquad c_p=C_p/m.\tag{11.16}$$

相减得

$$C_p-C_V=\left[\left(\frac{\partial U}{\partial V}\right)_T+p\right]\left(\frac{dV}{dT}\right)_p.\tag{11.17}$$

右侧方括号第二项说明定 $p$ 推回环境所做功；第一项描述内能随体积变化，必与克服气体内不同类型分子间力所做功有关。因此 $C_p-C_V$ 提供 $(dU/dV)_T$ 的信息。

**(ii) Joule 膨胀。** 测定 $C_p,C_V$ 关系的一种方式是 Joule 膨胀，即气体向较大体积自由膨胀。系统与环境热隔离，故无热交换；容器壁固定，故自由膨胀无功。Joule 1845 年的精细实验见图 11.3。容器 A 装 $22$ 个大气压的干燥空气，B 抽真空，C 是精制旋塞。首个实验把整体置于水浴中（图 11.3(a)）；开旋塞后空气从 A 流到 B，虽能测小至 $0.005\,^{\circ}\mathrm{F}$ 的温变，却未测到水浴温变。他说：“空气以不发展机械功的方式膨胀时，不发生温度变化。”¹⁴ 第二实验中 A、B、C 各有独立水浴（图 11.3(b)）。开旋塞后 B、C 温度升而 A 降，因为 A 中气体推动气体进入 B 而做功。膨胀后若让 A、B 气体热接触达到新平衡，依 Joule 实验温度不变，此为 Joule 膨胀。$\Delta U=\delta Q+\delta W$，且 $\delta Q=0,\delta W=0$，故内能 $U$ 不变，即 $(dU/dV)_T=0$。经典的完全气体定义为：(a) 状态方程是每摩尔 $pV=RT$；(b) Joule 膨胀中内能 $U$ 不变。

<img src="/images/theoretical-concepts-in-physics/fig-11-3.png" alt="图 11.3：原书扫描页" loading="lazy" decoding="async" />

由 (b)，$\left(\frac{dU}{dV}\right)_T=0$；由 (a)，$\left(\frac{\partial V}{\partial T}\right)_p=\frac{\partial}{\partial T}\left(\frac{RT}{p}\right)=\frac Rp$。因此由 (11.17)：

$$C_p-C_V=R.\tag{11.18}$$

这说明完全气体内能仅为温度的函数。Joule 膨胀表明内能独立于体积，也必独立于压强，因为膨胀中压强确实降低；状态完全由这两个状态函数决定，故完全气体内能只依赖温度。实际非完全气体中，$U$ 因而 $T$ 随体积变化，物理上因为需克服分子间 van der Waals 力做功。极高压下，分子不能压缩而有有效排斥力，称硬核排斥。故实际膨胀有小温变。Joule 系数定义为 $(\partial T/\partial V)_U$，即定内能 $U$ 下体积增加时 $T$ 的变化，可与气体其他性质联系。

**(iii) 焓和 Joule-Kelvin 膨胀。** 定容热容 $C_V$ 涉及状态函数微分，故可问是否另有对应 $C_p$ 的状态函数微分。写 $U=U(p,T)$ 而非 $U(V,T)$：

$$dU=\left(\frac{\partial U}{\partial p}\right)_Tdp+\left(\frac{\partial U}{\partial T}\right)_pdT.$$

如前进行：

$$
\begin{aligned}
\delta Q&=dU+p\,dV\\
&=\left(\frac{\partial U}{\partial p}\right)_Tdp+p\,dV+\left(\frac{\partial U}{\partial T}\right)_pdT,\\
\left(\frac{\delta Q}{dT}\right)_p&=p\left(\frac{\partial V}{\partial T}\right)_p+\left(\frac{\partial U}{\partial T}\right)_p=\left(\frac{\partial}{\partial T}(pV+U)\right)_p.
\end{aligned}\tag{11.19}
$$

$pV+U$ 完全由状态函数组成，故亦为状态函数，称焓 $H$：

$$H=U+pV,\qquad C_p=\left(\frac{\delta Q}{dT}\right)_p=\left(\frac{\partial H}{\partial T}\right)_p=\left(\frac{\partial}{\partial T}(U+pV)\right)_p.\tag{11.20}$$

焓常出现于流动过程，特别是 Joule-Kelvin 膨胀。气体由一缸转入另一缸，二缸压强维持为 $p_1,p_2$（图 11.4）。设一定质量气体经一个或多个小孔或窄管，常称“多孔塞”，从 A 到 B。A 中初始内能 $U_1$、体积 $V_1$、压强 $p_1$；A 的活塞在恒压 $p_1$ 将气体推过塞入 B 后，B 中气体有 $p_2,V_2,T_2$。系统热隔离，推气体所涉能量为 $U_1+p_1V_1$，必须等于 $U_2+p_2V_2$：

<img src="/images/theoretical-concepts-in-physics/fig-11-4.png" alt="图 11.4：原书扫描页" loading="lazy" decoding="async" />

$$p_1V_1+U_1=p_2V_2+U_2\quad\text{或}\quad H_1=H_2.\tag{11.21}$$

图 11.4 说明 Joule-Kelvin 气体膨胀实验。流体经多孔塞，穿过塞时速度很小，工程师称为节流膨胀。完全气体 $H=pV+U=RT+U(T)$，为温度唯一函数，故两体积温度相同，Joule-Kelvin 膨胀无温变。实际气体则因分子间力有温变，正负取决于压强和温度。Joule-Kelvin 系数定义为 $(\partial T/\partial p)_H$，此实验比 Joule 膨胀对偏离完全气体定律更敏感。

可导出包括总能量其他贡献的一般守恒方程，例如重力场中气体的动能和势能。考虑穿过黑箱的流动（图 11.5）。质量 $m$ 的气体或流体稳态进入、离开黑箱，能量守恒为

<img src="/images/theoretical-concepts-in-physics/fig-11-5.png" alt="图 11.5：原书扫描页" loading="lazy" decoding="async" />

$$H_1+\frac12mv_1^2+m\phi_1=H_2+\frac12mv_2^2+m\phi_2,$$
$$p_1V_1+U_1+\frac12mv_1^2+m\phi_1=p_2V_2+U_2+\frac12mv_2^2+m\phi_2.\tag{11.22}$$

即

$$\frac{p}{m/V}+\frac Um+\frac12v^2+\phi=\text{常数},$$
$$\frac p\rho+u+\frac12v^2+\phi=\text{常数},\tag{11.23}$$

其中 $u$ 是比能量密度。这是流体流动方程之一。不可压流体 $u_1=u_2$ 时得到第 9.2.2 节由流体力学导出的 Bernoulli 方程：

$$\frac p\rho+\frac12v^2+\phi=\text{常数}.\tag{11.24}$$

图 11.5 说明重力场中流体流动的能量守恒。Joule-Kelvin 膨胀中假设 Bernoulli 方程附加项不存在，膨胀极慢故可忽略动能项，且两体积处于同一重力势。

**(iv) 绝热膨胀。** 绝热膨胀中气体体积改变而系统不与环境热接触。经典说明是完全绝热的气缸和活塞内气体膨胀或压缩（图 11.6）。此类膨胀的重要点是极慢进行，系统在初末热力学坐标间经过无穷多个平衡态。第 11.5.1 节讨论可逆过程时将回到这一关键概念。因此

<img src="/images/theoretical-concepts-in-physics/fig-11-6.png" alt="图 11.6：原书扫描页" loading="lazy" decoding="async" />

$$\delta Q=dU+p\,dV=0.\tag{11.25}$$

若 $C_V=(\partial U/\partial T)_V$ 指每摩尔气体，$n$ 摩尔时 $dU=nC_VdT$。膨胀中经过无穷平衡态，适用 $pV=nRT$，由 (11.25)

$$nC_VdT+\frac{nRT}{V}dV=0,\qquad \frac{C_V}{R}\frac{dT}{T}=-\frac{dV}{V}.\tag{11.26}$$

积分得

$$\frac{V_2}{V_1}=\left(\frac{T_2}{T_1}\right)^{-C_V/R}\quad\text{或}\quad VT^{C_V/R}=\text{常数}.\tag{11.27}$$

因所有阶段 $pV=nRT$，亦写为 $pV^\gamma=\text{常数}$，其中 $\gamma=1+R/C_V$。每摩尔 $C_V+R=C_p$，故

$$1+\frac R{C_V}=\frac{C_p}{C_V}=\gamma.\tag{11.28}$$

$\gamma$ 是比热容比或绝热指数。单原子气体 $C_V=\frac32R$，所以 $\gamma=\frac53$。

**(v) 等温膨胀。** 此时必须与环境交换热，使活塞内气体保持 $T=\text{常数}$。膨胀中推动活塞做功，须以相应流入的热补充：

$$\int_{V_1}^{V_2}p\,dV=\int_{V_1}^{V_2}\frac{RT}{V}dV=RT\ln\frac{V_2}{V_1}.\tag{11.29}$$

这是维持等温膨胀须由环境供给的热，且将在热机分析中有重要应用。

**(vi) 不同类型的膨胀。** 四类膨胀可概括为：等温膨胀，$\Delta T=0$，须供热或移热维持它；绝热膨胀，$\Delta Q=0$，不与环境交换热；Joule 膨胀，$\Delta U=0$，完全气体固定壁面下自由膨胀至较大体积内能不变；Joule-Kelvin 膨胀，$\Delta H=0$，完全气体从一个体积传至另一体积，传递时两容器压强维持 $p_1,p_2$，焓守恒。这些表面不同现象背后的基本原理只是能量守恒，均为第一定律的展开。

## 11.4 热力学第二定律的起源

第一定律在历史上竟比第二定律麻烦得多，总令人惊讶。1850 年后，第一定律使热可作逻辑自洽定义，能量守恒也有坚实概念基础。不过热力学过程必有其他限制，特别是尚无热流方向或热力学系统演化方向的规则。这些由第二定律导出，其 Rudolf Clausius 形式为：

> 不可能存在唯一结果为把热从较冷物体传至较热物体的过程。

从这简单陈述可导出如此有力的结果，颇为非凡。同样非凡的是，热力学基本原理由蒸汽机运行导出。正如 L. J. Henderson 所说：“1850 年以前，蒸汽机为科学所做的，比科学为蒸汽机所做的更多。”¹⁵ 以下回顾这敏锐陈述的历史。

### 11.4.1 James Watt 与蒸汽机

蒸汽机发明或许是奠定工业革命基础的最重要发展，工业革命约 1750 至 1850 年席卷发达国家。¹⁶ 此前主要动力是必须靠近江河的水车，以及不可靠的风力；马可提供动力但昂贵。蒸汽机重要之处在于可在需要动力处产生动力。

首个商业可行而成功的蒸汽机由 Thomas Newcomen 于 1712 年建造，用以从煤矿抽水和提升水来驱动水车。其蒸汽机（图 11.7）在大气压下运行。原理是装有活塞的气缸充满蒸汽，随后注入冷水射流使蒸汽凝结。气缸产生的真空使活塞下行，产生动力冲程，经图 11.7 所示机械装置传至泵。动力冲程结束，打开蒸汽阀，泵杆重量将活塞拉回气缸顶端。其后半世纪，John Smeaton 以更佳设计和工程使效率稳步提高到 Newcomen 原机的两倍以上（表 11.1）。

<img src="/images/theoretical-concepts-in-physics/fig-11-7.png" alt="图 11.7：原书扫描页" loading="lazy" decoding="async" />

**表 11.1 蒸汽机效率¹⁷**

| 日期 | 制造者 | 责任指标 | 热效率百分比 |
| --- | --- | ---: | ---: |
| 1718 | Newcomen | 4.3 | 0.5 |
| 1767 | Smeaton | 7.4 | 0.8 |
| 1774 | Smeaton | 12.5 | 1.4 |
| 1775 | Watt | 24.0 | 2.7 |
| 1792 | Watt | 39.0 | 4.5 |
| 1816 | Woolf 复合机 | 68.0 | 7.5 |
| 1828 | 改良康沃尔机 | 104.0 | 12.0 |
| 1834 | 改良康沃尔机 | 149.0 | 17.0 |
| 1878 | Corliss 复合机 | 150.0 | 17.2 |
| 1906 | 三级膨胀机 | 203.0 | 23.0 |

这个故事的一位伟大英雄是 James Watt，他在格拉斯哥受训为科学仪器制造者。1764 年修理 Newcomen 蒸汽机模型时，他对其运行中蒸汽和热的浪费印象深刻。1765 年 5 月，他作出关键发明，成为整个热力学的支撑：若蒸汽在与气缸分开的室内凝结，效率会显著提高。冷凝器的发明也许是其最大创新，1768 年他取得著名专利。图 11.8 展示 Watt 1788 年建造的蒸汽机，在大气压下工作。关键创新是将冷凝器 F 同气缸和活塞 E 分离。气缸绝热，保持恒定高温 $T_1$；冷凝器保持较低温 $T_2$，由气泵 H 抽真空。打开冷凝器阀时 E 中蒸汽凝结而发生动力冲程。随后蒸汽充满气缸上部，冲程完成后让蒸汽进入气缸下部，泵杆重量使活塞回原位。

<img src="/images/theoretical-concepts-in-physics/fig-11-8.png" alt="图 11.8：原书扫描页" loading="lazy" decoding="async" />

矿主为降低抽水成本不断施压提高效率。1782 年 Watt 取得双作用蒸汽机专利，蒸汽动力同时用于活塞动力和返回冲程，功加倍。这需要新式平行运动杆，使活塞既可推又可拉。Watt 称它是“我所设计的最巧妙、最简单的机械部件之一”。还有调节蒸汽供给的调速器。图 11.9 所示版本中，活塞往复运动由太阳行星齿轮转为旋转运动。

<img src="/images/theoretical-concepts-in-physics/fig-11-9.png" alt="图 11.9：原书扫描页" loading="lazy" decoding="async" />

下一个重大进步在 1800 年代初，是 Richard Trevithick 使用高压蒸汽而非大气压的蒸汽机。因此较小蒸汽机可产生更多动力，装入早期蒸汽车和早期蒸汽机车。表 11.1 显示从 Newcomen 至二十世纪初效率如何提高。发动机“责任指标”以每蒲式耳煤的一百万英尺磅达能量定义，1 蒲式耳为 84 磅，堪称终极非 SI 单位。表 11.1 对推动工业革命的制造商和实业家最重要。人们极感兴趣于热机最大效率，正是这些实践考虑引起 Sadi Carnot 对热机效率的兴趣。

### 11.4.2 Sadi Carnot 与《反思》

Nicolas Léonard Sadi Carnot 是 Lazare Carnot 长子。Lazare 曾在法国革命后任督政府成员，后于 1815 年百日王朝期间任 Napoleon 内政大臣。1807 年后，Lazare 多致力教育儿子。Sadi 就读精英巴黎综合理工学院，教师包括 Poisson、Gay-Lussac、Ampère。经历军工工程师时期后，1819 年起可全力研究。Carnot 关心高效蒸汽机设计，认为法国技术落后英国。他也注意到，虽已有可靠热机效率估计，提出者都是发明家和工程师而非理论家。他的伟大著作《对火的动力及能发展这种动力的机器的反思》¹⁸于 1824 年出版，通常译为《论火的动力》；论著对热机最大效率作理论分析。他的方法强烈受父亲蒸汽机研究影响，然而具有更大普遍性，是极具独创性的智力成就。

此前最大效率工作或以燃料输入与功输出比较等经验研究，或基于热机气体行为特定模型的理论研究。Carnot 目标无疑实用，但基本洞见全新。在我看来，其想象力飞跃堪称天才。他寻求完全普遍热机理论，受父亲关于永动不可能的前提引导。在《反思》中采热质说，假定热质在热机循环中守恒；他假设热质从热体至冷体的传递是热机做功的根源。热质流被看作类似流体流，正如水车中流体沿势梯度下降可产功。

Carnot 对热机运行有两项基本洞见。第一，热机以循环过程传热最有效率。第二，决定可从热机提取多少功的关键因素是热源与热质流入的热阱间温差，即 Watt 冷凝器预示的 $T_1,T_2$。这些基本想法不依赖热流过程的特定模型。又一次想象洞见中，他构造今日称为 Carnot 循环的操作循环，作为任一热机行为的理想化。其关键是所有过程可逆，故反转操作顺序可对系统做功，并把热质从冷体传至热体。他将任意热机与反向 Carnot 热机连接，说明没有热机能产出超过 Carnot 热机的功；否则连接两机，就能无功将热从冷传热，或无净热传递地产生净功，均违背通常经验。Lazare Carnot 永动不可能前提的影响显而易见。第 11.5.2 节将正式证明。

Sadi Carnot 于 1832 年 8 月因霍乱在 36 岁去世，此前其工作深远意义未充分认识。1834 年 Émile Clapeyron 以解析方式重述 Carnot 论证，将理想 Carnot 机联系标准压强体积示功图。此事搁置至 William Thomson 研究 Clapeyron 论文若干方面，回到 Carnot《反思》原本。当时 Thomson 等人的大问题，是调和 Carnot 热质守恒的工作与 Joule 证明热和功可互换的实验。Rudolf Clausius 解决此问题，他表明热机最大效率的 Carnot 定理正确，但无热损失的假定错误。事实上 Carnot 循环中热转化为功。Clausius 的重述构成第二定律的骨架。¹⁹ 但此定律远超热机效率，既定义热力学温标，也解决系统如何热力学演化的问题。以下更正式发展这些概念，指出数学表述第二定律的基本假定。

## 11.5 热力学第二定律

先讨论可逆与不可逆过程的关键区别。

### 11.5.1 可逆与不可逆过程

可逆过程无限缓慢地进行，故系统从状态 A 到 B 时经过无穷多个平衡态。过程无限慢，不存在摩擦或湍流，不产生声波；任何阶段均无不平衡力，每一步仅对系统作无穷小改变。因此精确反转过程，可回起点，系统和环境均不变。显然若有摩擦损失，不从环境提取能量便不能回原处。

以可逆等温膨胀强调此点。设有温度 $T$ 的大热库，以及与其热接触、同为 $T$ 的含气缸（图 11.10）。二体积同温不流热。若使活塞向外无穷小移动，缸内气体无穷小冷却，因温差有无穷小热流入气体，这小能量使气体回到 $T$。系统可逆，因为在 $T$ 稍压缩气体，气体稍热，热流入热库。故仅考虑无穷小变化时，热流过程可逆。图 11.10 说明可逆等温膨胀。

<img src="/images/theoretical-concepts-in-physics/fig-11-10.png" alt="图 11.10：原书扫描页" loading="lazy" decoding="async" />

热库和活塞温度不同时显然不可能。不能以无穷小改变较冷物体温度来反转热流方向。这说明可逆过程里系统必须能由无穷平衡态演化，并以无穷小功和能量流增量连接。对绝热膨胀重述：气缸与宇宙其余部分完全热隔离，每一步无穷慢，无热流入或流出，无摩擦；每一无穷小步可逆，整个膨胀可由许多步骤相加完成。

与另两类膨胀相比，Joule 膨胀中气体进入大体积，必有各种非平衡过程；不像绝热和等温膨胀，不能设计一列平衡态达到末态。Joule-Kelvin 膨胀中气体进入第二缸时性质不连续，末态也非经无穷慢的一列平衡态达到。这一长引言强调，可逆过程高度理想化，却是比较所有实际过程的基准。上述“无限缓慢”实际是系统改变的时间尺度远大于系统内基本物理过程在膨胀每阶段重新建立热平衡所需时间。若足够小心，系统可接近理想行为。

### 11.5.2 Carnot 循环与热力学温度的定义

Clausius 的第二定律陈述是未经证明断言的另一“经验事实”：

> 不可能存在唯一结果为把热从较冷物体传至较热物体的过程。

这意味着不与系统环境相互作用，不能把热由冷体传给热体。注意此律假定可定义“较热”“较冷”，但目前仅有基于完全气体性质定义的经验温标。将证明它与热力学温标相同。

常识表明，摩擦等很易将功转为热，而设计有效的热转功手段困难得多，表 11.1 的蒸汽机效率说明了这一点。Carnot 对理想热机运行的深刻见解值得重述：

1. 高效热机中有循环使用的工作物质，以最小化热损失。
2. 所有实际热机中，热在高温 $T_1$ 进入工作物质，工作物质做功，然后向低温 $T_2$ 热阱返回热。
3. 最佳可能是构造所有过程可逆的热机，即所有改变无限慢，因而无摩擦、湍流等耗散损失。

这是真实热机运行的理想化。其实际原理的简单说明是 1816 年苏格兰基尔马诺克 Robert Stirling 牧师博士发明的 Stirling 热机（图 11.11）。工作物质空气充满粗线所示全体积。循环开始，热端加热器将气体加热至高温，图右活塞上推而成图 11.11 构型。空气后冷却，压强降到大气压以下，压差将活塞推回缸下。Stirling 巧妙发明是用图中排移器将工作物质从热源移至热阱。热气体接触由散热片或冷却管水流维持室温的冷端，向冷端放热，压强降低，活塞返回冲程发生。活塞连于排移器，排移器移至其气缸冷端，将冷却气体推向热端重新加热，下一动力冲程开始。精心设计时，Stirling 机效率可接近下述理论最大值。

<img src="/images/theoretical-concepts-in-physics/fig-11-11.png" alt="图 11.11：原书扫描页" loading="lazy" decoding="async" />

该操作序列几乎与 Carnot 1824 年论文所研究的完全相同。工作物质在温度 $T_1$ 热端获热，对活塞做功，后在温度 $T_2$ 冷端放热，再被加热，循环重新开始。

完美热机的 Carnot 著名操作循环如图 11.12(a)。Feynman《物理学讲义》第 1 卷第 44 章对循环有仔细描述，²⁰以下按其叙述。两个很大热库 1、2 保持 $T_1,T_2$；工作物质是含于无摩擦活塞气缸内的气体。进行如下可逆操作序列，模拟真实热机做功：

<img src="/images/theoretical-concepts-in-physics/fig-11-12.png" alt="图 11.12：原书扫描页" loading="lazy" decoding="async" />

1. 气缸同较高温 $T_1$ 热库热接触，极慢可逆等温膨胀。热自热库流入缸内气体；末态气体吸收热量 $Q_1$，工作物质对环境做一定功，对应 $p$-$V$ 示功图中 A 到 B。
2. 隔离气缸，使之脱离热库，进行无限慢绝热膨胀，工作物质由 $T_1$ 降至第二热库温度 $T_2$，过程可逆并再次对环境做功。
3. 气缸与 $T_2$ 第二热库热接触，缸内气体在 $T_2$ 无限慢可逆压缩。气体温度连续地无穷小地高于 $T_2$，热流入第二热库。热 $Q_2$ 回到第二热库，对工作物质做功；等温压缩继续到 $T_2$ 等温线与使工作物质回初态的绝热线相交。
4. 再隔离气缸，进行无限慢绝热压缩，使气体回原态；环境对工作物质做功，温度在绝热条件下升高。

这是理想热机操作序列。循环净效应是工作物质从 $T_1$ 热库 1 获热 $Q_1$，向 $T_2$ 热库 2 返回 $Q_2$，热机做功。功为环路积分 $W=\oint p\,dV$，等于 $p$-$V$ 示功图封闭曲线面积（图 11.13）。第一定律又表明功等于供给工作物质的净热 $Q_1-Q_2$：

<img src="/images/theoretical-concepts-in-physics/fig-11-13.png" alt="图 11.13：原书扫描页" loading="lazy" decoding="async" />

$$W=Q_1-Q_2.\tag{11.30}$$

顺带说，绝热线必比等温线陡，因为前者 $pV^\gamma=\text{常数}$ 且对所有气体 $\gamma>1$。图 11.14 给出此机器示意。

<img src="/images/theoretical-concepts-in-physics/fig-11-14.png" alt="图 11.14：原书扫描页" loading="lazy" decoding="async" />

论证优美之处是 Carnot 循环各阶段可逆，故可将全部动作反向运行（图 11.15）：(1) 从 A 到 D 绝热膨胀，工作物质由 $T_1$ 降至 $T_2$；(2) 在 $T_2$ 等温膨胀，从热库取热 $Q_2$；(3) 从 C 到 B 绝热压缩，回到 $T_1$；(4) 在 $T_1$ 等温压缩，工作物质向 $T_1$ 热库放热 $Q_1$。反向 Carnot 循环描述理想冰箱或热泵，热从低温热库抽取并送至高温热库（图 11.16）。注意反向循环须做功，才能从 $T_2$ 取热并送至 $T_1$。

<img src="/images/theoretical-concepts-in-physics/fig-11-16.png" alt="图 11.16：原书扫描页" loading="lazy" decoding="async" />

<img src="/images/theoretical-concepts-in-physics/fig-11-15.png" alt="图 11.15：原书扫描页" loading="lazy" decoding="async" />

现定义热机、冰箱、热泵效率。正向标准热机：

$$\eta=\frac{\text{一个循环所做功}}{\text{热输入}}=\frac W{Q_1}=\frac{Q_1-Q_2}{Q_1}.$$

冰箱：

$$\eta=\frac{\text{从热库 2 抽取的热}}{\text{所做功}}=\frac{Q_2}{W}=\frac{Q_2}{Q_1-Q_2}.$$

热泵反向运行，做功 $W$ 向 $T_1$ 供热 $Q_1$：

$$\eta=\frac{\text{向热库 1 供给的热}}{\text{所做功}}=\frac{Q_1}{W}=\frac{Q_1}{Q_1-Q_2}.$$

现可证明 Carnot 定理、说明 Clausius 和 Kelvin 的第二定律陈述等价，并导出热力学温度。

### 11.5.3 Carnot 定理

Carnot 定理说：

> 在两个给定温度间运行的所有热机中，没有任何热机能比可逆热机更有效率。

若反面成立，可构造一不可逆机，其效率大于同温度间可逆机。用不可逆机产生的功反向驱动可逆机（图 11.17），将两机合看为一机。不可逆机所产功全用于反向驱动可逆机。既然 $\eta_{\mathrm{irr}}>\eta_{\mathrm{rev}}$，则 $W/Q_1'>W/Q_1$，故 $Q_1-Q_1'>0$。合机唯一净效应是无功把能量从低温传至高温，为第二定律禁止。因此不可逆机效率不能超过同温间可逆机。这正是 Carnot 在 1824 年《反思》发表的定理，比 Clausius 1850 年正式陈述热力学定律早 26 年。

<img src="/images/theoretical-concepts-in-physics/fig-11-17.png" alt="图 11.17：原书扫描页" loading="lazy" decoding="async" />

### 11.5.4 Clausius 与 Kelvin 第二定律陈述的等价性

Kelvin 的第二定律陈述为：

> 不可能存在唯一结果为将热完全转化为功的过程。

若一 K 机可将热 $Q_1$ 完全转成功 $W$，可用此功反向驱动可逆 Carnot 机作热泵（图 11.18）。视作单一系统，无净功，送至 $T_1$ 热库的总热为

<img src="/images/theoretical-concepts-in-physics/fig-11-18.png" alt="图 11.18：原书扫描页" loading="lazy" decoding="async" />

$$Q_1-Q_1^K=Q_1-W=Q_1-(Q_1-Q_2)=Q_2,$$

其中 $Q_1^K$ 是供给假设 Kelvin 机且完全转为 $W$ 的热。因此无宇宙任何其他变化而有净热 $Q_2$ 传至 $T_1$ 热库，这为 Clausius 陈述禁止，故两陈述等价。

### 11.5.5 热力学温度

终于可定义热力学温度，线索来自 Carnot 定理。两温度间可逆热机有最大效率 $\eta$，它是两个至今未定义而称 $T_1,T_2$ 的温度的唯一函数。以热输入、输出写：

$$\eta=\frac{Q_1-Q_2}{Q_1},\qquad \frac{Q_1}{Q_2}=\frac1{1-\eta}.\tag{11.31}$$

更精确地说，令 $Q_1/Q_2$ 为经验温度 $\theta_1,\theta_2$ 的函数 $f(\theta_1,\theta_2)$。如图 11.19 串联两热机：温度 $\theta_2$ 输出的热供给第二热机 $Q_2$，第二机做功 $W_2$ 并向 $\theta_3$ 热库传 $Q_3$，故

<img src="/images/theoretical-concepts-in-physics/fig-11-19.png" alt="图 11.19：原书扫描页" loading="lazy" decoding="async" />

$$\frac{Q_1}{Q_2}=f(\theta_1,\theta_2),\qquad\frac{Q_2}{Q_3}=f(\theta_2,\theta_3).\tag{11.32}$$

将合系统视为 $\theta_1,\theta_3$ 间单机：$\frac{Q_1}{Q_3}=f(\theta_1,\theta_3)$。\tag{11.33} 因为 $Q_1/Q_3=(Q_1/Q_2)(Q_2/Q_3)$，所以

$$f(\theta_1,\theta_3)=f(\theta_1,\theta_2)f(\theta_2,\theta_3).\tag{11.34}$$

故 $f$ 必有形式

$$f(\theta_1,\theta_3)=\frac{g(\theta_1)}{g(\theta_3)}=\frac{g(\theta_1)}{g(\theta_2)}\frac{g(\theta_2)}{g(\theta_3)}.\tag{11.35}$$

取符合要求的热力学温度定义：

$$\frac{g(\theta_1)}{g(\theta_3)}=\frac{T_1}{T_3},\qquad\text{即}\qquad\frac{Q_1}{Q_3}=\frac{T_1}{T_3}.\tag{11.36}$$

可证明它与完全气体温标相同。写完全气体温标为 $T^P$，则 $pV=RT^P$。完全气体 Carnot 循环由 (11.29)：

$$Q_1=\int_A^Bp\,dV=RT_1^P\ln\frac{V_B}{V_A},\qquad Q_2=\int_D^Cp\,dV=RT_2^P\ln\frac{V_C}{V_D}.\tag{11.37}$$

循环绝热支上 $pV^\gamma=\text{常数}$、$T^PV^{\gamma-1}=\text{常数}$。\tag{11.38} 因而

$$\left(\frac{V_B}{V_A}\right)^{\gamma-1}=\frac{T_2^P}{T_1^P},\qquad\left(\frac{V_D}{V_C}\right)^{\gamma-1}=\frac{T_1^P}{T_2^P}.\tag{11.39}$$

相乘得 $V_BV_D/(V_AV_C)=1$。\tag{11.40} 即 $V_B/V_A=V_C/V_D$。\tag{11.41} 故由 (11.37)、(11.36)：

$$\frac{Q_1}{Q_2}=\frac{T_1^P}{T_2^P}=\frac{T_1}{T_2}.\tag{11.42}$$

至此由完美热机运行，沿 Carnot 开创的思路，严格导出温度的热力学定义。现在最大效率可用其工作温度的热力学温度写成：

$$
\begin{gathered}
\text{热机：}\quad\eta=\frac{Q_1-Q_2}{Q_1}=\frac{T_1-T_2}{T_1},\\
\text{冰箱：}\quad\eta=\frac{Q_2}{Q_1-Q_2}=\frac{T_2}{T_1-T_2},\\
\text{热泵：}\quad\eta=\frac{Q_1}{Q_1-Q_2}=\frac{T_1}{T_1-T_2}.
\end{gathered}\tag{11.43}
$$

## 11.6 熵

为定义热力学温度所导出的关系有一点很特别。取 $Q_1,Q_2$ 为正量，(11.42) 给出

$$\frac{Q_1}{T_1}-\frac{Q_2}{T_2}=0.\tag{11.44}$$

可改写为

$$\int_A^C\frac{\delta Q}{T}-\int_C^A\frac{\delta Q}{T}=0.\tag{11.45}$$

因为图 11.12 Carnot 循环中仅等温段供、移热，且这些段可逆，故从 A 到 C 无论经循环哪一支：

$$\left.\int_A^C\frac{\delta Q}{T}\right|_{\text{经 B}}=\left.\int_A^C\frac{\delta Q}{T}\right|_{\text{经 D}}.\tag{11.46}$$

这强烈暗示发现另一状态函数。任一双坐标系统，在示功图任意两点间可用大量小 Carnot 循环移动，且均可逆（图 11.20），无论何路径总得同结果。数学上任意 A、B：

<img src="/images/theoretical-concepts-in-physics/fig-11-20.png" alt="图 11.20：原书扫描页" loading="lazy" decoding="async" />

$$\int_A^B\frac{\delta Q}{T}=\text{常数}.\tag{11.47}$$

积分形式：

$$\int_A^B\frac{\delta Q}{T}=\text{常数}=S_B-S_A.\tag{11.48}$$

新状态函数 $S$ 称为系统的熵。它为连接 A、B 的可逆过程定义。$T$ 指向系统供热时的温度，此处等于系统自身温度，因为热交换可逆进行。关于热质与热本质争议有一个有趣注脚：某种意义上熵是 Carnot 的热质流体，因为 Carnot 循环中守恒的是熵而非热。

任一实际机的效率小于同温度的理想 Carnot 机，故

$$\eta_{\mathrm{irr}}\leq\eta_{\mathrm{rev}},\qquad \frac{Q_1-Q_2}{Q_1}\leq\frac{Q_1^{(\mathrm{rev})}-Q_2^{(\mathrm{rev})}}{Q_1^{(\mathrm{rev})}}.$$

因此 $Q_2/Q_1\geq Q_2^{(\mathrm{rev})}/Q_1^{(\mathrm{rev})}=T_2/T_1$，即 $Q_2/T_2\geq Q_1/T_1$。所以绕循环：

$$\oint\frac{\delta Q}{T}\leq0.\tag{11.49}$$

其中 $\delta Q$ 是实际循环的热输入和热取出。等号仅用于可逆热机。热进入系统取正，移出取负。$\oint\delta Q/T\leq0$ 是整个热力学的基本关系，称 Clausius 定理。该证明足够当前用途，但局限是只适用于双坐标系统；一般需处理多坐标系统。Pippard 的书很好地表明多坐标系统仍有同一结果。

## 11.7 熵增定律

熵变定义为从 A 到 B 的可逆变化序列。实际不完美世界中从 A 到 B 永不可能精确可逆，所涉热因而不直接联系初末态熵差。比较两态间可逆、不可逆变化。设从 A 到 B 有不可逆变化（图 11.21），再取任一可逆路径由 B 回 A 完成循环。由 Clausius 定理：

<img src="/images/theoretical-concepts-in-physics/fig-11-21.png" alt="图 11.21：原书扫描页" loading="lazy" decoding="async" />

$$\oint\frac{\delta Q}{T}\leq0\quad\text{或}\quad\left.\int_A^B\frac{\delta Q}{T}\right|_{\mathrm{irrev}}+\left.\int_B^A\frac{\delta Q}{T}\right|_{\mathrm{rev}}\leq0,$$

即

$$\left.\int_A^B\frac{\delta Q}{T}\right|_{\mathrm{irrev}}\leq\left.\int_A^B\frac{\delta Q}{T}\right|_{\mathrm{rev}}.$$

第二个变化可逆，按熵定义 $\left.\int_A^B\delta Q/T\right|_{\mathrm{rev}}=S_B-S_A$，所以

$$\left.\int_A^B\frac{\delta Q}{T}\right|_{\mathrm{irrev}}\leq S_B-S_A,$$

或写为微分不可逆变化：

$$\frac{\delta Q}{T}\leq\Delta S.\tag{11.50}$$

这给出任意微分变化的普遍结果，等号只在可逆变化时成立。这是关键结果，终于可定量理解决定物理过程演化方向的因素。可逆过程里供热温度即系统温度；不可逆过程不必如此。

孤立系统不与外宇宙热接触，故上式 $\delta Q=0$，从而

$$\Delta S\geq0.\tag{11.51}$$

因此孤立系统熵不能减少。推论是，趋近平衡时孤立系统熵须趋于最大，末平衡构型是熵最大者。例如温度 $T_1,T_2$ 的两物体交换小热量 $\Delta Q$。热从较热体流至较冷体，较热体熵减 $\Delta Q/T_1$，较冷体熵增 $\Delta Q/T_2$，总熵变 $(\Delta Q/T_2)-(\Delta Q/T_1)>0$，为正，确认热流方向的推断。

此前仅处理孤立系统。现考虑系统与环境热接触。先使系统经历完整循环，终态恰同初态，即使含实际系统中的不可逆过程。所有状态函数相同，故系统 $\Delta S=0$。由 Clausius 定理，$0=\Delta S\geq\oint\delta Q_{\mathrm{sys}}/T$。为回初态，热须由环境传至系统。最佳情况是与环境可逆传热，每阶段 $\delta Q_{\mathrm{sys}}=-\delta Q_{\mathrm{surr}}$，故

$$0=\Delta S\geq\oint\frac{\delta Q_{\mathrm{sys}}}{T}=-\oint\frac{\delta Q_{\mathrm{surr}}}{T}.$$

环境热传递可逆，最后一量可等于 $\Delta S_{\mathrm{surr}}$，得 $0\leq-\Delta S_{\mathrm{surr}}$ 或 $\Delta S_{\mathrm{surr}}\geq0$。系统熵本身虽未变，环境熵增加，故全宇宙熵增加。

再考虑从状态 1 到 2 的不可逆变化，仍假定与环境传热可逆：

$$\Delta S_{\mathrm{sys}}\geq\int_1^2\frac{\delta Q_{\mathrm{irr}}}{T}=-\int\frac{\delta Q_{\mathrm{surr}}}{T}=-\Delta S_{\mathrm{surr}},$$
$$\Delta S_{\mathrm{sys}}+\Delta S_{\mathrm{surr}}\geq0.$$

这些例子表明，循环含不可逆过程时，虽系统熵未必改变，整个宇宙熵已增加。这类论证必须考虑环境及系统。

它们说明 Clausius 于 1865 年从希腊语“变换”一词创造 entropy 一词所作两条热力学定律的通俗表述：(1) 宇宙能量不变。(2) 宇宙熵趋于最大。熵变不必含热交换，它量度过程不可逆性。完全气体的 Joule 膨胀是好例，气体充满较大体积且不做功，其内能 $U$ 因而温度 $T$ 恒定。温度 $T$ 完全气体从 A 到 B 的熵变为 $\int_A^B\delta Q/T$。现在 $\delta Q=dU+p\,dV$，每摩尔：

$$\delta Q=C_VdT+\frac{RT}{V}dV.$$

故

$$\int_A^B\frac{\delta Q}{T}=C_V\int_A^B\frac{dT}{T}+R\int_A^B\frac{dV}{V},$$

即

$$S-S_0=C_V\ln\frac{T}{T_0}+R\ln\frac{V}{V_0}.\tag{11.52}$$

Joule 膨胀中 $T=\text{常数}$，所以

$$S-S_0=R\ln\frac{V}{V_0}.\tag{11.53}$$

虽无热流，系统经历不可逆改变，从旧平衡态达新平衡态必有熵增加。式 (11.53) 是关键结果，将在量子概念起源研究中再遇到。熵增也同系统可及真实空间体积变化相关；第 12 章将对更一般相空间给出相应结果。最后将完全气体熵变写成有趣形式。由 (11.52)：

$$
\begin{gathered}
S-S_0=C_V\ln\frac{pV}{p_0V_0}+R\ln\frac V{V_0},\\
S-S_0=C_V\ln\frac p{p_0}+(C_V+R)\ln\frac V{V_0},\\
S-S_0=C_V\ln\frac{pV^\gamma}{p_0V_0^\gamma}.
\end{gathered}\tag{11.54}
$$

其中 $\gamma=(C_V+R)/C_V$。故绝热膨胀若 $pV^\gamma=\text{常数}$，熵变为零。因此绝热膨胀常称等熵膨胀。它还给出熵函数的解释：等温线是常温曲线，绝热线是常熵曲线。

## 11.8 第一、第二定律合并的微分形式

终于到达综合第一和第二定律物理内容的方程。对可逆过程，$dS=\delta Q/T$，结合 $\delta Q=dU+p\,dV$，有

$$TdS=dU+p\,dV.\tag{11.55}$$

更一般地，若系统所受功写为 $\sum_iX_i\,dx_i$，则

$$TdS=dU+\sum_iX_i\,dx_i.\tag{11.56}$$

这公式显著之处是完全用状态函数综合两条定律，故对所有变化成立。故事不再展开，但 (11.55)、(11.56) 是之后需要的有力结果之源。特别地，对任一气体：

$$\left(\frac{\partial S}{\partial U}\right)_V=\frac1T.\tag{11.57}$$

即定体积下熵对 $U$ 的偏导定义热力学温度 $T$。这在统计力学中特别重要，因为统计力学发展早期即引入熵 $S$，而内能 $U$ 是最先须统计确定的量之一。因此已有在统计力学中定义温度的关键关系。

## 第 11 章附录：Maxwell 关系与 Jacobian

本附录包含处理经典热力学问题有用的数学工具，以下不企求完整或数学严密。

### A11.1 热力学中的全微分

全微分自然出现于经典热力学，因为大部分讨论涉及双坐标系统，热力学平衡态完全由两个状态函数定义。系统由一平衡态变到另一平衡态时，任一状态函数的改变只依赖初末坐标。若状态函数 $z$ 完全由另两个状态函数 $x,y$ 定义，则状态微分为

$$dz=\left(\frac{\partial z}{\partial x}\right)_ydx+\left(\frac{\partial z}{\partial y}\right)_xdy.\tag{A11.1}$$

微分 $dz$ 不依赖作 $dx,dy$ 增量的方式，从而限制 $z$ 对 $x,y$ 的函数依赖。图 A11.1 中从 A 到 C 可经 D 或 B。因为 $z$ 是状态函数，沿 ABC 与 ADC 的 $dz$ 必相同。沿 ADC，先沿 $x$ 方向走 $dx$，再从 $x+dx$ 点走 $dy$：

$$z(C)=z(A)+\left(\frac{\partial z}{\partial x}\right)_ydx+\left[\left(\frac{\partial z}{\partial y}\right)_x+\frac{\partial}{\partial y}\left(\frac{\partial z}{\partial x}\right)_ydx\right]dy$$
$$=z(A)+\left(\frac{\partial z}{\partial x}\right)_ydx+\left(\frac{\partial z}{\partial y}\right)_xdy+\frac{\partial^2z}{\partial y\partial x}dx\,dy.\tag{A11.2}$$

其中 $\partial^2z/\partial y\partial x$ 指 $\left[\frac\partial{\partial y}\left(\frac{\partial z}{\partial x}\right)_y\right]_x$。沿 ABC：

$$z(C)=z(A)+\left(\frac{\partial z}{\partial y}\right)_xdy+\left(\frac{\partial z}{\partial x}\right)_ydx+\frac{\partial^2z}{\partial x\partial y}dx\,dy.\tag{A11.3}$$

在 (A11.2)、(A11.3) 中双偏导的顺序重要。两式必须相同，故

$$\frac{\partial^2z}{\partial y\partial x}=\frac{\partial^2z}{\partial x\partial y},\qquad \frac\partial{\partial y}\left(\frac{\partial z}{\partial x}\right)_y=\frac\partial{\partial x}\left(\frac{\partial z}{\partial y}\right)_x.\tag{A11.4}$$

这是 $z$ 是 $x,y$ 的全微分的数学条件。

### A11.2 Maxwell 关系

已引入许多状态函数：$p,V,T,S,U,H$ 等，还可由组合定义无穷多个。系统状态有微分变化时，所有状态函数相应变化。四个最重要的此类微分关系称 Maxwell 关系。先导出其中两个。式 (11.55) 连接 $S,U,V$ 的微分变化：

$$TdS=dU+p\,dV,\qquad dU=TdS-p\,dV.\tag{A11.5}$$

$dU$ 是状态函数微分，必为全微分：

$$dU=\left(\frac{\partial U}{\partial S}\right)_VdS+\left(\frac{\partial U}{\partial V}\right)_SdV.\tag{A11.6}$$

同 (A11.5) 比较：

$$T=\left(\frac{\partial U}{\partial S}\right)_V;\qquad p=-\left(\frac{\partial U}{\partial V}\right)_S.\tag{A11.7}$$

又由 (A11.4)：

$$\frac\partial{\partial V}\left(\frac{\partial U}{\partial S}\right)_V=\frac\partial{\partial S}\left(\frac{\partial U}{\partial V}\right)_S.\tag{A11.8}$$

代入 (A11.7)：

$$\left(\frac{\partial T}{\partial V}\right)_S=-\left(\frac{\partial p}{\partial S}\right)_V.\tag{A11.9}$$

这是 $T,S,p,V$ 四个类似关系的第一个。对焓：

$$H=U+pV,\qquad dH=dU+p\,dV+Vdp=TdS+Vdp.\tag{A11.10}$$

同样程序给出

$$\left(\frac{\partial T}{\partial p}\right)_S=\left(\frac{\partial V}{\partial S}\right)_p.\tag{A11.11}$$

对另两个重要状态函数 Helmholtz 自由能 $F=U-TS$ 和 Gibbs 自由能 $G=U-TS+pV$ 重复分析，得另外两个 Maxwell 关系：

$$\left(\frac{\partial S}{\partial V}\right)_T=\left(\frac{\partial p}{\partial T}\right)_V,\tag{A11.12}$$
$$\left(\frac{\partial V}{\partial T}\right)_p=-\left(\frac{\partial S}{\partial p}\right)_T.\tag{A11.13}$$

$F,G$ 分别特别适用于恒温和恒压过程。(A11.9)、(A11.11)、(A11.12)、(A11.13) 称 Maxwell 关系，在许多热力学问题中很有用，后续章节还将使用。可用 Jacobian 作为记忆它们的口诀。

### A11.3 热力学中的 Jacobian

Jacobian 出现在不同坐标系统间变换微分乘积。例如体积元 $dV=dx\,dy\,dz$ 变换到坐标微分为 $du,dv,dw$ 的系统，体积元为

$$dV_{uvw}=\left|\frac{\partial(x,y,z)}{\partial(u,v,w)}\right|du\,dv\,dw,\tag{A11.14}$$

其中 Jacobian 定义为²¹

$$\frac{\partial(x,y,z)}{\partial(u,v,w)}=\begin{vmatrix}\frac{\partial x}{\partial u}&\frac{\partial y}{\partial u}&\frac{\partial z}{\partial u}\\\frac{\partial x}{\partial v}&\frac{\partial y}{\partial v}&\frac{\partial z}{\partial v}\\\frac{\partial x}{\partial w}&\frac{\partial y}{\partial w}&\frac{\partial z}{\partial w}\end{vmatrix}.\tag{A11.15}$$

对 Maxwell 方程只需双坐标版本。若 $x,y,u,v$ 相关：

$$\begin{cases}x=x(u,v),\\y=y(u,v),\end{cases}\tag{A11.16}$$

Jacobian 定义为行列式

$$\frac{\partial(x,y)}{\partial(u,v)}=\begin{vmatrix}\frac{\partial x}{\partial u}&\frac{\partial y}{\partial u}\\\frac{\partial x}{\partial v}&\frac{\partial y}{\partial v}\end{vmatrix}.\tag{A11.17}$$

由行列式性质容易证明

$$\frac{\partial(x,y)}{\partial(x,y)}=-\frac{\partial(y,x)}{\partial(x,y)}=1,$$
$$\frac{\partial(v,v)}{\partial(x,y)}=0=\frac{\partial(k,v)}{\partial(x,y)}\quad(k\text{ 为常数}),\tag{A11.18}$$
$$\frac{\partial(u,v)}{\partial(x,y)}=-\frac{\partial(v,u)}{\partial(x,y)}=\frac{\partial(-v,u)}{\partial(x,y)}=\frac{\partial(v,-u)}{\partial(x,y)},$$

等等。分母的变换也有相似规则。特别是

$$\frac{\partial(u,y)}{\partial(x,y)}=\left(\frac{\partial u}{\partial x}\right)_y,\tag{A11.19}$$
$$\frac{\partial(u,v)}{\partial(x,y)}=\frac{\partial(u,v)}{\partial(r,s)}\frac{\partial(r,s)}{\partial(x,y)}=\frac1{\partial(x,y)/\partial(u,v)},\tag{A11.20}$$
$$\left(\frac{\partial y}{\partial x}\right)_z\left(\frac{\partial z}{\partial y}\right)_x\left(\frac{\partial x}{\partial z}\right)_y=-1.\tag{A11.21}$$

Riley、Hobson、Bence 给出等同 (A11.17) 至 (A11.21) 的一般 $n$ 坐标关系。²² Jacobian 记号的价值在于可将四个 Maxwell 方程紧凑写作

$$\frac{\partial(T,S)}{\partial(x,y)}=\frac{\partial(p,V)}{\partial(x,y)},\tag{A11.22}$$

其中 $x,y$ 为不同变量。举例，依 (A11.19)，Maxwell 关系

$$\left(\frac{\partial T}{\partial V}\right)_S=-\left(\frac{\partial p}{\partial S}\right)_V\tag{A11.23}$$

恰等同于

$$\frac{\partial(T,S)}{\partial(V,S)}=-\frac{\partial(p,V)}{\partial(S,V)}=\frac{\partial(p,V)}{\partial(V,S)}.\tag{A11.24}$$

将 $T,S,p,V$ 的四个适当组合放进 (A11.22) 分母，即生成四个 Maxwell 关系。依 (A11.20)，(A11.22) 恰等于

$$\frac{\partial(T,S)}{\partial(p,V)}=1.\tag{A11.25}$$

(A11.25) 是记住全部四关系的关键。只须记得 $T,S,p,V$ 按上述顺序写出时 Jacobian 为 $+1$。一种记忆法是，强度变量 $T,p$ 与广度变量 $S,V$ 在分子、分母中同序出现时符号为正。

## 注释

1. Allen, H. S. and Maxwell, R. S. (1939). *A Text-book of Heat*, Parts I and II. London: MacMillan & Co. 该书含本章所用出色历史资料和引文，以及奠定经典热力学的许多实验的极佳插图。
2. Allen and Maxwell (1939), *A Text-book of Heat*, Part I, p. 12. London: MacMillan & Co.
3. Allen and Maxwell (1939), 前引书, p. 14.
4. Allen and Maxwell (1939), 前引书, p. 14.
5. Allen and Maxwell (1939), 前引书, pp. 14 至 15.
6. Lavoisier, A. (1789). *Traité Élémentaire de Chimie, présenté dans un ordre nouveau, et d’après des découvertes modernes*, 第 1 版。Paris: Cuchet, Libraire.
7. Brown, G. I. (1999). *Scientist, Soldier, Statesman, Spy: Count Rumford*. Stroud, Gloucestershire, UK: Sutton Publishing.
8. Fourier, J. B. J. (1822). *Analytical Theory of Heat*, A. Freeman 译（1955 年纽约重印版）。
9. Joule, J. P. (1843). 见 *The Scientific Papers of James Prescott Joule*, 2 卷。London, 1884 至 1887（1963 年伦敦重印）。
10. Allen and Maxwell (1939), 前引书, p. 288.
11. Allen and Maxwell (1939), 前引书, p. 288.
12. Harman, P. M. (1952). *Energy, Force and Matter: The Conceptual Development of Nineteenth Century Physics*, p. 45. Cambridge: Cambridge University Press.
13. Pippard, A. B. (1966). *The Elements of Classical Thermodynamics*. Cambridge: Cambridge University Press.
14. Allen and Maxwell (1939), 前引书, Vol. II, p. 575.
15. Forbes, R. J. (1958). 载 *A History of Technology*, Vol. IV, eds. C. Singer, E. J. Holmyard, A. R. Hall and T. I. Williams, p. 165. Oxford: Clarendon Press.
16. 工业革命中蒸汽机发展的优秀文章，见 R. J. Forbes、H. W. Dickenson，载 *A History of Technology*, Vol. IV, eds. C. Singer, E. J. Holmyard, A. R. Hall and T. I. Williams (1958). Oxford: Clarendon Press.
17. Forbes, R. J. (1958), 前引书, p. 164.
18. Carnot, N. L. S. (1924). *Réflexions sure la Puissance Motrice du Feu et sur les Machine Propres à Développer cette Puissance*. Paris: Bachelier.
19. Peter Harman 的权威研究提供本章讨论的许多理论问题之思想背景历史的关键材料。Harman, P. M. (1982). *Energy, Force and Matter: The Conceptual Development of Nineteenth Century Physics*. Cambridge: Cambridge University Press.
20. Feynman, R. P. (1963). *The Feynman Lectures on Physics*, Vol. 1, eds. R. P. Feynman, R. B. Leighton and M. Sands, Chapter 44. Redwood City, California: Addison-Wesley Publishing Co.
21. 见 Riley, K. F., Hobson, M. P. and Bence, S. J. (2006). *Mathematical Methods for Physics and Engineering*, 第 3 版，pp. 200 至 207. Cambridge: Cambridge University Press.
22. 见 Riley, Hobson and Bence (2006), 前引书, pp. 200 至 207.

</div>
