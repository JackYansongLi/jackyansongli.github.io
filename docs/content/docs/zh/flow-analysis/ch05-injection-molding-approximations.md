---
title: 第 5 章：注塑成型近似方法
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

# 第5章 注塑成型的近似方法

## 5.1 引言

第4章给出的方程具有相当的普遍性，构成了一个用于注塑成型的非常完整的模型。本章我们考虑一些可以引入的近似，以便对成型过程进行模拟。可用的近似方法有很多，每一种都会影响精度、计算速度以及求解所用数值方法的选择。需要注意的是，近似来源于材料建模、控制方程以及求解所用的数值方法。因此，在每一个模拟程序中，都存在材料模型、数学模型（一组带有适当边界条件的待求解方程），以及某种用于获得解的数值方法。

无论做了哪些近似，事实是型腔中每一点的温度和压力都需要确定。这与许多标准的流体力学和流变学问题不一致，在那些问题中温度常被忽略，而且要求确定的是应力而非压力。在工厂层面，注塑成型过程取决于流量、温度和压力。这些是注塑机上可以修改的设定参数，因此商业模拟程序必须与这些变量相关联。

另一个重要问题出现在对模拟该过程的程序进行验证（validation）与确认（verification）时 [272, 310]。简言之，验证关注模型对某一过程的适用性，而确认关注计算在某一具体程序中实现得有多好。这两方面都可能难以评估。验证通常涉及实验获得的真实结果与模拟结果之间的比较。对于商业程序的最终用户而言，只能做有限的确认工作，例如系统的网格细化测试；除非开发者允许访问程序的某些部分，否则通常很难确认程序的正确性，除非存在明显错误。很少有商业公司提供这种访问权限。因此，许多商业程序的潜在购买者只能通过做实验并运行模拟来判断二者是否一致。

在进行实验时，潜在购买者假定所用的数学模型是合适的并且被正确实现。对于生产条件下的注塑成型，可测量的变量是温度、流动前沿位置以及压力。人们已构建出专门的模具来评估这些方面 [76, 233]。虽然这提供了充填阶段的基本信息，但有些人会试图将实验中观察到的制品收缩和翘曲与模拟结果进行比较。这是一项困难的任务，想要这样做的人必须具备相当的实验经验和资源。我们这里要指出的是，验证一个注塑成型程序并不是一件轻而易举的事。

本章我们将考察注塑模拟中所使用的近似。这些近似会影响模拟准确预测实验结果的能力。我们并不声称这就是全部内容。希望这只是写作时该领域状况的一个快照。模拟还有许多方面有待改进。这些改进会随时间推移而出现，我们将在本书第二部分介绍一些潜在的改进方向。

## 5.2 材料属性近似

由于缺乏认识以及无法对材料属性建模，材料属性通常会被简化。本节我们讨论模拟软件中常见的材料假设。根据所进行的分析来讨论这些属性是方便的。

模拟注塑成型所需的材料属性取决于所要进行的模拟。对于流动分析（充填、保压和冷却），需要以下属性：

- 热源项
- 粘度
- 比热容
- 热导率
- 不流动温度或转变温度
- PVT 数据

如果用户想要模拟收缩和翘曲，还需要额外的属性，例如：

- 弹性模量
- 剪切模量
- 热膨胀系数
- 模拟软件还可能需要针对特定模型的专门数据

下面我们讨论这些假设。

## 5.3 充填、保压与冷却分析

所需的属性为：

- 热源项
- 粘度
- 比热容
- 热导率
- 不流动温度或转变温度
- PVT 数据

### 5.3.1 能量方程中的热源项

对于热固性材料，反应热相当可观，热源项必不可少。我们的重点是热塑性塑料，因此这里忽略反应热。

半结晶材料在凝固时会释放出一些热量，这一点应当加以考虑。然而，很少有模拟处理结晶问题，尽管它是当前的一个研究领域。目前我们忽略它，并在本书第二部分再回过头来讨论。目前我们假设

$$\dot{Q} = 0 \tag{5.1}$$

### 5.3.2 粘度建模

我们假设熔体为广义牛顿流体（GNF），见第 2.3 节。即

$$\boldsymbol{\sigma} = -p\mathbf{I} + 2\eta(\dot{\gamma})\mathbf{D} \tag{5.2}$$

这会改变方程 4.23 和 4.67 中的 $\nabla \cdot \boldsymbol{\sigma}$ 项和 $\boldsymbol{\sigma} : \nabla \mathbf{v}$ 项。利用方程 2.19，我们有

$$\nabla \cdot \boldsymbol{\sigma} = \nabla \cdot (-p\mathbf{I} + 2\eta\mathbf{D}) = -\nabla p + 2\nabla \cdot \eta\mathbf{D} \tag{5.3}$$

聚合物熔体本质上是粘弹性的。然而对于注塑模拟而言，GNF 假设可以提供有用的结果。对一个注塑模具进行完整的粘弹性分析会引出一系列问题。首先是粘弹性模型本身。在过去 40 年中，这类模型的发展取得了一些重大进展。然而，任何模型都必须根据它给注塑模拟带来的改进来加以评估。不管这些模型的价值如何，即使在简单几何形状中，它们也把我们的计算能力推到了极限。对于复杂的模具，它们今天根本不可行。这并非全是坏事。Baaijens [21] 为预测无定形注塑制品的分子取向、收缩和翘曲提供了一种合理的近似，我们将在本章后面讨论。在许多商业程序中，这种近似已被应用于半结晶材料。然而半结晶材料更为复杂，值得更细致的处理。我们暂且搁置这个主题，留待本书第二部分讨论。现在我们来考虑材料为 GNF 的假设。

为此，考虑 $\boldsymbol{\sigma} : \nabla\mathbf{v}$ 项：

$$
\begin{aligned}
\boldsymbol{\sigma} : \nabla\mathbf{v} &= (-p\mathbf{I} + 2\eta\mathbf{D}) : \nabla\mathbf{v} \\
&= -p\mathbf{I} : \nabla\mathbf{v} + 2\eta\mathbf{D} : \nabla\mathbf{v} \\
&= -p\nabla \cdot \mathbf{v} + \eta\left(\nabla\mathbf{v} + (\nabla\mathbf{v})^T\right) : \nabla\mathbf{v} \\
&= -p\nabla \cdot \mathbf{v} + \frac{\eta}{2}\left(\nabla\mathbf{v} + (\nabla\mathbf{v})^T\right) : \left(\nabla\mathbf{v} + (\nabla\mathbf{v})^T\right) \\
&= -p\nabla \cdot \mathbf{v} + 2\eta\,\mathbf{D} : \mathbf{D} \\
&= -p\nabla \cdot \mathbf{v} + \eta\dot{\gamma}^2
\end{aligned}
$$

其中在最后一步我们使用了方程 2.17。

### 5.3.3 比热容

比热容可以方便地通过差示扫描量热法（DSC）获得。问题在于，由于测量仪器的构造，它是在相对缓慢的温度变化条件下测得的。在注塑成型中，温度变化（冷却）速率可能非常高，从而引入一定的误差。对于无定形聚合物，这些误差可能不太重要，但对于半结晶材料，误差是显著的。有些程序可能允许在熔体区和固体区使用不同的比热值。然而，还需要引入冷却速率。换言之，对于半结晶聚合物，比热容需要与材料的结晶动力学相耦合。我们将在第 11.3 节讨论这个问题。

### 5.3.4 热导率

正如我们在第 3.7.2 节所见，聚合物的热导率相对较低。低热导率使该属性的实验测量变得困难。线源测量法已成为常规方法 [229]，不过 Schieber 等人 [322] 还开发了一些更复杂的方法。无定形和半结晶聚合物都表现出热导率随温度升高而增大的趋势。压力也影响热导率。Dawson 等人 [75] 表明，无定形和半结晶材料的热导率都随压力增大而增大。

许多模拟程序对无定形和半结晶材料使用单一数值。而且，这些数值被假定为标量。我们对这些假设提出质疑，并在第二部分提供一些细节来支持我们的观点，并指出建模可以如何改进。目前我们简要评述这些假设在三个类别中的不足：

1. 未填充无定形材料
2. 未填充半结晶材料
3. 填充聚合物

#### 5.3.4.1 未填充无定形材料

这类材料被认为是最简单的，大量文献致力于研究它们的属性。然而，在实验室用科学仪器测得的属性是在与注塑成型截然不同的条件下确定的。对无定形材料采用单一热导率值的假设，在几十年前也许还是成立的。自那以后，制品壁厚变得更薄。消费电子，特别是个人电子产品，如手机、笔记本电脑及其他设备，引领了制品变薄的趋势。因此，无定形聚合物正承受着极高的压力和剪切速率。在一篇可能具有先见之明的论文中，van den Brule [374] 提出分子取向可能使无定形聚合物的热导率产生各向异性。特别地，他的理论认为沿聚合物主链方向的热导率提高，而横向（厚度方向）的热导率降低。分子主链取向一般沿剪切方向。因此他的理论表明，垂直于流动方向的热导率可能降低。Schieber 等人 [322] 和 Venerus 等人 [385] 提供了支持这一概念的一些实验证据。

#### 5.3.4.2 未填充半结晶材料

半结晶材料的大多数属性在转变温度处会发生变化。跨越转变区的热导率测量会显示出材料凝固时热导率的增大。然而，测量技术未能考虑成型过程中形成的形态以及由此带来的属性变化。在对属性发展尚无全面认识之前，所能做的最好的办法是对熔体相和固相分别使用两个热导率值，理想情况下它们应是温度的函数。

#### 5.3.4.3 填充材料

无定形和半结晶材料常用的填料是短玻璃纤维。S2 型玻璃纤维的热导率为 1.10–1.40 W/(m·K)，至少是聚合物的三倍。半结晶材料中玻璃含量按重量计高达 60% 的情况并不少见。鉴于玻璃的热导率更高，我们认为玻璃纤维的取向可能使热导率呈张量形式。我们将在本书第二部分进一步研究这个问题，但在此指出，热导率为标量的假设应当受到质疑。

### 5.3.5 不流动温度或转变温度

在第 3.6.6 节中我们指出，当材料开始冷却为固体时，任何具有 WLF 或 Arrhenius 温度依赖性的粘度函数都无法再现其粘度。在注塑模拟中，这一困难通过引入不流动温度或转变温度来克服。转变温度是这样一个温度：在该温度下，模拟中的材料被假定不再流动。换言之，低于"转变温度"时，材料具有极高的粘度，被假定为固体。

不流动温度多年前由 Moldflow 引入，其测量方法是：在给定压力下让材料通过毛细管挤出，同时降低温度。当挤出速率降至某一规定速率以下时，测得一个温度即为不流动温度。这种技术或许有其合理性，因为后来发现变形和温度都在半结晶材料的结晶以及凝固过程中起作用。然而，模拟中结晶与凝固之间并没有建立联系。转变温度的测量通常在差示扫描量热仪（DSC）上进行。该方法的拥护者认为它比不流动测试重复性更好。这或许是真的，但 DSC 测试是静态的，没有流体运动。因此它对半结晶材料是无效的，尽管对无定形材料可能重复性更好。我们不打算为其中任何一种方法辩护。两者都有局限性，都会导致误差。相反，我们建议对材料属性进行更全面的建模，对无定形和半结晶材料都是如此。

在计算机模拟中，不流动温度或转变温度是通过以下方式实现的：当材料温度降至转变温度以下时，赋予其粘度一个极高的值。图 5.1 说明了这一点。

对于无定形材料，由此产生的误差小于半结晶材料。然而，对于半结晶材料，使用单一转变温度是说不通的。实际上，半结晶材料在冷却条件下粘度会非常快增大，但这并非唯一的复杂因素。温度下降速率会影响结晶，进而影响粘度。这一点人们多年前就已知晓。如果半结晶材料以很快的速率冷却，它可能在低于所测转变温度的条件下继续流动。这就是被称为过冷的现象。也就是说，在其他条件相同的情况下，以某一冷却速率冷却的熔体，其粘度突增发生的温度低于以较慢冷却速率冷却的熔体。另一个复杂因素是变形的影响。过去二十年间，人们对此进行了广泛研究。普遍共识是，材料的变形历史会影响粘度突增的温度。粗略地说，材料所受的剪切速率越高，我们观察到粘度突增的温度就越高。因此，对半结晶材料至少有两个因素需要考虑。第一个是冷却速率。冷却速率增大时，结晶温度降低。第二个是材料的变形历史。变形速率增大时，结晶温度也升高。这两种效应作用方向相反。

在写作本书时，关于结晶应如何建模已有若干理论。我们将在第二部分讨论其中一些。不过目前我们将（错误地）假设单一转变温度就足够了。

话虽如此，如果读者所用的注塑模拟软件采用单一的结晶温度值，也不必气馁。这完全取决于你想用软件做什么。在充填阶段发生在结晶温度以上的模具中，这个问题可能无关紧要，流动模式和压力都可以被准确预测。在厚度变化显著、流动不平衡的模具中，则可能存在误差。更特别的是，在这些条件下，残余应力的预测，进而翘曲的预测，可能有误。

### 5.3.6 压力-体积-温度（PVT）数据

早期的程序假定熔体在充填阶段不可压缩，而在保压阶段可压缩 [196]。这看似合理，但实际情况是，模具充填时，可能有些区域已经充满并进入保压，而模具的其余部分仍在充填。图 5.2 虽然简单，但说明了这一思想。熔体从注射点引入，充填制品的左侧，而模具的右侧仍在继续充填。注射点左侧的材料基本上处于保压阶段，几乎没有流动，并在注射压力所定义的压力下冷却。因此，与 Kennedy [196] 不同，我们假定熔体在充填和保压两个阶段都是可压缩的。

