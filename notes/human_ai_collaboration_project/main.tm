<TeXmacs|2.1.1>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|ass>
      Assumption
    </new-remark>
  </hide-preamble>

  <section|Background>

  We consider a two-player episodic Markov game defined as a
  <math|<around*|(|S,s<rsub|abs>,A,P,r,\<gamma\>|)>>, where <math|S> is the
  joint state space and <math|A\<triangleq\>A<rsup|<around*|(|1|)>>\<times\>A<rsup|<around*|(|2|)>>>
  is the joint action space for both players. The transition kernel
  <math|\<bbb-P\>> and the expected reward <math|r> are defined as functions:

  <\equation*>
    \<bbb-P\>:S\<times\>A\<rightarrow\>\<Delta\><around*|(|S|)>,<space|1em>r:S\<times\>A\<rightarrow\><around*|[|0,1|]>.
  </equation*>

  The game terminate when the state, denoted as <math|s>, reaches the
  absorbing state <math|s<rsub|abs>>. We further assume the reward <math|r>
  and the transition kernel <math|\<bbb-P\>> be deterministic.

  <\ass>
    The initial state <math|s<rsub|1><rsup|k>> for each episode <math|k> is
    fixed, i.e., <math|s<rsub|1><rsup|k>=s<rsub|1>> for any
    <math|k\<in\><around*|[|K|]>>.
  </ass>

  <\ass>
    <label|ass:policy-set>Player 2 adopts a stationary policy denoted as
    <math|\<pi\><rsup|<around*|(|2|)>>>, which belongs to the set
    <math|\<cal-H\>>.
  </ass>

  Now, with Assumption <reference|ass:policy-set>, the player 1 faces an
  episodic MDP <math|<around*|(|S,s<rsub|abs>,A<rsup|<around*|(|1|)>>,P<rsup|\<pi\><rsup|<around*|(|2|)>>>,r<rsup|\<pi\><rsup|<around*|(|2|)>>>,\<gamma\>|)>>,
  where

  <\equation*>
    P<rsup|\<pi\><rsup|<around*|(|2|)>>><around*|(|s,a<rsup|<around*|(|1|)>>|)>=\<bbb-P\><around*|(|s,a<rsup|<around*|(|1|)>>,\<pi\><rsup|<around*|(|2|)>><around*|(|s|)>|)>,<space|1em>r<rsup|\<pi\><rsup|<around*|(|2|)>>><around*|(|s,a<rsup|<around*|(|1|)>>|)>=r<around*|(|s,a<rsup|<around*|(|1|)>>,\<pi\><rsup|<around*|(|2|)>><around*|(|s|)>|)>.
  </equation*>

  The policy set <math|\<cal-H\>> induces a set <math|\<cal-P\>> of
  transition kernels and a set <math|\<cal-R\>> for reward functions. We now
  denote

  <\equation*>
    f\<in\>\<cal-H\>\<Leftrightarrow\>\<bbb-P\><rsup|f>\<in\>\<cal-P\>\<Leftrightarrow\>r<rsup|f>\<Leftrightarrow\>\<cal-R\>
  </equation*>

  <subsection|Human Policy Generator>

  We generate human policies

  <subsection|Simplified Overcooked Environment>

  <subsection|Value Iteration>

  The bellman optimality update for player 1 when the player 2's policy is
  fixed is given by

  <\equation*>
    V<rsub|k+1><around*|(|s|)>\<leftarrow\><below|max|a\<in\>A<rsup|<around*|(|1|)>>><around*|(|r<around*|(|s,a|)>+\<gamma\>V<rsub|k><around*|(|s<rprime|'>|)>|)>,
  </equation*>

  where <math|s<rprime|'>=\<bbb-P\><around*|(|s,a|)>>. For the absorbing
  state <math|s<rsub|abs>>

  <\equation*>
    V<around*|(|s<rsub|abs>|)>\<leftarrow\>0.
  </equation*>

  The update terminates until <math|<around*|\<\|\|\>|V<rsub|k+1>-V<rsub|k>|\<\|\|\>><rsub|\<infty\>>\<leq\>\<varepsilon\><rsub|tol>>,
  where <math|\<varepsilon\><rsub|tol>\<gtr\>0> is the tolerence constant.

  <subsection|Q Learning>

  <\equation*>
    Q<rsub|k+1><around*|(|s,a|)>\<leftarrow\>r<around*|(|s,a|)>+\<gamma\><below|max|a\<in\>A<rsup|>>Q<rsub|k><around*|(|s,a|)>
  </equation*>

  <section|Known Hypothesis Set>

  Our objective is to solve a Markov Decision Process (MDP) problem, where
  the transition kernel and the reward function belong to hypothesis sets. In
  each episode <math|k>, the author in <cite|liu_one_2023> attempts to solve
  the following optimization problem:

  <\equation*>
    f<rsup|k>=<below|argmax|f\<in\>\<cal-H\>><around*|{|<below|sup|\<pi\>\<in\>\<Pi\>>V<rsup|\<pi\>><rsub|f><around*|(|s<rsub|1>|)>-\<eta\><above|<below|<big|sum>|s=1>|k-1>
    <above|<below|<big|sum>|h=1>|H>L<rsub|f><around*|(|s<rsub|h><rsup|s>,a<rsub|h><rsup|s,<around*|(|1|)>>,s<rsub|h+1><rsup|s>|)>|}>,
  </equation*>

  where

  <\equation*>
    L<rsub|f><around*|(|s<rsub|h><rsup|s>,a<rsub|h><rsup|s,<around*|(|1|)>>,s<rsub|h+1><rsup|s>|)>\<triangleq\><choice|<tformat|<table|<row|<cell|0>|<cell|if<space|1em>\<bbb-P\><rsup|f><around*|(|s<rsub|h><rsup|s>,a<rsub|h><rsup|s,<around*|(|1|)>>|)>=s<rsub|h+1><rsup|s>>>|<row|<cell|1>|<cell|if<space|1em>\<bbb-P\><rsup|f><around*|(|s<rsub|h><rsup|s>,a<rsub|h><rsup|s,<around*|(|1|)>>|)>\<neq\>s<rsub|h+1><rsup|s>>>>>>.
  </equation*>

  The term <math|sup<rsub|\<pi\>\<in\>\<Pi\>>
  V<rsup|\<pi\>><rsub|f><around*|(|s<rsub|1>|)>> represents the cumulative
  reward when the player <math|1> is taking a best response to player
  <math|2> with policy <math|f>. <math|\<eta\>>\ 

  The author additionally employs a model-based algorithm, utilizing a model
  denoted as <math|f<rsup|k>>, to train a policy represented as
  <math|\<pi\><rsup|k><around*|(|f<rsup|k>|)>> and employs it for data
  collection purposes.

  Please note that the loss function <math|L> defined in this context differs
  from the one presented in <cite|liu_one_2023>, where the author utilizes
  the log-likelihood function. The rationale behind not using the
  log-likelihood function in our case is that the transition kernel in our
  setting is deterministic.

  <\remark>
    In <cite|liu_one_2023>, the <math|V<rsup|\<pi\>><rsub|f><around*|(|s<rsub|1>|)>>
    only depends on the transition kernel <math|\<bbb-P\><rsup|f>>. However,
    in our setting, it also depends on the reward function <math|r<rsup|f>>.
  </remark>

  <\bibliography|bib|tm-plain|human_ai>
    <\bib-list|1>
      <bibitem*|1><label|bib-liu_one_2023>Zhihan Liu, Miao Lu, Wei Xiong, Han
      Zhong, Hao Hu, Shenao Zhang, Sirui Zheng, Zhuoran Yang<localize|, and
      >Zhaoran Wang. <newblock>One Objective to Rule Them All: A Maximization
      Objective Fusing Estimation and Planning for Exploration. <newblock>may
      2023.<newblock>
    </bib-list>
  </bibliography>
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|ass:policy-set|<tuple|2|?>>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|1.1|?>>
    <associate|auto-3|<tuple|1.2|?>>
    <associate|auto-4|<tuple|1.3|?>>
    <associate|auto-5|<tuple|1.4|?>>
    <associate|auto-6|<tuple|2|?>>
    <associate|auto-7|<tuple|3|?>>
    <associate|bib-liu_one_2023|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      liu_one_2023

      liu_one_2023
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Background>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Human Policy Generator
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Simplified Overcooked
      Environment <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Value Iteration
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.4<space|2spc>Q Learning
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Known
      Hypothesis Set> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>