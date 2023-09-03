<TeXmacs|2.1>

<style|generic>

<\body>
  <\hide-preamble>
    \;
  </hide-preamble>

  <doc-data|<doc-title|Human-AI Collaboration
  Project>|<doc-author|<author-data|<author-name|Jack Yansong Li>>>>

  <section|Proved Result>

  <\definition>
    <label|def:strong-type>We call two policies <math|\<pi\>> and
    <math|\<pi\><rprime|'>> to be of the same <with|font-shape|italic|type>
    if\ 

    <\equation*>
      V<around*|(|\<mu\>,\<pi\>|)>=V<around*|(|\<mu\>,\<pi\><rprime|'>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\>|)>=V<around*|(|\<mu\><rprime|'>,\<pi\><rprime|'>|)><label|eq:st-condition>
    </equation*>

    for all <math|\<mu\>\<in\>BR<around*|(|\<pi\>|)>> and
    <math|\<mu\><rprime|'>\<in\>BR<around*|(|\<pi\><rprime|'>|)>>.\ 
  </definition>

  <\definition>
    <label|def:size-type>Given a hypothesis set <math|\<cal-H\>>. For two
    policies <math|\<pi\>\<in\>\<cal-H\>> and
    <math|\<pi\><rprime|'>\<in\>\<cal-H\>> be of the same type, we randomly
    eliminate one of them and construct a reduced hypothesis set
    <math|\<cal-H\><rsub|type>>. The size of a reduced hypothesis set is
    denoted as <math|n<rsub|type><around*|(|\<cal-H\>|)>>.
  </definition>

  Based on the definition of <math|n<rsub|type><around*|(|\<cal-H\>|)>>, we
  modified the regret analysis in <cite|liu_one_2023> to obtain the following
  theorem.

  <\theorem>
    <label|thm:regret-analysis>Suppose <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\>>,
    the regret for MEX algorithm with hypothesis set <math|\<cal-H\>> is
    upper bounded by

    <\equation*>
      Regret<around*|(|K|)>\<lesssim\><sqrt|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>\<cdot\>log<around*|(|H n<rsub|type><around*|(|\<cal-H\>|)>/\<delta\>|)>\<cdot\>H
      K>.
    </equation*>
  </theorem>

  We also proved the following lemma,

  <\lemma>
    There exists a policy <math|\<pi\>> such that
    <math|BR<around*|(|\<pi\>|)>=<around*|{|\<mu\><rsub|1>,\<mu\><rsub|2>,\<mu\><rsub|3>|}>>
    and <math|BR<around*|(|\<pi\><rsub|\<varepsilon\>>|)>=<around*|{|\<mu\><rsub|1>,\<mu\><rsub|2>|}>>
    for any <math|\<varepsilon\>\<gtr\>0>. Thus,\ 

    <\equation*>
      V<around*|(|\<mu\><rsub|3>,\<pi\>|)>\<neq\>V<around*|(|\<mu\><rsub|3>,\<pi\><rprime|'>|)>,
    </equation*>

    which violates the condition <eqref|eq:st-condition> in Definition
    <reference|def:strong-type>.
  </lemma>

  <section|Remaining Problems>

  We have three main problems need to be considered:\ 

  <\enumerate>
    <item>Infinite Hypothesis

    <item>Certainty Equivalence

    <item>Comparison of MEX with MAB
  </enumerate>

  <subsection|Infinite Hypothesis>

  Now, we assume <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\><rsup|\<varepsilon\>>>,
  where

  <\equation*>
    \<cal-H\><rsup|\<varepsilon\>>\<triangleq\><around*|{|\<pi\><rsub|\<varepsilon\>>:<around*|\<\|\|\>|\<pi\>-\<pi\><rsub|\<varepsilon\>>|\<\|\|\>>\<leq\>\<varepsilon\>,\<pi\>\<in\>\<cal-H\>|}>.
  </equation*>

  In this case <math|<around*|\||\<cal-H\><rsup|\<varepsilon\>>|\|>=\<infty\>>.
  Thus, we cannot directly apply the regret analysis in <cite|liu_one_2023>.

  <\question>
    Can we apply Theorem <reference|thm:regret-analysis> on the case of
    running MEX on <math|\<cal-H\><rsup|\<varepsilon\>>>?
  </question>

  To answer this question, we need to verify the following hypothesis,

  <\theorem>
    (hypothesis)<with|font-shape|italic| When <math|\<varepsilon\>> is small
    enough (to be determined), <math|n<rsub|type><around*|(|\<cal-H\><rsup|\<varepsilon\>>|)>\<less\>\<infty\>>.>
  </theorem>

  <\remark>
    We may need a weaker denition of <with|font-shape|italic|type> to prove
    the above hypothesis.
  </remark>

  <subsection|Certainty Equivalence Principle>

  Consider the following two model selection methods

  <\equation*>
    f<rsub|CE>\<triangleq\>min<rsub|f\<in\>\<cal-H\>>
    L<rsub|\<cal-D\>><around*|(|f|)>
  </equation*>

  and

  <\equation*>
    f<rsub|MEX>\<triangleq\>max<rsub|f\<in\>\<cal-H\>>
    V<around*|(|f|)>-L<rsub|\<cal-D\>><around*|(|f|)>
  </equation*>

  The data <math|\<cal-D\>> is collected by running optimal policies for
  <math|f<rsub|CE>> and <math|f<rsub|MEX>> respectively.\ 

  <\theorem>
    (hypothesis) There exist a Markov game where
    <math|V<around*|(|f<rsub|MEX>|)>\<gtr\>V<around*|(|f<rsub|CE>|)>> when
    the total episode <math|K> is large enough
  </theorem>

  <subsection|Comparison of MEX with MAB>

  <\question>
    What is the difference between the regret of MEX with <math|\<cal-H\>>
    and the regret of MAB with a reduced hypothesis set
    <math|\<cal-H\><rsub|type>>?
  </question>

  <\bibliography|bib|tm-plain|reference>
    <\bib-list|1>
      <bibitem*|1><label|bib-liu_one_2023>Zhihan Liu, Miao Lu, Wei Xiong, Han
      Zhong, Hao Hu, Shenao Zhang, Sirui Zheng, Zhuoran Yang<localize|, and
      >Zhaoran Wang. <newblock>One Objective to Rule Them All: A Maximization
      Objective Fusing Estimation and Planning for Exploration. <newblock>may
      2023.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|2.1|1>>
    <associate|auto-4|<tuple|2.2|2>>
    <associate|auto-5|<tuple|2.3|2>>
    <associate|auto-6|<tuple|2|2>>
    <associate|bib-liu_one_2023|<tuple|1|2>>
    <associate|def:size-type|<tuple|2|1>>
    <associate|def:strong-type|<tuple|1|1>>
    <associate|eq:st-condition|<tuple|1|1>>
    <associate|thm:regret-analysis|<tuple|3|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      liu_one_2023

      liu_one_2023
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Proved
      Result> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Remaining
      Problems> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Infinite Hypothesis
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Certainty Equivalence
      Principle <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|2.3<space|2spc>Comparison of MEX with MAB
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>