如第 3.9 节所述，压缩系数、膨胀系数和密度由 PVT 关系获得，因此它们的精度取决于 PVT 数据的精度。这类数据的测定称为高压膨胀测量法。对聚合物而言，由于实验上的复杂问题，这是一个具有挑战性的领域。市面上可供选择的 PVT 测试仪器寥寥无几就证明了这一点。几乎所有这些仪器都在静态条件下测量数据，即不对样品施加任何受控变形。GNOMIX 仪器源于 Zoller 等人 [432] 的工作，它将聚合物样品封装在汞中，然后加压并测量由此产生的体积变化。GNOMIX 仪器的一个优点是样品承受静水压力加载。另一台仪器是 SWO Polymertechnik GmbH 开发的 PVT 100。该仪器用活塞向聚合物样品施加压力。它受到的批评是：所施加的压力未必是静水压力，特别是当样品凝固并可能收缩脱离测量腔壁面时。实际情况是，这两台仪器都难以评估冷却速率对半结晶材料 PVT 行为的影响。这是由于其坚固的结构设计所致，而这种设计是在高温、特别是高压下测量 PVT 数据所必需的。虽然两台仪器都能在降温条件下测量数据，但仪器内部的温度梯度是未知的，因此即使温度控制良好，也难以评估聚合物样品的实际冷却速率。Luyé 等人 [234] 使用一台改进的 PVT 100 以及传热的解析解来确定样品中的温度梯度，从而在温度下降过程中估计聚合物样品中的真实温度。这一方法是成功的，并显示了冷却速率对 PVT 数据的影响。PVT 测量的一项重大进展来自 Forstner 等人 [123] 的工作。他们的目标是在高压、高冷却速率和受控剪切速率下进行 PVT 测量。实现方式是使用厚度为 0.5 mm 的环形样品，并允许样品以受控速率被剪切。

尽管有这些工作，在写作本书时，市场上似乎只有一种面向聚合物的商用膨胀计。它基于 Forstner 等人 [123] 和 van der Beek 等人 [376–378] 的工作，由荷兰的 IME Technologies 公司生产（http://www.imetechnologies.nl/Pirouette-n236m299）。

总而言之，GNOMIX 和 PVT 100 等商用仪器生成的 PVT 数据不足以满足半结晶材料注塑成型的需要。正如我们将在第 10 章所见，聚合物的变形对转变温度有深远影响，冷却速率亦然。目前也许最好的办法是使用接近平衡条件（温度和剪切速率）下的 PVT 数据，然后利用结晶建模对数据进行修正，以考虑加工的影响。我们将在本书第二部分再讨论这些问题。

### 5.3.7 纤维取向、收缩与翘曲

一般而言，纤维取向分析用于确定成型材料的力学和热学属性。这些预测属性随后被用于收缩与翘曲分析。不过，获得这些属性之后，它们还可以用于成型之外的其他分析，如结构分析和热分析。

#### 5.3.7.1 纤维取向分析

纤维取向分析的材料属性及后续近似取决于用于确定纤维取向的数学模型。大多数商业程序使用 Folgar-Tucker 模型，我们将在本章后面讨论。目前需要指出，Folgar-Tucker 模型利用充填和保压过程中熔体的速度梯度来确定纤维取向。这意味着本章前面讨论过的所有影响粘度、进而影响速度梯度的材料假设，都会对纤维取向预测产生影响。

在材料属性方面，Folgar-Tucker 模型需要材料中玻璃纤维的体积浓度以及纤维的长径比。该模型假定纤维长度约比型腔宽度小一个数量级。

纤维浓度在测量上不存在任何问题，除了假定纤维在成型前和成型过程中均匀分布于聚合物中之外，不需要其他假设。后一点可能值得商榷。已知纤维会在制品极薄截面的入口处发生絮聚，但这取决于纤维的长度。

纤维长径比是较难获得的材料属性。将纤维混入聚合物基体时，纤维初始长度服从某种分布。在混炼过程中，可能发生纤维断裂，长度分布随之改变。最后在注塑机上加工时，可能进一步发生纤维断裂，纤维长度随之减小。这取决于加工参数以及模具特征，如浇口尺寸。

容易出错的一个领域是长纤维填充材料的加工。即使涉及长纤维材料，仍常见到 Folgar-Tucker 模型被使用。这违反了 Folgar-Tucker 模型中隐含的关于纤维长度的假设。此外，加工过程中纤维最终达到的实际长度非常依赖于加工条件。长纤维材料的加工是一个持续的研究领域，我们将在第 9 章再回到这个问题。

#### 5.3.7.2 收缩与翘曲分析

对于收缩与翘曲，我们需要：

- 方向 1 和方向 2 的线膨胀系数
- 方向 1 和方向 2 的弹性模量
- 泊松比
- 剪切模量

其中，泊松比和剪切模量通常通过某种近似确定，因为它们难以用实验测量。对半结晶材料和纤维填充材料尤其如此。

我们将在本章后面讨论用于预测线膨胀系数和弹性模量的方程。目前我们注意到，对未填充材料而言，它们的确定取决于材料形态，而形态又取决于其加工历史。这仍是一个持续的研究领域。典型地，对未填充材料，商业程序对线膨胀系数和弹性模量使用单一数值。对填充材料，隐含假设是纤维填料引入的各向异性大于形态所致的各向异性。因此，大多数程序会使用这样的公式：基体和填料属性各用一个单一数值，然后利用计算出的纤维取向对其进行修正，得到复合材料的各向异性属性。

## 5.4 材料假设小结

综上所述，获得成型模拟所需相关材料属性的本质问题有两个方面。第一，确定这些属性存在实验上的困难；第二，过程本身会改变材料属性。

在我们看来，最好的前进方向是：在众所周知的条件下测量材料数据，接受其在模拟中使用的局限性，并发展材料建模技术，使我们能够把测得的数据转化为与模拟相关的数据。换言之，应当用"输入实验条件下生成的数据，并在模拟进行过程中对其进行修正"这一概念，取代"将实验条件下生成的材料数据输入模拟程序并用于产生结果"的旧概念。本书第二部分的很多内容都致力于这一思想。测试方面的任何进步都是受欢迎的，但其真正价值可能在于验证材料建模。

## 5.5 控制方程

控制方程在第 4 章导出，它们是：

质量守恒：

$$\frac{\partial \rho}{\partial t} + \nabla \cdot \rho\mathbf{v} = 0 \tag{5.5}$$

动量守恒：

$$\frac{\partial}{\partial t}(\rho\mathbf{v}) = \rho\mathbf{g} + \nabla \cdot \boldsymbol{\sigma} - \nabla \cdot (\rho\mathbf{v}\mathbf{v}) \tag{5.6}$$

能量守恒：

$$\rho c_p \left(\frac{\partial T}{\partial t} + \mathbf{v} \cdot \nabla T\right) = \beta T\left(\frac{\partial p}{\partial t} + \mathbf{v} \cdot \nabla p\right) + p\nabla \cdot \mathbf{v} + \boldsymbol{\sigma} : \nabla\mathbf{v} + \nabla \cdot (k\nabla T) + \dot{Q} \tag{5.7}$$

现在我们考虑第 5.2 节讨论的材料假设对这些方程的影响以及可以引入的近似。

质量守恒方程保持不变，与方程 5.5 相同。然而，材料假设同时影响动量守恒方程和能量守恒方程。

我们先处理动量守恒方程。将方程 5.3 代入方程 5.6，得到

$$\frac{\partial}{\partial t}(\rho\mathbf{v}) = \rho\mathbf{g} - \nabla p + \nabla \cdot \eta\mathbf{D} - \nabla \cdot (\rho\mathbf{v}\mathbf{v}) \tag{5.8}$$

方程 5.8 的左端可展开为：

$$\frac{\partial}{\partial t}(\rho\mathbf{v}) = \frac{\partial \rho}{\partial t}\mathbf{v} + \rho\frac{\partial \mathbf{v}}{\partial t} = -(\nabla \cdot \rho\mathbf{v})\mathbf{v} + \rho\frac{\partial \mathbf{v}}{\partial t} \tag{5.9}$$

其中我们使用了质量守恒方程，即方程 5.5。方程 5.8 的最后一项可展开为：

$$\nabla \cdot (\rho\mathbf{v}\mathbf{v}) = \rho\mathbf{v} \cdot \nabla\mathbf{v} + (\nabla \cdot \rho\mathbf{v})\mathbf{v} \tag{5.10}$$

将方程 5.9 和 5.10 代入方程 5.8，得到

$$-(\nabla \cdot \rho\mathbf{v})\mathbf{v} + \rho\frac{\partial \mathbf{v}}{\partial t} = \rho\mathbf{g} - \nabla p + \nabla \cdot \eta\mathbf{D} - \rho\mathbf{v} \cdot \nabla\mathbf{v} - (\nabla \cdot \rho\mathbf{v})\mathbf{v} \tag{5.11}$$

即，

$$\rho\frac{\partial \mathbf{v}}{\partial t} = \rho\mathbf{g} - \nabla p + \nabla \cdot \eta\mathbf{D} - \rho\mathbf{v} \cdot \nabla\mathbf{v} \tag{5.12}$$

现在考虑能量方程，即方程 5.7。假设热导率为常数，并将方程 5.1 和 5.4 代入方程 5.7，得到：

$$\rho c_p \left(\frac{\partial T}{\partial t} + \mathbf{v} \cdot \nabla T\right) = \beta T\left(\frac{\partial p}{\partial t} + \mathbf{v} \cdot \nabla p\right) + \eta\dot{\gamma}^2 + k\nabla^2 T \tag{5.13}$$

大多数商业程序将分别以方程 5.5、5.12 和 5.13 作为质量、动量和能量守恒的基础。要改善这一远不令人满意的状况，就需要发展更细致的材料属性模型。如果这听起来有些消极，需要指出的是，只要理解假设和局限，任何模拟都能带来一些认识。正因如此，许多使用上述假设的程序仍能为用户提供信息以改进设计，尽管存在科学上的缺陷。程序开发者（商业的和学术的）所面临的挑战，是对注塑成型过程进行更完整的建模，特别是对本身受过程影响的材料属性的建模。我们将在本书第二部分进一步考虑这个问题，并提供一些解决思路。

不过本章的剩余部分，我们将聚焦于求解控制方程的数值方案。这些方案同样包含假设及随之而来的简化，任何模拟软件的用户都应当了解。

## 5.6 2.5D 近似

2.5D 近似利用了注塑模具型腔经常为薄壁这一事实。这是由低热导率、对快速生产周期的需求以及避免内部缩孔的要求所决定的。对于薄壁制品，厚度方向上存在很大的温度梯度，但整个制品上的压力梯度相对较低。2.5D 近似自 1986 年前后至今一直在模拟行业中使用。其根源在于 Hieber 和 Shen [154] 的论文。该论文提出了这样的思想：厚度方向上的温度最好用有限差分处理，而制品中面上的压力用有限元处理。这一模型在历史上和商业上都极为重要，因此我们在本节花些篇幅详细推导。这些推导过去已由 Boshouwers 和 van der Werf [42] 针对充填阶段给出。充填和保压两个阶段则由 Chiang 等人 [60] 和 Kennedy [196] 考虑过。

成型过程中温度逐点变化，特别是制品壁厚截面上存在很大梯度。虽然沿流动方向的温度梯度较小，但仍有显著变化。基于这些原因，温度应在三维中求解。另一方面，压力逐点变化，但壁厚截面上的压力变化相对很小。因此，压力可以在实际三维制品的假想中面上的点处以二维方式求解。"2.5D"这一术语即由此而来。

应当记住，注塑模拟中的近似是由于对材料属性、边界条件缺乏认识以及计算能力不足而引入的。对今天的读者而言，最后一点可能显得奇怪。然而注塑成型程序是从 20 世纪 60 年代开始发展的，计算机速度和内存的不足是一个重要因素。以今天的能力，这已不是什么大问题。不过从注塑产品设计者的角度看，运行大量分析以优化设计是可取的。因此速度很重要。正因如此，虽然全三维分析已经可用（见第 6.2 节），但它未必是优化设计的最佳途径。基于这些原因，2.5D 近似至今仍广受欢迎。

为了推导 2.5D 近似，我们引入一个笛卡尔坐标系来描述型腔。坐标轴的布置使得型腔内任意点处的 x-y 平面与制品中面重合，z 轴指向厚度方向，即垂直于中面。图 5.3 显示了一个简单型腔以及在其中两点处定义的坐标轴。

### 5.6.1 笛卡尔坐标系中的控制方程

本节我们将控制方程用笛卡尔坐标表示。然后利用量纲分析去除低阶项，从而得到一组简化的待求解方程。

#### 5.6.1.1 质量守恒

在笛卡尔坐标中，质量守恒方程变为：

$$\frac{\partial \rho}{\partial t} = -\rho\left(\frac{\partial v_x}{\partial x} + \frac{\partial v_y}{\partial y} + \frac{\partial v_z}{\partial z}\right) - \left(v_x\frac{\partial \rho}{\partial x} + v_y\frac{\partial \rho}{\partial y} + v_z\frac{\partial \rho}{\partial z}\right) \tag{5.14}$$

密度 ρ 是状态变量，其依赖于压力 p 和温度 T 的关系由 PVT 关系定义。利用微分链式法则，我们得到：

$$\frac{\partial \rho}{\partial x} = \left(\frac{\partial \rho}{\partial p}\right)_T \frac{\partial p}{\partial x} + \left(\frac{\partial \rho}{\partial T}\right)_p \frac{\partial T}{\partial x} \tag{5.15}$$

$$\frac{\partial \rho}{\partial y} = \left(\frac{\partial \rho}{\partial p}\right)_T \frac{\partial p}{\partial y} + \left(\frac{\partial \rho}{\partial T}\right)_p \frac{\partial T}{\partial y} \tag{5.16}$$

$$\frac{\partial \rho}{\partial z} = \left(\frac{\partial \rho}{\partial p}\right)_T \frac{\partial p}{\partial z} + \left(\frac{\partial \rho}{\partial T}\right)_p \frac{\partial T}{\partial z} \tag{5.17}$$

$$\frac{\partial \rho}{\partial t} = \left(\frac{\partial \rho}{\partial p}\right)_T \frac{\partial p}{\partial t} + \left(\frac{\partial \rho}{\partial T}\right)_p \frac{\partial T}{\partial t} \tag{5.18}$$

将上述表达式代入方程 5.14 并整理，得：

$$
\begin{aligned}
0 = &\frac{1}{\rho}\left(\frac{\partial \rho}{\partial p}\right)_T\left(\frac{\partial p}{\partial t} + v_x\frac{\partial p}{\partial x} + v_y\frac{\partial p}{\partial y} + v_z\frac{\partial p}{\partial z}\right) \\
&+ \frac{1}{\rho}\left(\frac{\partial \rho}{\partial T}\right)_p\left(\frac{\partial T}{\partial t} + v_x\frac{\partial T}{\partial x} + v_y\frac{\partial T}{\partial y} + v_z\frac{\partial T}{\partial z}\right) \\
&+ \left(\frac{\partial v_x}{\partial x} + \frac{\partial v_y}{\partial y} + \frac{\partial v_z}{\partial z}\right)
\end{aligned} \tag{5.19}
$$

回想密度是比体积 $\hat{V}$ 的倒数。因此我们可以写出

$$\frac{1}{\rho}\left(\frac{\partial \rho}{\partial p}\right)_T = \frac{1}{\rho}\left(\frac{\partial}{\partial p}\frac{1}{\hat{V}}\right)_T = \frac{1}{\rho}\frac{\partial}{\partial \hat{V}}\left(\frac{1}{\hat{V}}\right)\left(\frac{\partial \hat{V}}{\partial p}\right)_T = \frac{1}{\rho}\left(-\frac{1}{\hat{V}^2}\right)\left(\frac{\partial \hat{V}}{\partial p}\right)_T = -\frac{1}{\hat{V}}\left(\frac{\partial \hat{V}}{\partial p}\right)_T = \kappa \tag{5.20}$$

其中 κ 是材料的等温压缩系数 [326]，定义见第 3.8.1 节。类似地，

$$\frac{1}{\rho}\left(\frac{\partial \rho}{\partial T}\right)_p = \frac{1}{\rho}\left(\frac{\partial}{\partial T}\frac{1}{\hat{V}}\right)_p = \frac{1}{\rho}\frac{\partial}{\partial \hat{V}}\left(\frac{1}{\hat{V}}\right)\left(\frac{\partial \hat{V}}{\partial T}\right)_p = \frac{1}{\rho}\left(-\frac{1}{\hat{V}^2}\right)\left(\frac{\partial \hat{V}}{\partial T}\right)_p = -\frac{1}{\hat{V}}\left(\frac{\partial \hat{V}}{\partial T}\right)_p = -\beta \tag{5.21}$$

其中 β 是材料的膨胀系数 [326]，定义见第 3.8.1 节。

将方程 5.20 和 5.21 代入方程 5.19，得到

$$
\begin{aligned}
0 = &\,\kappa\left(\frac{\partial p}{\partial t} + v_x\frac{\partial p}{\partial x} + v_y\frac{\partial p}{\partial y} + v_z\frac{\partial p}{\partial z}\right) - \beta\left(\frac{\partial T}{\partial t} + v_x\frac{\partial T}{\partial x} + v_y\frac{\partial T}{\partial y} + v_z\frac{\partial T}{\partial z}\right) \\
&+ \left(\frac{\partial v_x}{\partial x} + \frac{\partial v_y}{\partial y} + \frac{\partial v_z}{\partial z}\right)
\end{aligned}
$$

#### 5.6.1.2 动量守恒

动量方程（方程 5.12）用笛卡尔坐标表示时，得到其各分量的三个方程：

- x 分量：

$$
\begin{aligned}
\rho\frac{\partial v_x}{\partial t} = &\,\rho g_x - \frac{\partial p}{\partial x} + \frac{\partial}{\partial x}\left(2\eta\frac{\partial v_x}{\partial x}\right) + \frac{\partial}{\partial y}\left(\eta\left(\frac{\partial v_x}{\partial y} + \frac{\partial v_y}{\partial x}\right)\right) \\
&+ \frac{\partial}{\partial z}\left(\eta\left(\frac{\partial v_x}{\partial z} + \frac{\partial v_z}{\partial x}\right)\right) - \rho\left(v_x\frac{\partial v_x}{\partial x} + v_y\frac{\partial v_x}{\partial y} + v_z\frac{\partial v_x}{\partial z}\right)
\end{aligned} \tag{5.23}
$$

- y 分量：

$$
\begin{aligned}
\rho\frac{\partial v_y}{\partial t} = &\,\rho g_y - \frac{\partial p}{\partial y} + \frac{\partial}{\partial x}\left(\eta\left(\frac{\partial v_x}{\partial y} + \frac{\partial v_y}{\partial x}\right)\right) + \frac{\partial}{\partial y}\left(2\eta\frac{\partial v_y}{\partial y}\right) \\
&+ \frac{\partial}{\partial z}\left(\eta\left(\frac{\partial v_z}{\partial y} + \frac{\partial v_y}{\partial z}\right)\right) - \rho\left(v_x\frac{\partial v_y}{\partial x} + v_y\frac{\partial v_y}{\partial y} + v_z\frac{\partial v_y}{\partial z}\right)
\end{aligned}
$$

- z 分量：

$$
\begin{aligned}
\rho\frac{\partial v_z}{\partial t} = &\,\rho g_z - \frac{\partial p}{\partial z} + \frac{\partial}{\partial x}\left(\eta\left(\frac{\partial v_x}{\partial z} + \frac{\partial v_z}{\partial x}\right)\right) + \frac{\partial}{\partial y}\left(\eta\left(\frac{\partial v_y}{\partial z} + \frac{\partial v_z}{\partial y}\right)\right) \\
&+ \frac{\partial}{\partial z}\left(2\eta\frac{\partial v_z}{\partial z}\right) - \rho\left(v_x\frac{\partial v_z}{\partial x} + v_y\frac{\partial v_z}{\partial y} + v_z\frac{\partial v_z}{\partial z}\right)
\end{aligned} \tag{5.25}
$$

#### 5.6.1.3 能量守恒

能量方程（方程 5.13）在笛卡尔坐标中为：

$$\rho c_p\left(\frac{\partial T}{\partial t} + v_x\frac{\partial T}{\partial x} + v_y\frac{\partial T}{\partial y} + v_z\frac{\partial T}{\partial z}\right) = \beta T\left(\frac{\partial p}{\partial t} + v_x\frac{\partial p}{\partial x} + v_y\frac{\partial p}{\partial y} + v_z\frac{\partial p}{\partial z}\right) + \eta\dot{\gamma}^2 + k\left(\frac{\partial^2 T}{\partial x^2} + \frac{\partial^2 T}{\partial y^2} + \frac{\partial^2 T}{\partial z^2}\right) \tag{5.26}$$

回想方程 2.17：

$$\dot{\gamma}^2 = 2\mathbf{D} : \mathbf{D} = 2\,\mathrm{tr}\,\mathbf{D}^2$$

在笛卡尔坐标中，

$$
\mathbf{D} = \begin{bmatrix}
\dfrac{\partial v_x}{\partial x} & \dfrac{1}{2}\left(\dfrac{\partial v_y}{\partial x} + \dfrac{\partial v_x}{\partial y}\right) & \dfrac{1}{2}\left(\dfrac{\partial v_x}{\partial z} + \dfrac{\partial v_z}{\partial x}\right) \\[2ex]
\dfrac{1}{2}\left(\dfrac{\partial v_x}{\partial y} + \dfrac{\partial v_y}{\partial x}\right) & \dfrac{\partial v_y}{\partial y} & \dfrac{1}{2}\left(\dfrac{\partial v_y}{\partial z} + \dfrac{\partial v_z}{\partial y}\right) \\[2ex]
\dfrac{1}{2}\left(\dfrac{\partial v_x}{\partial z} + \dfrac{\partial v_z}{\partial x}\right) & \dfrac{1}{2}\left(\dfrac{\partial v_y}{\partial z} + \dfrac{\partial v_z}{\partial y}\right) & \dfrac{\partial v_z}{\partial z}
\end{bmatrix} \tag{5.27}
$$

我们将在后面对 $\dot{\gamma}^2$ 项进行简化。

### 5.6.2 相关项的量级估计

为了简化控制方程，我们首先使用量纲分析。其思想是利用变量的特征值，如型腔长度、厚度和熔体速度，来评估各项的相对大小。相对较小的项被舍去，从而简化控制方程。特征值不必精确；量级估计就足够了。我们采用以下特征值 [42, 196]，但请注意，对于注塑成型工艺的极端变体，如微注塑成型或超高速注塑成型，这些值可能有所不同：

- 型腔厚度，$H = 10^{-3}$ m
- 型腔长度，$L = H/\delta$ m，其中 $\delta = H/L \ll 1$
- 熔体速度，$V = 10^{-1}$ m/s
- 型腔压力，$p_0 = 10^{7}$ N/m²
- 熔体粘度，$\eta_0 = 10^{4}$ N·s/m²
- 熔体膨胀系数，$\beta = 10^{-3}$ 1/K
- 熔体热导率，$k = 10^{-1}$ W/(m·K)
- 熔体密度，$\rho = 10^{3}$ kg/m³
- 模具与熔体的温度差，$T_0 = 10^{2}$ K
- 重力加速度，$g_0 = 10$ m/s²
- 熔体比热容，$c_{p0} = 10^{3}$ J/(kg·K)

这里的关键假设是 $\delta = H/L$ 很小，量级约为 $10^{-3}$。这有时被称为窄间隙近似或润滑近似。更多细节见附录 D。

利用这些典型值，方程中的相关变量可以用无量纲变量定义如下：

- x 坐标：$x = Lx^* = (H/\delta)x^*$
- y 坐标：$y = Ly^* = (H/\delta)y^*$
- z 坐标：$z = Hz^*$
- 时间：$t = [L/V]t^* = (H/\delta V)t^*$
- 熔体速度 x 分量：$v_x = (L/t)v_x^* = Vv_x^*$
- 熔体速度 y 分量：$v_y = (L/t)v_y^* = Vv_y^*$
- 熔体速度 z 分量：$v_z = (H/t)v_z^* = \delta Vv_z^*$
- 压力：$p = p_0 p^*$
- 粘度：$\eta = \eta_0 \eta^*$
- 温度差：$\Delta T = T_0 \Delta T^*$
- 重力加速度：$g = g_0 g^*$
- 比热容：$c_p = c_{p0} c_p^*$

其中带星号的量为无量纲量，量级为一。

我们的方法是将无量纲变量代入控制方程，然后估计每一项的量级。例如，

$$\frac{\partial v_x}{\partial x} = \left[\frac{V}{L}\right]\frac{\partial v_x^*}{\partial x^*} \tag{5.28}$$

由于带星号的量量级为一，$\partial v_x/\partial x$ 的量级等于 $V/L$ 的量级。为简洁起见，我们写：

$$O\left[\frac{\partial v_x}{\partial x}\right] = O\left[\frac{V}{L}\right] \tag{5.29}$$

其中 $O[*]$ 读作"[*] 的量级"。

利用 V 和 L 的特征值，我们得到：

$$O\left[\frac{\partial v_x}{\partial x}\right] = O\left[\frac{V}{L}\right] = O\left[\frac{\delta V}{H}\right] = O\left[\frac{10^{-1}\delta}{10^{-3}}\right] = O\left[10^{2}\delta\right] \tag{5.30}$$

在附录 D 中，我们使用上述方法估计方程 5.22 至 5.26 中各项的相对大小。结果是：质量守恒方程（方程 5.22）保持不变，即

$$0 = \kappa\left(\frac{\partial p}{\partial t} + v_x\frac{\partial p}{\partial x} + v_y\frac{\partial p}{\partial y} + v_z\frac{\partial p}{\partial z}\right) - \beta\left(\frac{\partial T}{\partial t} + v_x\frac{\partial T}{\partial x} + v_y\frac{\partial T}{\partial y} + v_z\frac{\partial T}{\partial z}\right) + \left(\frac{\partial v_x}{\partial x} + \frac{\partial v_y}{\partial y} + \frac{\partial v_z}{\partial z}\right) \tag{5.31}$$

动量方程（方程 5.23 至 5.25）简化为：

- x 分量：

$$\frac{\partial p}{\partial x} = \frac{\partial}{\partial z}\left(\eta\frac{\partial v_x}{\partial z}\right) \tag{5.32}$$

- y 分量：

$$\frac{\partial p}{\partial y} = \frac{\partial}{\partial z}\left(\eta\frac{\partial v_y}{\partial z}\right) \tag{5.33}$$

- z 分量：

$$\frac{\partial p}{\partial z} = 0 \tag{5.34}$$

能量方程简化为（见方程 D.51）：

$$\rho c_p\left(\frac{\partial T}{\partial t} + v_x\frac{\partial T}{\partial x} + v_y\frac{\partial T}{\partial y} + v_z\frac{\partial T}{\partial z}\right) = \beta T\frac{\partial p}{\partial t} + \eta\dot{\gamma}^2 + k\frac{\partial^2 T}{\partial z^2} \tag{5.35}$$

利用量纲分析可以证明，在 2.5D 近似中，

$$\dot{\gamma} = \sqrt{\left(\frac{\partial v_x}{\partial z}\right)^2 + \left(\frac{\partial v_y}{\partial z}\right)^2} \tag{5.36}$$

通常称 $\dot{\gamma}$ 为剪切速率。

### 5.6.3 z 方向的速度

从方程 5.32 至 5.34 可见，压力 p 只是 x 和 y 的函数。然而这里存在一个矛盾：质量守恒方程和能量守恒方程都含有涉及 $v_z$ 的项，但由方程 5.34，z 方向上没有压力梯度。为了使 2.5D 近似中各守恒方程保持一致，我们进一步假设 $v_z = 0$。Denn [78] 考虑过当厚度作为 x 或 y 的函数已知时对 $v_z$ 的近似。然而，在注塑成型中，浇口处的过渡以及型腔厚度的变化经常非常突然，不适合 Denn 的处理方法。因此，我们令 $v_z = 0$，并采用以下方程作为 2.5D 近似：

质量守恒：

$$0 = \kappa\left(\frac{\partial p}{\partial t} + v_x\frac{\partial p}{\partial x} + v_y\frac{\partial p}{\partial y}\right) - \beta\left(\frac{\partial T}{\partial t} + v_x\frac{\partial T}{\partial x} + v_y\frac{\partial T}{\partial y}\right) + \left(\frac{\partial v_x}{\partial x} + \frac{\partial v_y}{\partial y}\right) \tag{5.37}$$

动量方程（方程 5.32–5.34）保持不变，能量方程为：

$$\rho c_p\left(\frac{\partial T}{\partial t} + v_x\frac{\partial T}{\partial x} + v_y\frac{\partial T}{\partial y}\right) = \beta T\frac{\partial p}{\partial t} + \eta\dot{\gamma}^2 + k\frac{\partial^2 T}{\partial z^2} \tag{5.38}$$

忽略 $v_z$ 会影响流动前沿附近的温度，因为喷泉流动会把熔体从型腔中部输运到壁面。在薄壁模具中，流动前沿通过某一点之后，流动为层流，因此 z 方向的对流不那么重要。在熔体快速改变方向的拐角处可能引入显著误差。在这些区域（包括流道系统），温度对流误差会导致流动前沿预测的误差。只有真正的三维模拟才能准确识别这一点。我们将在第 6.4 节讨论。

### 5.6.4 动量方程的积分

如上一节所述，动量方程表明压力仅依赖于 x 和 y。这提示我们，将这些方程沿厚度 z 积分以获得速度 $v_x$ 和 $v_y$ 的表达式可能是有用的。

不过在此之前，我们注意到注塑成型中材料同时处于固态和熔融态。实际上，进入的熔体被夹在一层附着于型腔壁面的凝固材料之间。显然需要某种区分这两相的方法。成型行业中使用了一个常见但不严格的术语来描述它，称为"凝固层"。按照定义，速度 $v_x$ 和 $v_y$ 在该区域为零。从模拟的角度看，问题在于如何定义凝固层，最重要的是熔体与固体之间的过渡。大多数使用 2.5D 近似的程序以温度作为判据。如前所述，有"不流动温度"或"转变温度"等不同术语。目前我们注意到，大多数商业软件使用一个固定的温度值来界定材料处于固相或熔融相。因此会存在一个由该温度确定的凝固层。图 5.4 在此基础上定义了我们的记号。型腔厚度为 2H，中心线在 $z = 0$，点 $(x, y)$ 处固液界面的位置在 $z = h^+(x, y)$ 和 $z = h^-(x, y)$。因此，任意点 $(x, y)$ 处有流动发生的厚度为 $h^+(x, y) - h^-(x, y)$。注意这里我们没有做对称假设，即 $|h^-(x, y)| \neq |h^+(x, y)|$。不过读者应当知道，商业软件可能假定对称以减少计算时间，因为只需分析半个型腔。

首先，我们将方程 5.32 对 z 从 $h^-(x, y)$ 积分到 z，得到：

$$\int_{h^-}^{z}\frac{\partial p}{\partial x}\,dz = \int_{h^-}^{z}\frac{\partial}{\partial z}\left(\eta\frac{\partial v_x}{\partial z}\right)dz \tag{5.39}$$

$$\frac{\partial p}{\partial x}\left(z - z\big|_{z=h^-}\right) = \eta\frac{\partial v_x}{\partial z} - \left[\eta\frac{\partial v_x}{\partial z}\right]_{z=h^-} \tag{5.40}$$

$$\frac{\partial p}{\partial x}z = \eta\frac{\partial v_x}{\partial z} + A(x, y) \tag{5.41}$$

其中

$$A(x, y) = \left[\frac{\partial p}{\partial x}z\right]_{z=h^-} - \left[\eta\frac{\partial v_x}{\partial z}\right]_{z=h^-} \tag{5.42}$$

我们将方程 5.41 两边除以 η，再从 $h^-$ 到 z 对两边积分，得：

$$\frac{\partial p}{\partial x}\int_{h^-}^{z}\frac{z}{\eta}\,dz = \int_{h^-}^{z}\frac{\partial v_x}{\partial z}\,dz + A(x, y)\int_{h^-}^{z}\frac{1}{\eta}\,dz = v_x(z) - v_x(h^-) + A(x, y)\int_{h^-}^{z}\frac{1}{\eta}\,dz \tag{5.43}$$

在凝固层形成的界面处（$z = h^-$ 或 $z = h^+$），有 $v_x = 0$。这称为无滑移条件。应用该条件并整理方程 5.43，得到：

$$v_x(z) = \frac{\partial p}{\partial x}\int_{h^-}^{z}\frac{z}{\eta}\,dz + A(x, y)\int_{h^-}^{z}\frac{1}{\eta}\,dz \tag{5.44}$$

我们对方程 5.44 再次应用无滑移条件，代入 $z = h^+$，得：

$$0 = \frac{\partial p}{\partial x}\int_{h^-}^{h^+}\frac{z}{\eta}\,dz + A(x, y)\int_{h^-}^{h^+}\frac{1}{\eta}\,dz \tag{5.45}$$

于是

$$A(x, y) = -\frac{\partial p}{\partial x}\frac{\displaystyle\int_{h^-}^{h^+}\frac{z}{\eta}\,dz}{\displaystyle\int_{h^-}^{h^+}\frac{1}{\eta}\,dz} = -\frac{\partial p}{\partial x}C(x, y) \tag{5.46}$$

其中

$$C(x, y) = \frac{\displaystyle\int_{h^-}^{h^+}\frac{z}{\eta}\,dz}{\displaystyle\int_{h^-}^{h^+}\frac{1}{\eta}\,dz} \tag{5.47}$$

将方程 5.46 和 5.47 代入方程 5.44，得到 x 方向速度的以下表达式：

$$v_x(z) = \frac{\partial p}{\partial x}\left[\int_{h^-}^{z}\frac{z}{\eta}\,dz - C(x, y)\int_{h^-}^{z}\frac{1}{\eta}\,dz\right] \tag{5.48}$$

对动量方程的 y 分量（方程 5.33）执行相同的步骤，可得 y 方向速度的类似表达式：

$$v_y(z) = \frac{\partial p}{\partial y}\left[\int_{h^-}^{z}\frac{z}{\eta}\,dz - C(x, y)\int_{h^-}^{z}\frac{1}{\eta}\,dz\right] \tag{5.49}$$

流动通道的宽度由 $h^+ - h^-$ 定义。跨越流动通道宽度的 x 方向平均速度定义为：

$$\bar{v}_x = \frac{1}{h^+ - h^-}\int_{h^-}^{h^+}v_x(z)\,dz \tag{5.50}$$

将方程 5.48 代入方程 5.50，得到：

$$\bar{v}_x = \frac{1}{h^+ - h^-}\frac{\partial p}{\partial x}\left[\int_{h^-}^{h^+}\int_{h^-}^{z}\frac{z}{\eta}\,dz\,dz - C(x, y)\int_{h^-}^{h^+}\int_{h^-}^{z}\frac{1}{\eta}\,dz\,dz\right] \tag{5.51}$$

方程 5.51 可利用分部积分（见第 4.2.4 节）简化。第一项可通过令 $M = z$、$N = \int_{h^-}^{z}\frac{z}{\eta}\,dz$ 来计算，于是

$$
\begin{aligned}
\int_{h^-}^{h^+}\int_{h^-}^{z}\frac{z}{\eta}\,dz\,dz &= \int_{h^-}^{h^+}N\frac{dM}{dz}\,dz = \left[NM\right]_{z=h^-}^{z=h^+} - \int_{h^-}^{h^+}MN'\,dz \\
&= \left[z\int_{h^-}^{z}\frac{z}{\eta}\,dz\right]_{z=h^-}^{z=h^+} - \int_{h^-}^{h^+}\frac{z^2}{\eta}\,dz \\
&= \left(h^+ - h^-\right)\int_{h^-}^{h^+}\frac{z}{\eta}\,dz - \int_{h^-}^{h^+}\frac{z^2}{\eta}\,dz
\end{aligned}
$$

我们再次使用分部积分来计算方程 5.51 中的第二个积分，令 $M = z$、$N = \int_{h^-}^{z}\frac{1}{\eta}\,dz$：

$$
\begin{aligned}
\int_{h^-}^{h^+}\int_{h^-}^{z}\frac{1}{\eta}\,dz\,dz &= \int_{h^-}^{h^+}N\frac{dM}{dz}\,dz = \left[NM\right]_{z=h^-}^{z=h^+} - \int_{h^-}^{h^+}MN'\,dz \\
&= \left[z\int_{h^-}^{z}\frac{1}{\eta}\,dz\right]_{z=h^-}^{z=h^+} - \int_{h^-}^{h^+}\frac{z}{\eta}\,dz \\
&= \left(h^+ - h^-\right)\int_{h^-}^{h^+}\frac{1}{\eta}\,dz - \int_{h^-}^{h^+}\frac{z}{\eta}\,dz
\end{aligned} \tag{5.53}
$$

将方程 5.52 和 5.53 代入方程 5.51，并利用方程 5.47，得到 x 方向平均速度的以下表达式：

$$
\begin{aligned}
\bar{v}_x &= \frac{1}{h^+ - h^-}\frac{\partial p}{\partial x}\Bigg[(h^+ - h^-)\int_{h^-}^{h^+}\frac{z}{\eta}\,dz - \int_{h^-}^{h^+}\frac{z^2}{\eta}\,dz \\
&\quad - C(x, y)\left((h^+ - h^-)\int_{h^-}^{h^+}\frac{1}{\eta}\,dz - \int_{h^-}^{h^+}\frac{z}{\eta}\,dz\right)\Bigg] \\
&= \frac{1}{h^+ - h^-}\frac{\partial p}{\partial x}\left[\int_{h^-}^{h^+}\frac{z^2}{\eta}\,dz - \frac{\left(\int_{h^-}^{h^+}\frac{z}{\eta}\,dz\right)^2}{\int_{h^-}^{h^+}\frac{1}{\eta}\,dz}\right] \times (-1) \\
&= -\frac{1}{h^+ - h^-}\frac{\partial p}{\partial x}\left[\int_{h^-}^{h^+}\frac{z^2}{\eta}\,dz - \frac{\left(\int_{h^-}^{h^+}\frac{z}{\eta}\,dz\right)^2}{\int_{h^-}^{h^+}\frac{1}{\eta}\,dz}\right] \\
&= \frac{-2S_2}{h^+ - h^-}\frac{\partial p}{\partial x}
\end{aligned}
$$

其中我们定义

$$S_2 = \frac{1}{2}\left[\int_{h^-}^{h^+}\frac{z^2}{\eta}\,dz - \frac{\left(\int_{h^-}^{h^+}\frac{z}{\eta}\,dz\right)^2}{\int_{h^-}^{h^+}\frac{1}{\eta}\,dz}\right] \tag{5.55}$$

量 $S_2$ 称为流动导率（fluidity）。我们使用下标来表示它与本质上是二维的间隙中的流动相关联。

y 方向的平均速度可类似定义为：

$$\bar{v}_y = \frac{1}{h^+ - h^-}\int_{h^-}^{h^+}v_y(z)\,dz \tag{5.56}$$

将方程 5.49 代入方程 5.56，并像对平均 $v_x$ 速度那样完成积分运算，得到：

$$\bar{v}_y = \frac{-2S_2}{h^+ - h^-}\frac{\partial p}{\partial y} \tag{5.57}$$

### 5.6.5 连续性方程的积分

回想第 5.6.3 节，经过量纲分析简化并忽略 z 方向速度后，能量守恒方程的形式为：

$$\rho c_p\left(\frac{\partial T}{\partial t} + v_x\frac{\partial T}{\partial x} + v_y\frac{\partial T}{\partial y}\right) = \beta T\frac{\partial p}{\partial t} + \eta\dot{\gamma}^2 + k\frac{\partial^2 T}{\partial z^2} \tag{5.58}$$

可整理为：

$$\frac{\partial T}{\partial t} + v_x\frac{\partial T}{\partial x} + v_y\frac{\partial T}{\partial y} = \frac{1}{\rho c_p}\left(\beta T\frac{\partial p}{\partial t} + \eta\dot{\gamma}^2 + k\frac{\partial^2 T}{\partial z^2}\right) \tag{5.59}$$

回想第 5.6.3 节的连续性方程为：

$$0 = \kappa\left(\frac{\partial p}{\partial t} + v_x\frac{\partial p}{\partial x} + v_y\frac{\partial p}{\partial y}\right) - \beta\left(\frac{\partial T}{\partial t} + v_x\frac{\partial T}{\partial x} + v_y\frac{\partial T}{\partial y}\right) + \left(\frac{\partial v_x}{\partial x} + \frac{\partial v_y}{\partial y}\right) \tag{5.60}$$

将方程 5.59 代入方程 5.60，得：

$$
\begin{aligned}
0 &= \kappa\left(\frac{\partial p}{\partial t} + v_x\frac{\partial p}{\partial x} + v_y\frac{\partial p}{\partial y}\right) - \frac{\beta}{\rho c_p}\left(\beta T\frac{\partial p}{\partial t} + \eta\dot{\gamma}^2 + k\frac{\partial^2 T}{\partial z^2}\right) + \frac{\partial v_x}{\partial x} + \frac{\partial v_y}{\partial y} \\
&= \left(\kappa - \frac{\beta^2 T}{\rho c_p}\right)\frac{\partial p}{\partial t} + \kappa\left(v_x\frac{\partial p}{\partial x} + v_y\frac{\partial p}{\partial y}\right) - \frac{\beta}{\rho c_p}\left(\eta\dot{\gamma}^2 + k\frac{\partial^2 T}{\partial z^2}\right) + \frac{\partial v_x}{\partial x} + \frac{\partial v_y}{\partial y}
\end{aligned} \tag{5.61}
$$

现在我们将此方程对 z 沿型腔厚度积分，即从 $z = -H$ 到 $z = +H$，得到：

$$0 = \int_{-H}^{+H}\left(\kappa - \frac{\beta^2 T}{\rho c_p}\right)\frac{\partial p}{\partial t}\,dz + \int_{-H}^{+H}\kappa\left(v_x\frac{\partial p}{\partial x} + v_y\frac{\partial p}{\partial y}\right)dz - \int_{-H}^{+H}\frac{\beta}{\rho c_p}\left(\eta\dot{\gamma}^2 + k\frac{\partial^2 T}{\partial z^2}\right)dz + \int_{-H}^{+H}\frac{\partial v_x}{\partial x}\,dz + \int_{-H}^{+H}\frac{\partial v_y}{\partial y}\,dz \tag{5.62}$$

考虑第一项。我们可以把 $\partial p/\partial t$ 提到积分号外，于是

$$\int_{-H}^{+H}\left(\kappa - \frac{\beta^2 T}{\rho c_p}\right)\frac{\partial p}{\partial t}\,dz = \frac{\partial p}{\partial t}\int_{-H}^{+H}\left(\kappa - \frac{\beta^2 T}{\rho c_p}\right)dz = a(x, y)\frac{\partial p}{\partial t} \tag{5.63}$$

其中

$$a(x, y) = \int_{-H}^{+H}\left(\kappa - \frac{\beta^2 T}{\rho c_p}\right)dz \tag{5.64}$$

是关于 z 的常数。

现在考虑方程 5.62 第二项的第一部分。由方程 5.48 我们知道

$$v_x(z) = \frac{\partial p}{\partial x}\left[\int_{h^-}^{z}\frac{z}{\eta}\,dz - C(x, y)\int_{h^-}^{z}\frac{1}{\eta}\,dz\right] \tag{5.65}$$

于是

$$
\begin{aligned}
\int_{-H}^{+H}\kappa v_x\frac{\partial p}{\partial x}\,dz &= \int_{-H}^{+H}\kappa\frac{\partial p}{\partial x}\left(\int_{h^-}^{z}\frac{z}{\eta}\,dz - C(x, y)\int_{h^-}^{z}\frac{1}{\eta}\,dz\right)dz \\
&= \left(\frac{\partial p}{\partial x}\right)^2\left[\int_{-H}^{+H}\kappa\left(\int_{h^-}^{z}\frac{z}{\eta}\,dz\right)dz - C(x, y)\int_{-H}^{+H}\kappa\left(\int_{h^-}^{z}\frac{1}{\eta}\,dz\right)dz\right] \\
&= d(x, y)\left(\frac{\partial p}{\partial x}\right)^2
\end{aligned}
$$

其中

$$d(x, y) = \left[\int_{-H}^{+H}\kappa\left(\int_{h^-}^{z}\frac{z}{\eta}\,dz\right)dz - C(x, y)\int_{-H}^{+H}\kappa\left(\int_{h^-}^{z}\frac{1}{\eta}\,dz\right)dz\right] \tag{5.67}$$

对方程 5.62 第二项的第二个积分做类似考虑，得：

$$
\begin{aligned}
\int_{-H}^{+H}\kappa v_y\frac{\partial p}{\partial y}\,dz &= \int_{-H}^{+H}\kappa\frac{\partial p}{\partial y}\left(\int_{h^-}^{z}\frac{z}{\eta}\,dz - C(x, y)\int_{h^-}^{z}\frac{1}{\eta}\,dz\right)dz \\
&= \left(\frac{\partial p}{\partial y}\right)^2\left[\int_{-H}^{+H}\kappa\left(\int_{h^-}^{z}\frac{z}{\eta}\,dz\right)dz - C(x, y)\int_{-H}^{+H}\kappa\left(\int_{h^-}^{z}\frac{1}{\eta}\,dz\right)dz\right] \\
&= d(x, y)\left(\frac{\partial p}{\partial y}\right)^2
\end{aligned} \tag{5.68}
$$

对于方程 5.62 的第三项，我们令

$$b(x, y) = \int_{-H}^{+H}\frac{\beta}{\rho c_p}\left(\eta\dot{\gamma}^2 + k\frac{\partial^2 T}{\partial z^2}\right)dz \tag{5.69}$$

最后，考虑方程 5.62 的第四项和第五项。利用速度分量在凝固层中为零的假设，我们有：

$$
\begin{aligned}
\int_{-H}^{+H}\frac{\partial v_x}{\partial x}\,dz + \int_{-H}^{+H}\frac{\partial v_y}{\partial y}\,dz &= \int_{h^-}^{h^+}\frac{\partial v_x}{\partial x}\,dz + \int_{h^-}^{h^+}\frac{\partial v_y}{\partial y}\,dz \\
&= \frac{\partial}{\partial x}\int_{h^-}^{h^+}v_x\,dz + \frac{\partial}{\partial y}\int_{h^-}^{h^+}v_y\,dz \\
&= \frac{\partial}{\partial x}\left((h^+ - h^-)\bar{v}_x\right) + \frac{\partial}{\partial y}\left((h^+ - h^-)\bar{v}_y\right) \\
&= -\frac{\partial}{\partial x}\left(2S_2\frac{\partial p}{\partial x}\right) - \frac{\partial}{\partial y}\left(2S_2\frac{\partial p}{\partial y}\right)
\end{aligned}
$$

其中在最后两个表达式中，我们使用了方程 5.50、5.54、5.56 和 5.57 给出的平均速度的定义和数值。

将方程 5.63、5.66、5.68、5.69 和 5.70 代入方程 5.62，得到：

$$0 = a(x, y)\frac{\partial p}{\partial t} + d(x, y)\left(\left(\frac{\partial p}{\partial x}\right)^2 + \left(\frac{\partial p}{\partial y}\right)^2\right) - b(x, y) - \frac{\partial}{\partial x}\left(2S_2\frac{\partial p}{\partial x}\right) - \frac{\partial}{\partial y}\left(2S_2\frac{\partial p}{\partial y}\right) \tag{5.71}$$

#### 5.6.5.1 2.5D 近似小结

我们理解有些读者不愿意细看上面的详细推导。因此我们总结一下 2.5D 近似的假设以及最终得到的方程。

得到 2.5D 方程的步骤是：

- 从第 4 章导出的守恒方程出发，即质量守恒方程 5.5、动量守恒方程 5.6 和能量守恒方程 4.67。
- 忽略能量方程 5.7 中的源项 $\dot{Q}$。
- 假设熔体可用广义牛顿流体建模。
- 假设熔体热导率为常数。这对 2.5D 近似并非必要，但许多程序采用。也可以使用两个值：熔体状态一个热导率值，固体状态另一个值。最高的精细程度是根据特定条件下的实验室测量确定热导率，并考虑加工的影响。
- 采用 z 轴沿制品厚度方向的笛卡尔坐标系。
- 在制品为薄壁的假设下，利用量纲分析去除低阶项。
- 由于薄壁假设，忽略厚度方向（z 方向）的速度。
- 对由薄壁假设得到的动量方程积分，得到依赖于压力梯度的 x 和 y 方向速度，其中压力 $p = p(x, y)$。
- 对连续性（即质量守恒）方程积分，得到压力 $p(x, y)$ 的方程，即方程 5.71。

经过这些步骤，守恒方程 4.13、4.23 和 5.7 简化为一个压力方程：

$$0 = a(x, y)\frac{\partial p}{\partial t} + d(x, y)\left(\left(\frac{\partial p}{\partial x}\right)^2 + \left(\frac{\partial p}{\partial y}\right)^2\right) - b(x, y) - \frac{\partial}{\partial x}\left(2S_2\frac{\partial p}{\partial x}\right) - \frac{\partial}{\partial y}\left(2S_2\frac{\partial p}{\partial y}\right) \tag{5.72}$$

以及简化的能量方程：

$$\rho c_p\left(\frac{\partial T}{\partial t} + v_x\frac{\partial T}{\partial x} + v_y\frac{\partial T}{\partial y}\right) = \beta T\frac{\partial p}{\partial t} + \eta\dot{\gamma}^2 + k\frac{\partial^2 T}{\partial z^2} \tag{5.73}$$

## 5.7 模具冷却分析

我们前面谈到过冷却分析，指的是对聚合物冷却过程的模拟。聚合物的热量传导进入模具，然后进入模具冷却系统。由于聚合物冷却占成型周期的大部分时间，以减少冷却时间为目标对模具冷却阶段进行模拟是有价值的。

尽管非常重要，实践中模具冷却系统常常被当作事后考虑的问题。模具制造商的首要任务是成型制品的形状。这经常需要模具镶件和滑块。冷却系统必须与这些机构共存。模具冷却系统通常由模具中的圆形钻孔构成，冷却液通过钻孔泵送。大多数模具冷却模拟程序对冷却管道做水力分析，并考虑通过模具到冷却管道的温度传导。水力分析可以指出冷却液停滞、不能有效带走热量的问题区域。通常在模具与冷却通道之间定义某种形式的换热系数。这听起来容易，但实践中可能困难。以水作冷却液时，冷却通道上可能积垢或生锈，从而降低其效率。除冷却管道外，还使用喷流管（bubbler）和挡板（baffle）[31, 333] 在模具型芯或无法使用标准冷却管道的区域引入冷却。大多数模具冷却分析软件都提供这些功能。还要注意，我们说的"冷却液"可以是水、乙二醇与水的混合物，或油。当模具温度需要高于 100 ℃ 时（某些高性能聚合物有此要求），常使用油。

除冷却液的水力分析外，模具冷却分析软件基于热传导方程：

$$\frac{\partial T}{\partial t} = \alpha\frac{\partial^2 T}{\partial z^2} \tag{5.74}$$

其中 $\alpha = k/\rho c_p$ 是材料的热扩散率。这是一个瞬态方程，而模具冷却分析的早期版本并未考虑这一点。它们只处理方程 5.74 的右端。

Kwon 等人 [214] 提出了一种相对简单的模具冷却解法。Himasekhar 等人 [157] 对此做了扩展。通过在模具和熔体中考虑带有有限差分格式的一维传导问题，并用几种不同的数值方法，作者得出结论：对模具设计而言，循环平均温度已足够精确。随后 Himasekhar 等人 [157] 实现了一种三维解法，其中模具中的温度用边界元法（BEM）确定，类似于 Burton 和 Rezayat [49] 提出的方法，而聚合物中的传热用有限差分法处理。这成为冷却模拟最常用的方法。即在聚合物中使用有限差分或半解析解，在模具中用 BEM 做完整的三维稳态（或循环平均）传热分析。边界元法之所以有吸引力，是因为它只需对模具外表面划分网格。它还能够处理模具内部不同导热系数的材料，如铍铜（Be-Cu）镶件。

更近一些，人们开发了瞬态模具冷却分析软件。虽然这听起来像是一种进步，但其价值取决于所要回答的问题。如果模具冷却分析的目的是为聚合物冷却建立边界条件，那么使用稳态（或循环平均）方法是合理的。然而，还可以问另一个问题："我的模具需要多长时间才能达到稳态？"对于制造大型模具的人而言，这是一个重要问题，因为大模具达到稳态条件可能需要相当长时间。在这种情况下，瞬态分析是必要的。

Karjalainen [192] 的工作是该领域一项值得注意但鲜为人知的贡献。这项工作在塑料和模具金属中都采用了有限元解法，与其他人使用的边界元方法不同。此外，还使用界面单元来模拟模具块与镶件之间的传热。这是一种精细的方法，但早期的网格生成器无法自动对模具划分网格。这个例子说明，商业模拟需要与现有技术保持同步，以最大限度减少操作员时间、最大化模拟收益。

最后，我们指出模具冷却分析的另一个问题。大多数软件假定冷却过程中塑料与模具保持接触。由于收缩，情况未必如此。实际上，材料收缩贴到型芯上而脱离型腔一侧是常见现象。这极大地改变了聚合物两侧的导热情况。这是采用整体式成型模拟方法的一个很好的理由，即将整个模具和聚合物都纳入数学模型。尽管在注塑成型中出现了"并行工程"的潮流，这种方法与行业惯例相矛盾，因为制品的设计往往很少考虑其制造方式。

## 5.8 纤维取向

在第 4.7.3 节我们发现，对处于浓悬浮范围的纤维填充材料进行准确建模需要统计方法。令 $\psi(\mathbf{p}, t)\,d\mathbf{p}$ 表示在时刻 t 找到取向方向在 $\mathbf{p}$ 到 $\mathbf{p} + d\mathbf{p}$ 范围内的纤维的概率，$\psi(\mathbf{p}, t)$ 满足方程：

$$\frac{\partial \psi}{\partial t} = \frac{\partial}{\partial \mathbf{p}}\left[D^{(r)}(\mathbf{I} - \mathbf{p}\mathbf{p}) \cdot \frac{\partial \psi}{\partial \mathbf{p}} - \left(\mathbf{L} \cdot \mathbf{p} - (\mathbf{L} : \mathbf{p}\mathbf{p})\mathbf{p}\right)\psi\right] \tag{5.75}$$

其中 $D^{(r)}$ 是扩散系数。该方程可以直接求解，但计算代价高昂。例如，假设我们有一个 2.5D 模型，由 1000 个节点在制品中面上定义三角形单元。设型腔厚度在中面上下各由 10 个节点覆盖，则每个中面节点位置在厚度方向上有 21 个节点。如果我们用 20 个 θ 增量覆盖 180 度，用 40 个 φ 增量覆盖 360 度，那么每个节点有 800 个自由度。由于共有 21,000 个节点，模型的自由度为 21,000 × 800 = 16,800,000。以注塑成型的标准看，中面上有 1000 个节点的模型是很小的。几十万节点的情况并不少见。因此我们需要一种更高效的取向计算方法。

### 5.8.1 取向张量

Advani 和 Tucker [2] 引入了一种克服计算量问题的方法。他们定义二阶取向张量 $a_{ij}$ 为

$$a_{ij} \equiv \langle p_i p_j \rangle = \int p_i p_j \psi(\mathbf{p}, t)\,d\mathbf{p} \tag{5.76}$$

其中 $\langle\cdot\rangle$ 称为关于概率密度函数 $\psi(\mathbf{p}, t)$ 的系综平均。由于分布函数是归一化的（见方程 4.74），且 $\mathbf{p}$ 是单位向量，因此 $a_{ij}$ 的迹等于 1。此外，由方程 5.76 有 $a_{ij} = a_{ji}$。因此二阶张量 $a_{ij}$ 只有五个独立分量。图 5.5 给出了一些极端取向状态下二阶张量的示例。

类似地，可以定义四阶取向张量 $a_{ijkl}$：

$$a_{ijkl} \equiv \langle p_i p_j p_k p_l \rangle = \int p_i p_j p_k p_l \psi(\mathbf{p}, t)\,d\mathbf{p} \tag{5.77}$$

现在我们转向 $a_{ij}$ 的计算。第一步是获得 $a_{ij}$ 的演化方程。这需要一些数学处理，见附录 C。由方程 C.46 可得 $a_{ij}$ 的以下演化方程：

$$\frac{\mathrm{D}a_{ij}}{\mathrm{D}t} = W_{ik}a_{kj} - a_{ik}W_{kj} + \frac{a_r^2 - 1}{a_r^2 + 1}\left(D_{ik}a_{kj} + D_{jk}a_{ki} - 2D_{kl}a_{ijkl}\right) + 2D^{(r)}\left(\delta_{ij} - 3a_{ij}\right) \tag{5.78}$$

其中 $D^{(r)}$ 称为旋转扩散系数，它考虑了注塑复合材料是浓悬浮液、纤维之间存在相互作用这一事实。这与上一章讨论的单根纤维的 Jeffery 方程（方程 4.72）形成对比。

### 5.8.2 Folgar-Tucker 方程

计算注塑件纤维取向分布的常用方法是所谓的 Folgar-Tucker 方程 [122]。Folgar 和 Tucker 在方程 5.78 中假设 $D_r = C_I\dot{\gamma}$，得到

$$\frac{\mathrm{D}a_{ij}}{\mathrm{D}t} = W_{ik}a_{kj} - a_{ik}W_{kj} + \frac{a_r^2 - 1}{a_r^2 + 1}\left(D_{ik}a_{kj} + D_{jk}a_{ki} - 2D_{kl}a_{ijkl}\right) + 2C_I\dot{\gamma}\left(\delta_{ij} - 3a_{ij}\right) \tag{5.79}$$

其中 $C_I$ 是一个常数，称为相互作用系数。

方程 5.79 立刻引出两个问题。第一是它不封闭。也就是说，它以高阶张量 $a_{ijkl}$ 的函数形式给出 $a_{ij}$ 的变化率。第二是如何确定相互作用系数 $C_I$。

### 5.8.3 封闭近似

上述第一个问题称为封闭问题。基本上，我们需要把四阶张量 $a_{ijkl}$ 近似为二阶张量 $a_{ij}$ 的函数。这不是一个简单的问题，已引出多种方案。Zheng 等人 [424] 最近在注塑成型背景下评述了几种可用的封闭近似。我们这里只提及四种：

1. 线性封闭
2. 二次封闭
3. 混合封闭
4. 正交各向异性封闭

应注意，封闭近似在平面流动和三维流动中可能取不同形式。

#### 5.8.3.1 线性封闭

线性封闭由 Hand [145] 描述，其三维形式为：

$$a_{ijkl} \approx a_{ijkl}^{\mathrm{lin}} = -\frac{1}{35}\left(\delta_{ij}\delta_{kl} + \delta_{ik}\delta_{jl} + \delta_{il}\delta_{jk}\right) + \frac{1}{7}\left(a_{ij}\delta_{kl} + a_{il}\delta_{jk} + a_{kl}\delta_{ij} + a_{jl}\delta_{ik} + a_{jk}\delta_{il}\right) \tag{5.80}$$

对于平面取向，表达式类似，但系数 1/35 改为 1/24，系数 1/7 改为 1/6。对随机取向，线性封闭是精确的，但当纤维变得更取向时可能不稳定 [3]。

#### 5.8.3.2 二次封闭

Doi [80] 使用过二次封闭。其形式为：

$$a_{ijkl} \approx a_{ijkl}^{\mathrm{quad}} = a_{ij}a_{kl} \tag{5.81}$$

当纤维完全取向时它是精确的，但在瞬态流动中或相互作用系数非零时表现可能较差 [3]。

#### 5.8.3.3 混合封闭

Advani 和 Tucker [3] 提出了线性封闭与二次封闭的混合。其形式为：

$$a_{ijkl} \approx a_{ijkl}^{\mathrm{hybrid}} = (1 - f)a_{ijkl}^{\mathrm{lin}} + f\,a_{ijkl}^{\mathrm{quad}} \tag{5.82}$$

其中

$$f = 1 - 27\det(a_{ij}) \quad \text{（三维取向）} \tag{5.83}$$

以及

$$f = 1 - 4\det(a_{ij}) \quad \text{（平面取向）} \tag{5.84}$$

按其构造，混合近似在纤维随机分布或完全取向时是精确的。然而，它在瞬态剪切流动中倾向于加速取向。

#### 5.8.3.4 正交各向异性封闭

在 Cintra 和 Tucker [62] 引入的这种封闭方案中，四阶张量被近似为二阶取向张量主值的多项式函数。该函数的系数通过对若干简单流动（剪切、拉伸或两者的简单组合）的取向分布函数精确解进行拟合而获得。更多细节见 Cintra 和 Tucker [62]。

#### 5.8.3.5 相互作用系数

相互作用系数自身存在一个问题：目前仍缺乏可从理论上或实验上确定其数值的基础理论。Bay [29] 基于不同浓度下稳态简单剪切流动中 $a_{11}$ 的实验值提出了一种方法。将这些实验结果与用与实验数据吻合最好的 $C_I$ 值数值计算出的 $a_{11}$ 进行比较。实验中使用的聚合物基体为尼龙、聚碳酸酯和聚对苯二甲酸丁二醇酯。然后将 $C_I$ 值对 $\phi a_r$ 作图，得到以下经验关系：

$$C_I = 0.0184\exp(-0.7184\,\phi a_r) \tag{5.85}$$

在 Bay 的实验中，测得的 $a_{11}$ 值随纤维体积分数增大而增大，因此经验公式显示 $C_I$ 随 $\phi a_r$ 增大而减小。这与 Folgar 和 Tucker [122] 对硅油中尼龙纤维观察到的趋势相反。不过，Folgar 和 Tucker 的数据是在半浓悬浮区间测得的，而 Bay 的数据是在浓悬浮区间测得的。Bay [29] 和 Tucker 与 Advani [370] 猜想，在某一浓度（约 $\phi a_r = 1$）附近，纤维间相互作用可能从"扰动"转变为"笼蔽"。

还需要提到，Bay 的工作中使用了混合封闭来拟合数据。采用该封闭时，$C_I$ 值约为 0.01 即可与实验的 $a_{11}$ 值匹配。然而，若使用正交各向异性封闭，数据匹配对应 $C_I = O(0.001)$。因此必须注意，尽管测得的 $a_{11}$ 值与封闭方案无关，$C_I$ 的值，进而经验方程 5.85 的系数，都依赖于所用的封闭近似，正如 Zheng 等人 [424] 所指出的。

模拟软件的用户经常不知道这个困难。关键在于，任何确定相互作用系数的尝试都必须与模拟软件中所用的封闭近似保持一致。

Bay [29] 用实验数据确定 $C_I$ 与 $\phi a_r$ 的关系，而 Phan-Thien 等人 [289] 则对剪切中的纤维运动进行了直接模拟。他们用边界元法计算纤维取向，并在悬浮液达到平衡时计算 $C_I$ 的值。他们提出：

$$C_I = 0.03\left[1 - \exp(-0.224\,\phi a_r)\right] \tag{5.86}$$

直接模拟的结果和经验方程 5.86 与 Folgar 和 Tucker [122] 的数据相当吻合，如图 5.6 所示。

本节的最后我们指出，没有理由要求相互作用系数各向同性，即取标量值。实际上，Phan-Thien 等人 [289] 假定相互作用系数是一个张量，图 5.6 所示的结果使用了相互作用系数张量迹的三分之一作为 $C_I$ 的值。

我们将在第二部分讨论 Folgar-Tucker 模型的其他不足与改进。

## 5.9 收缩与翘曲

从前面的章节可以看到，由于对材料属性认识不足，以及在较小程度上由于计算时间的限制，为使控制方程更易于处理，我们引入了许多近似。后者虽然在学术研究中算不上真正的障碍，却对商业程序有很大影响。到目前为止，我们处理的是注塑成型中压力、温度和速度的预测。有了这些信息，熟练的用户可以确定浇口数量、浇口位置、熔接线位置以及制造制品所需注塑机的规格。利用启发式经验和模拟结果，用户可以尝试减小制品中的应力并提高质量 [31, 333]。尽管如此，成型模拟的最大目标是准确预测收缩与翘曲。读者应注意，这里涉及几个时间尺度。第一个是注射后时间尺度，制品可能在成型后不久就被装配。当考虑后成型工序（如喷漆，涉及暴露于高温）时引入更长的时间尺度，而更长的时间尺度是制品在使用寿命期间的性能。因此收缩与翘曲是随时间变化的。虽然聚合物的进步减小了时间尺度问题，但许多具有重大商业价值的通用聚合物确实需要对其随时间变化的性能进行细致考虑。

目前无论商业还是学术程序，都不具备考虑时间对成型制品影响的能力。这需要一些解释。所谓考虑时间效应，是指计算制品脱模后的性能。虽然我们可以计算脱模时的收缩与翘曲，但真实制品在脱模后，乃至其整个使用期间，可能经历温度-时间历程。要考虑这一点，我们需要计算脱模后的属性，并考虑环境影响，包括与其他零件的力学相互作用。时间依赖性仍是聚合物科学的一大挑战。

我们不打算指责模拟程序目前的不足。相反，我们试图说明当前使用的简化会在哪里产生误差。在第二部分，我们给出一些改进收缩与翘曲预测背后科学的初步建议。不过目前，我们先考虑实际中的做法。

### 5.9.1 收缩预测

最早处理收缩计算的尝试之一，是试图把模塑样品上测得的收缩与注塑条件（如注射时间、保压压力和冷却时间）关联起来。这种方法对单一模具与材料的组合可能有用，但不能普遍应用于任何模具，即使是给定材料也不行。

这一思想的进一步发展，是试图把注塑条件归并成若干函数，用以反映注塑件中观察到的某些物理特性，即下一节所述的各向异性收缩。

#### 5.9.1.1 残余应变法

Moldflow 引入的模型形式为 [390]：

$$S_{\parallel} = \sum_{i=1}^{5} b_i M_i \tag{5.87}$$

$$S_{\perp} = \sum_{i=6}^{10} b_i M_i \tag{5.88}$$

其中 $S_{\parallel}$ 和 $S_{\perp}$ 分别是平行和垂直于流动方向计算出的收缩应变，$b_i$ 是材料常数，$M_i$ 是加工影响的度量，由充填和保压分析的结果计算。$M_1 = M_6$，为体积收缩；$M_2 = M_7$，为结晶度水平的度量；$M_3 \neq M_8$，为分子取向的度量；$M_4 = M_9$，为松弛影响的度量；$M_5 = M_{10}$ 为常数，如果模型对给定材料有效，其值应当很小。材料常数 $b_i$（$i = 1, \ldots, 10$）通过以下步骤获得：

- 以不同工艺条件或厚度模塑 28 个样品。样品在装有仪器的模具和装有仪器的注塑机上制作。实测数据用于确定每个样品所用的加工条件。
- 利用刻蚀在模具上的网格图案（见图 5.7），在平行和垂直于流动方向上测量每个样品的收缩。模具上由点 3254、4589、2165 和 6785 定义四个区域。在每个区域内测量收缩。例如，在区域 3254 中，沿流动方向在点 3 与点 2 之间以及点 4 与点 5 之间测量收缩；横跨流动方向在点 3 与点 4 之间以及点 2 与点 5 之间测量收缩。
- 在与成型相同的条件下运行模拟，以确定 $M_i$（$i = 1, \ldots, 10$）的值。
- 将测得的收缩和计算出的 $M_i$（$i = 1, \ldots, 10$）值代入方程 5.87 和 5.88，通过回归分析计算 $b_i$（$i = 1, \ldots, 10$）。

材料常数 $b_i$（$i = 1, \ldots, 10$）存储在数据库中。使用时，用户运行分析确定 $M_i$（$i = 1, \ldots, 10$），然后用方程 5.87 和 5.88 计算网格中每个单元平行和垂直于流动方向的应变。流动方向角也基于流动分析结果逐单元计算。计算出的应变随后输入结构分析，以确定变形形状。众所周知，模具两半之间的任何温差都会对翘曲产生显著影响。这类温差通常由冷却分析确定。在残余应变模型中，模具两半之间温差的影响是通过修改单元顶部和底部的收缩应变以产生弯矩来引入的。

该技术已成功应用于未填充以及短纤维增强的无定形和半结晶材料。

需要模塑样品以确定收缩系数 $b_i$（$i = 1, \ldots, 10$）是该方法的一个缺点，但为获得合理的精度是必需的。对于短纤维增强热塑性塑料，可以假定结晶程度、分子取向和模具约束相对于体积收缩和由此产生的纤维取向分布是二阶效应。1997 年，Zheng 等人 [423] 提出了一种专门用于增强材料的收缩应变计算模型。该模型不需要模塑样品，并能很好地预测变形形状，但倾向于低估实际变形量。

#### 5.9.1.2 残余应力模型

注塑成型中产生三类残余应力：

- 流动诱导应力，源于流动对材料分子构象的影响；
- 压力诱导应力，源于保压阶段凝固层内存在的流体芯；
- 热残余应力，源于材料凝固时的热收缩。

Baaijens [21] 表明，流动诱导应力比压力诱导应力和热残余应力小一个数量级。不过我们注意到，流动诱导应力对各向异性材料属性的形成有重要影响，因此在翘曲模拟中是重要的 [246]。

残余应力计算的早期工作受玻璃残余应力文献 [219] 的影响，关注粘弹性或弹性本构模型的使用 [185, 320]。然而，玻璃冷却与成型之间存在一个重要区别，即保压压力的影响。自由淬冷材料（如玻璃制造）中应力的来源是温度变化。材料从外部开始冷却，与成型类似，由此产生的残余应力分布通常是表面受压、芯部受拉。然而在注塑成型中，残余应力分布由保压阶段变化的压力历程与冷却导致的凝固层增厚共同决定，表面层的应力可能变为拉应力。Baaijens [21] 注意到这一效应，并针对无定形材料发展了一种各向同性的热粘弹性模型，同时考虑了热应力和保压阶段所施加压力诱导的应力。

残余应力模型是胡克定律的推广。对于弹性固体，胡克定律的形式为：

$$\sigma_{ij} = c_{ijkl}^{e}\varepsilon_{kl} \tag{5.89}$$

其中 $\sigma_{ij}$ 和 $\varepsilon_{kl}$ 分别为应力张量和总应变张量，$c_{ijkl}^{e}$ 是弹性常数张量或刚度张量。应变张量由位移向量 $\mathbf{u}$ 的各分量求导确定，定义为：

$$\varepsilon_{ij} = \frac{1}{2}\left(\frac{\partial u_i}{\partial x_j} + \frac{\partial u_j}{\partial x_i}\right) \tag{5.90}$$

残余应力模型常用粘弹性本构关系来表述 [21, 308]。一般的线性各向异性热粘弹性本构关系可写为：

$$\sigma_{ij} = \int_{0}^{t}\left[c_{ijkl}\left(\xi(t) - \xi(t')\right)\frac{\partial \varepsilon_{kl}}{\partial t'} - \alpha_{kl}\left(\xi(t) - \xi(t')\right)\frac{\partial T}{\partial t'}\right]dt' \tag{5.91}$$

其中 $c_{ijkl}$ 是粘弹性松弛模量，t 是时间，T 是温度，$\alpha_{kl}$ 是热膨胀系数张量，$\xi(t)$ 是伪时间尺度，定义为：

$$\xi(t) = \int_{0}^{t}\frac{1}{a_T}\,dt' \tag{5.92}$$

其中 $a_T$ 是时温平移因子，用于考虑温度对材料响应的影响。

将方程 5.91 用于非等温系统时会遇到一个问题。首先，方程 5.91 假定材料是热流变简单的，即材料的线性粘弹行为随温度的变化对应于对数时间尺度上的平移 [325]。遗憾的是，要获得满足热流变简单假设的松弛函数材料数据并不总是可能的，因为大量真实材料实际上是热流变复杂的。其次，方程 5.91 中使用的松弛函数可能依赖于内部结构，而内部结构本身又受加工条件影响，对涉及半结晶材料和相变的系统尤其如此。内部结构与松弛函数之间的确切关系在很大程度上是未知的（无论理论上还是实验上）。由于上述与粘弹性数据相关的复杂性，通常用粘性-弹性计算进一步近似该问题：假定材料在某一温度以上不承受应力，在该温度以下为弹性。但这个温度应取多少？我们在第 5.3.5 节讨论过类似问题。在那里，问题通过引入转变温度或不流动温度来解决。对翘曲而言，通常采用同样的方法，假定转变温度 $T_t$ 是材料不再承受应力的温度界限。低于该温度时，材料被假定为弹性。在此假设下，有：

$$
\sigma_{ij} = \begin{cases}
0 & \text{当 } T \geq T_t \\[1ex]
\displaystyle\int_{0}^{t}\left[c_{ijkl}^{e}\frac{\partial \varepsilon_{kl}}{\partial t'} - \alpha_{kl}\frac{\partial T}{\partial t'}\right]dt' & \text{当 } T < T_t
\end{cases} \tag{5.93}
$$

Zheng 等人 [420] 给出了关于残余应力计算更详尽的讨论，包括短纤维增强热塑性塑料等各向异性材料的情形。

方程 5.93 通常在以下假设下求解：

1. 相对于 z 方向垂直于局部中面的局部坐标系，剪切应变 $\varepsilon_{13} = \varepsilon_{23} = 0$。
2. 正应力 $\sigma_{33}$ 沿厚度方向为常数。
3. 只要 $\sigma_{33} < 0$，材料就贴附于模具壁面。
4. 脱模前，制品在制品平面内受到完全约束，唯一的非零应变分量为 $\varepsilon_{33}$。
5. 忽略模具弹性。
6. 制品脱模后，材料表现为弹性固体。

实践中，残余应力用有限元分析计算。所涉及的离散化意味着在厚度方向的各网格点上对每个单元计算残余应力。因此，方程 5.93 可写为：

$$
\sigma_{ij}^{(e)}(z_i) = \begin{cases}
0 & \text{当 } T \geq T_t \\[1ex]
\displaystyle\int_{0}^{t}\left[c_{ijkl}^{e}\frac{\partial \varepsilon_{kl}}{\partial t'} - \alpha_{kl}\frac{\partial T}{\partial t'}\right]dt' & \text{当 } T < T_t
\end{cases} \tag{5.94}
$$

其中下标 (e) 指单元编号，应力在每个网格点 $z_i \in [-H, H]$ 上计算。为得到制品的收缩，计算出的残余应力被用作结构分析的载荷条件。这需要一组额外的边界条件来防止几何体的刚体运动。我们通过在制品上选取三个不共线的节点来实现。分别用 $u_x$、$u_y$ 和 $u_z$ 表示坐标方向 x、y 和 z 上的位移自由度，定义边界条件为：

$$\text{节点 1：} u_x = u_y = u_z = 0 \tag{5.95}$$

$$\text{节点 2：} u_x = u_y = 0 \tag{5.96}$$

$$\text{节点 3：} u_z = 0 \tag{5.97}$$

所有转动自由度不受约束。有了这些边界条件，制品可以自由收缩和变形，而刚体运动被阻止。可以计算变形，并由此确定翘曲和收缩。

为说明上述粘性-弹性模型的表现，我们提供一个例子。Luye [233] 在尺寸为 60 mm × 60 mm × 3 mm 的 ISO 模具中，对 Solvay 生产的 iPP（PHV 252）测量了压力和收缩。成型所用的工艺条件见表 5.1。

**表 5.1 成型条件**

| 成型参数 | 数值 |
|---|---|
| 熔体温度 | 220 ℃ |
| 注射时间 | 1 s |
| 模具温度 | 43 ℃ |
| 冷却液流量 | 7 l/min |
| 喷嘴保压压力 | 80 MPa |
| 保压时间 | 15 s |
| 总冷却时间（保压时间 + 冷却时间） | 40 s |

图 5.8 显示了用表 5.1 相同条件运行的模拟所得压力曲线，固定转变温度范围为 118–160 ℃，实测曲线取自 [233]。这些模拟不涉及结晶动力学，基于本章前面介绍的 2.5D 中面理论。材料的实际转变温度用前面讨论的 DSC 技术测得为 118 ℃。显然，所选转变温度的值对保压阶段的压力衰减有显著影响。

一个显而易见的问题是：这对收缩有什么影响？在图 5.9 中，我们用图 5.8 的转变温度以及前面描述的粘性-弹性模型计算了流动方向的收缩。

不出所料，影响是显著的。任何改进半结晶材料收缩与翘曲预测的尝试都需要克服固定转变温度的使用。这将在第 10 章和第 11 章进一步讨论。

Kennedy 和 Zheng [200] 讨论了为理论模型获取材料数据的困难。为克服这个问题，他们提出了一种半经验模型，引入一些修正因子来调整理论预测结果，并用简单几何模塑样品上测得的收缩数据，通过多变量回归技术确定不同材料的修正因子。这种方法在商业软件中称为 CRIMS（修正模内残余应力）方法。

## 5.10 流道的 2.5D 近似

流道常为梯形截面，以确保制品易于从模具中脱出。然而大多数 2.5D 充填模拟软件只使用圆形截面的流道。虽然模拟程序的用户可以选择各种截面，但软件一般会将其折算为等效圆形截面。不过，这可能不是一个令人满意的近似，会在剪切生热计算和熔体绕拐角对流中引入误差。尽管如此，我们暂且忽略这一点，留待第 6.4 节讨论。

与型腔一样，流道系统中的流动由质量、动量和能量守恒方程决定。不过，利用第 5.2 节讨论的材料近似以及关于流道轴线的对称假设，可以得到简化。图 5.10 显示了圆形流道的几何形状及其相关坐标系。我们假设温度场和流动场关于流道纵轴对称。因此没有任何量依赖于 θ。特别地，这意味着熔体与凝固层之间的界面只依赖于 r 和 x。

考虑流道系统最重要的方面，是对质量、动量和能量守恒方程采用柱坐标系。我们这里给出这些方程，并在本章后面和第 6 章考察进一步的近似。

### 5.10.1 流道的质量守恒

质量守恒方程（方程 4.13）可用柱坐标表示为 [35, 260]：

$$\frac{\partial \rho}{\partial t} + \rho\left(\frac{1}{r}\frac{\partial}{\partial r}(rv_r) + \frac{\partial v_x}{\partial x}\right) + v_r\frac{\partial \rho}{\partial r} + \frac{v_\theta}{r}\frac{\partial \rho}{\partial \theta} + v_x\frac{\partial \rho}{\partial x} = 0 \tag{5.98}$$

由于关于流道轴线对称，涉及 θ 导数的项为零，方程 5.98 变为：

$$\frac{\partial \rho}{\partial t} + \rho\left(\frac{1}{r}\frac{\partial}{\partial r}(rv_r) + \frac{\partial v_x}{\partial x}\right) + v_r\frac{\partial \rho}{\partial r} + v_x\frac{\partial \rho}{\partial x} = 0 \tag{5.99}$$

密度 ρ 同时依赖于温度和压力。因此，利用微分链式法则以及方程 3.23 和 3.26 给出的膨胀系数与压缩系数定义，有：

$$\frac{\partial \rho}{\partial t} = \left(\frac{\partial \rho}{\partial p}\right)_T\frac{\partial p}{\partial t} + \left(\frac{\partial \rho}{\partial T}\right)_p\frac{\partial T}{\partial t} = \rho\kappa\frac{\partial p}{\partial t} - \rho\beta\frac{\partial T}{\partial t} \tag{5.100}$$

$$\frac{\partial \rho}{\partial r} = \left(\frac{\partial \rho}{\partial p}\right)_T\frac{\partial p}{\partial r} + \left(\frac{\partial \rho}{\partial T}\right)_p\frac{\partial T}{\partial r} = \rho\kappa\frac{\partial p}{\partial r} - \rho\beta\frac{\partial T}{\partial r} \tag{5.101}$$

$$\frac{\partial \rho}{\partial x} = \left(\frac{\partial \rho}{\partial p}\right)_T\frac{\partial p}{\partial x} + \left(\frac{\partial \rho}{\partial T}\right)_p\frac{\partial T}{\partial x} = \rho\kappa\frac{\partial p}{\partial x} - \rho\beta\frac{\partial T}{\partial x} \tag{5.102}$$

将这些表达式代入方程 5.99 并整理，得：

$$\kappa\left(\frac{\partial p}{\partial t} + v_r\frac{\partial p}{\partial r} + v_x\frac{\partial p}{\partial x}\right) - \beta\left(\frac{\partial T}{\partial t} + v_r\frac{\partial T}{\partial r} + v_x\frac{\partial T}{\partial x}\right) + \frac{1}{r}\frac{\partial}{\partial r}(rv_r) + \frac{\partial v_x}{\partial x} = 0 \tag{5.103}$$

通常忽略径向的压力变化以及压力对流项，于是

$$\kappa\frac{\partial p}{\partial t} - \beta\left(\frac{\partial T}{\partial t} + v_r\frac{\partial T}{\partial r} + v_x\frac{\partial T}{\partial x}\right) + \frac{1}{r}\frac{\partial}{\partial r}(rv_r) + \frac{\partial v_x}{\partial x} = 0 \tag{5.104}$$

忽略径向压力依赖与忽略型腔厚度方向的压力依赖是类似的。这会在流动前沿处引入误差，那里熔体从中心线被对流到流道壁面（喷泉流动）。不过，与型腔中一样，这些误差在流动前沿通过后会减小。

关于流道轴线温度对称的假设虽然看似合理，但当流道向多个相似型腔供料时，会在温度场的对流中引入误差。这些误差取决于工艺条件和流道布置。如果流道系统中存在显著的剪切生热，误差会变得更明显，并可能导致模塑件的充填时间和性能出现差异。我们将在第 6.4 节更详细地讨论这一点。

### 5.10.2 流道的动量守恒

在柱坐标中，动量方程（方程 5.12）可写为三个标量方程 [35, 260]：

- r 分量：

$$\rho\frac{\partial v_r}{\partial t} = \rho g_r - \frac{\partial p}{\partial r} + \frac{2}{r}\frac{\partial}{\partial r}\left(r\eta\frac{\partial v_r}{\partial r}\right) + \frac{\partial}{\partial x}\left(\eta\left(\frac{\partial v_r}{\partial x} + \frac{\partial v_x}{\partial r}\right)\right) - \frac{2\eta v_r}{r^2} - \rho\left(v_r\frac{\partial v_r}{\partial r} - \frac{v_\theta^2}{r} + v_x\frac{\partial v_r}{\partial x}\right) \tag{5.105}$$

- θ 分量：

$$\rho\frac{\partial v_\theta}{\partial t} = \rho g_\theta - \frac{1}{r}\frac{\partial p}{\partial \theta} + \frac{1}{r^2}\frac{\partial}{\partial r}\left(r^3\eta\frac{\partial}{\partial r}\left(\frac{v_\theta}{r}\right)\right) + \frac{\partial}{\partial x}\left(\eta\frac{\partial v_\theta}{\partial x}\right) - \rho\left(v_r\frac{\partial v_\theta}{\partial r} + \frac{v_\theta v_r}{r} + v_x\frac{\partial v_\theta}{\partial x}\right) \tag{5.106}$$

- x 分量：

$$\rho\frac{\partial v_x}{\partial t} = \rho g_x - \frac{\partial p}{\partial x} + \frac{1}{r}\frac{\partial}{\partial r}\left(r\eta\left(\frac{\partial v_r}{\partial x} + \frac{\partial v_x}{\partial r}\right)\right) + 2\frac{\partial}{\partial x}\left(\eta\frac{\partial v_x}{\partial x}\right) - \rho\left(v_r\frac{\partial v_x}{\partial r} + v_x\frac{\partial v_x}{\partial x}\right) \tag{5.107}$$

忽略体积力，假设关于流道中心轴线对称，并运用第 5.6.2 节的量纲分析技术确定各项的量级，动量方程可简化为：

$$\frac{\partial p}{\partial r} = 0, \qquad \frac{\partial p}{\partial \theta} = 0, \qquad \frac{\partial p}{\partial x} = \frac{1}{r}\frac{\partial}{\partial r}\left(r\eta\frac{\partial v_x}{\partial r}\right) \tag{5.108}$$

### 5.10.3 流道的能量守恒

利用柱坐标中的梯度和拉普拉斯算子 [35, 260]，能量方程（方程 5.13）可用柱坐标写为：

$$\rho c_p\left(\frac{\partial T}{\partial t} + v_r\frac{\partial T}{\partial r} + \frac{v_\theta}{r}\frac{\partial T}{\partial \theta} + v_x\frac{\partial T}{\partial x}\right) = \beta T\left(\frac{\partial p}{\partial t} + v_r\frac{\partial p}{\partial r} + \frac{v_\theta}{r}\frac{\partial T}{\partial \theta} + v_x\frac{\partial p}{\partial x}\right) + \eta\dot{\gamma}^2 + k\left(\frac{1}{r}\frac{\partial}{\partial r}\left(r\frac{\partial T}{\partial r}\right) + \frac{\partial^2 T}{\partial x^2}\right) \tag{5.109}$$

其中

$$\dot{\gamma} = \frac{\partial v_x}{\partial r} \tag{5.110}$$

假设流道为圆形，因而温度场和压力场与 θ 无关，方程 5.109 变为：

$$\rho c_p\left(\frac{\partial T}{\partial t} + v_r\frac{\partial T}{\partial r} + v_x\frac{\partial T}{\partial x}\right) = \beta T\left(\frac{\partial p}{\partial t} + v_r\frac{\partial p}{\partial r} + v_x\frac{\partial p}{\partial x}\right) + \eta\dot{\gamma}^2 + k\left(\frac{1}{r}\frac{\partial}{\partial r}\left(r\frac{\partial T}{\partial r}\right) + \frac{\partial^2 T}{\partial x^2}\right) \tag{5.111}$$

进一步的简化通过忽略径向压力变化 $\partial p/\partial r$ 和 x 方向的传导项 $\partial^2 T/\partial x^2$ 获得。前者在流动前沿处是不合理的，类似于在型腔中忽略速度 $v_z$。此外，该假设在流道系统的弯折处也不成立。这可能很重要，将在第 6.4 节讨论。忽略沿 x 方向的温度传导是合理的，可由量纲分析证实。最后我们忽略压力对流项 $v_x\partial p/\partial x$。考虑到这些进一步的假设，我们得到能量方程的 2.5D 近似最终形式：

$$\rho c_p\left(\frac{\partial T}{\partial t} + v_r\frac{\partial T}{\partial r} + v_x\frac{\partial T}{\partial x}\right) = \beta T\frac{\partial p}{\partial t} + \eta\dot{\gamma}^2 + \frac{k}{r}\frac{\partial}{\partial r}\left(r\frac{\partial T}{\partial r}\right) \tag{5.112}$$

### 5.10.4 流道动量方程的积分

在第 5.6.4 节中，我们对型腔的动量方程积分，得到了速度 $v_x$ 和 $v_y$ 的表达式。方程 5.108 给出的流道动量方程可以做类似处理。非平凡的动量方程，即方程 5.108，

$$\frac{\partial p}{\partial x} = \frac{1}{r}\frac{\partial}{\partial r}\left(r\eta\frac{\partial v_x}{\partial r}\right) \tag{5.113}$$

两边同乘以 r，然后对 r 积分，得到

$$\frac{\partial p}{\partial x}\int_{0}^{r}r'\,dr' = \int_{0}^{r}\frac{\partial}{\partial r'}\left(r'\eta\frac{\partial v_x}{\partial r'}\right)dr'$$

$$\frac{1}{2}\frac{\partial p}{\partial x}r^2 = r\eta\frac{\partial v_x}{\partial r} \tag{5.114}$$

将方程 5.114 两边除以 $r\eta$，再对 r 积分一次，

$$\frac{1}{2}\frac{\partial p}{\partial x}\int_{0}^{r}\frac{r'}{\eta}\,dr' = \int_{0}^{r}\frac{\partial v_x}{\partial r'}\,dr' = v_x(r) - v_x(0) \tag{5.115}$$

令 $r^+$ 表示凝固层与熔体界面处的 r 值，如图 5.10 所示。按照定义，速度 $v_x$ 在凝固层中为零，故 $v_x(r^+) = 0$。于是由方程 5.115，

$$v_x(0) = -\frac{1}{2}\frac{\partial p}{\partial x}\int_{0}^{r^+}\frac{r'}{\eta}\,dr' \tag{5.116}$$

因此，方程 5.115 变为：

$$v_x(r) = \frac{1}{2}\frac{\partial p}{\partial x}\left[\int_{0}^{r}\frac{r'}{\eta}\,dr' - \int_{0}^{r^+}\frac{r'}{\eta}\,dr'\right] \tag{5.117}$$

点 x 处 x 方向的平均速度 $\bar{v}_x$ 可定义为：x 处通过流道的总流量除以 x 处熔体通道的面积 $A_c$。即，

$$\bar{v}_x(x) = \frac{1}{A_c}\int_{A_c}v_x(r)\,dA \tag{5.118}$$

由图 5.10，并因我们假设了圆形截面，有 $A = \pi r^2$、$A_c = \pi r^{+2}$。于是方程 5.118 变为：

$$\bar{v}_x(x) = \frac{1}{\pi r^{+2}}\int_{0}^{r^+}2\pi r\,v_x(r)\,dr = \frac{2}{r^{+2}}\int_{0}^{r^+}r\,v_x(r)\,dr \tag{5.119}$$

方程 5.117 定义了 $v_x(r)$，可代入方程 5.119：

$$
\begin{aligned}
\bar{v}_x(x) &= \frac{1}{r^{+2}}\frac{\partial p}{\partial x}\left[\int_{0}^{r^+}\left(\int_{0}^{r}\frac{r'}{\eta}\,dr'\right)r\,dr - \int_{0}^{r^+}\left(\int_{0}^{r^+}\frac{r'}{\eta}\,dr'\right)r\,dr\right] \\
&= \frac{1}{r^{+2}}\frac{\partial p}{\partial x}\left[\int_{0}^{r^+}\left(\int_{0}^{r}\frac{r'}{\eta}\,dr'\right)r\,dr - \frac{r^{+2}}{2}\int_{0}^{r^+}\frac{r'}{\eta}\,dr'\right]
\end{aligned} \tag{5.120}
$$

方程 5.120 右端的二重积分可用第 4.2.4 节讨论的分部积分计算。为此，令

$$M = \int_{0}^{r}\frac{r'}{\eta}\,dr' \tag{5.121}$$

以及

$$N = \frac{1}{2}r^2 \tag{5.122}$$

于是方程 5.120 右端的二重积分可写为：

$$
\begin{aligned}
\int_{0}^{r^+}\left(\int_{0}^{r}\frac{r'}{\eta}\,dr'\right)r\,dr &= \int_{0}^{r^+}MN'\,dr = \left[MN\right]_{0}^{r^+} - \int_{0}^{r^+}M'N\,dr \\
&= \frac{1}{2}r^{+2}\int_{0}^{r^+}\frac{r'}{\eta}\,dr' - \frac{1}{2}\int_{0}^{r^+}\frac{r'^3}{\eta}\,dr'
\end{aligned}
$$

将此结果代入方程 5.119，得

$$\bar{v}_x(x) = -\frac{\partial p}{\partial x}\frac{1}{2r^{+2}}\int_{0}^{r^+}\frac{r'^3}{\eta}\,dr' = -\frac{S_1}{r^+}\frac{\partial p}{\partial x} $$

其中流动导率 $S_1$ 定义为

$$S_1 = \frac{1}{2r^+}\int_{0}^{r^+}\frac{r'^3}{\eta}\,dr' \tag{5.124}$$

注意，流动导率下标 1 用于将其与第 5.6.4 节型腔的流动导率 $S_2$ 区分开。

### 5.10.5 流道连续性方程的积分

上一节建立了一个把平均速度与沿流道压降联系起来的方程。为了将动量方程与连续性方程结合，我们对连续性方程积分，并利用平均速度建立流道系统中压力的单一方程。

我们将能量方程（方程 5.112）整理为：

$$\frac{\partial T}{\partial t} + v_r\frac{\partial T}{\partial r} + v_x\frac{\partial T}{\partial x} = \frac{1}{\rho c_p}\left[\beta T\frac{\partial p}{\partial t} + \eta\dot{\gamma}^2 + \frac{k}{r}\frac{\partial}{\partial r}\left(r\frac{\partial T}{\partial r}\right)\right] \tag{5.125}$$

将其代入连续性方程（方程 5.104），得到：

$$
\begin{aligned}
0 &= \kappa\frac{\partial p}{\partial t} - \beta\left(\frac{\partial T}{\partial t} + v_r\frac{\partial T}{\partial r} + v_x\frac{\partial T}{\partial x}\right) + \frac{1}{r}\frac{\partial}{\partial r}(rv_r) + \frac{\partial v_x}{\partial x} \\
&= \kappa\frac{\partial p}{\partial t} - \frac{\beta}{\rho c_p}\left[\beta T\frac{\partial p}{\partial t} + \eta\dot{\gamma}^2 + \frac{k}{r}\frac{\partial}{\partial r}\left(r\frac{\partial T}{\partial r}\right)\right] + \frac{1}{r}\frac{\partial}{\partial r}(rv_r) + \frac{\partial v_x}{\partial x}
\end{aligned} \tag{5.126}
$$

利用量纲分析，量 $\beta^2 T/\rho c_p$ 远小于 κ，因此可以忽略。于是方程 5.126 变为：

$$0 = \kappa\frac{\partial p}{\partial t} - \frac{\beta}{\rho c_p}\left[\eta\dot{\gamma}^2 + \frac{k}{r}\frac{\partial}{\partial r}\left(r\frac{\partial T}{\partial r}\right)\right] + \frac{1}{r}\frac{\partial}{\partial r}(rv_r) + \frac{\partial v_x}{\partial x} \tag{5.127}$$

取 $A_c = \pi R^2$ 为流道横截面积，压缩系数的平均值 $\bar{\kappa}_c$ 可定义为：

$$\bar{\kappa}_c = \frac{1}{A_c}\int_{A_c}\kappa\,dA = \frac{2}{R^2}\int_{0}^{R}\kappa r\,dr \tag{5.128}$$

注意到 $dp/dt$ 与 x 无关，并利用平均压缩系数，方程 5.127 可沿流道横截面积分，得到

$$
\begin{aligned}
0 &= 2\pi\int_{0}^{R}\left[\kappa\frac{\partial p}{\partial t} - \frac{\beta}{\rho c_p}\left(\eta\dot{\gamma}^2 + \frac{k}{r}\frac{\partial}{\partial r}\left(r\frac{\partial T}{\partial r}\right)\right) + \frac{1}{r}\frac{\partial}{\partial r}(rv_r) + \frac{\partial v_x}{\partial x}\right]r\,dr \\
&= 2\pi\frac{\partial p}{\partial t}\int_{0}^{R}\kappa r\,dr - 2\pi\int_{0}^{R}\frac{\beta}{\rho c_p}\left(\eta\dot{\gamma}^2 + \frac{k}{r}\frac{\partial}{\partial r}\left(r\frac{\partial T}{\partial r}\right)\right)r\,dr + 2\pi\int_{0}^{R}\left[\frac{1}{r}\frac{\partial}{\partial r}(rv_r) + \frac{\partial v_x}{\partial x}\right]r\,dr \\
&= 2\pi\left[\frac{1}{2}\bar{\kappa}_c R^2\frac{\partial p}{\partial t} - \int_{0}^{R}\frac{\beta}{\rho c_p}\left(\eta\dot{\gamma}^2 + \frac{k}{r}\frac{\partial}{\partial r}\left(r\frac{\partial T}{\partial r}\right)\right)r\,dr + \int_{0}^{r^+}\left(\frac{1}{r}\frac{\partial}{\partial r}(rv_r) + \frac{\partial v_x}{\partial x}\right)r\,dr\right]
\end{aligned} \tag{5.129}
$$

现在考虑方程 5.129 右端的最后一项：

$$2\pi\int_{0}^{r^+}\left[\frac{1}{r}\frac{\partial}{\partial r}(rv_r) + \frac{\partial v_x}{\partial x}\right]r\,dr = 2\pi\left[r v_r\Big|_{r=0}^{r=r^+} + \frac{\partial}{\partial x}\int_{0}^{r^+}v_x(r)\,r\,dr\right] = 2\pi\frac{\partial}{\partial x}\left(\frac{\bar{v}_x(x)\,r^+}{2}\right) = -\pi\frac{\partial}{\partial x}\left(r^+ S_1\frac{\partial p}{\partial x}\right) \tag{5.130}$$

其中在最后两步中，我们使用了平均速度方程 5.123。将方程 5.130 代入方程 5.129，得：

$$0 = \bar{\kappa}_c R^2\frac{\partial p}{\partial t} - 2\int_{0}^{R}\frac{\beta}{\rho c_p}\left[\eta\dot{\gamma}^2 + \frac{k}{r}\frac{\partial}{\partial r}\left(r\frac{\partial T}{\partial r}\right)\right]r\,dr - \frac{\partial}{\partial x}\left(r^+ S_1\frac{\partial p}{\partial x}\right) \tag{5.131}$$

流道的 2.5D 处理至此结束。

</div>
