<TeXmacs|2.1.2>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|def>
      Definition
    </new-remark>
  </hide-preamble>

  <doc-data|<doc-title|Case Study: Realizability>>

  <em|Notation of hypothesis sets>:

  <\itemize>
    <item>Set of all<math|> potential partners:
    <math|\<cal-H\><rsup|\<ast\>>>.

    <item>Hypothesis set of partners: <math|\<cal-H\>>.
  </itemize>

  <section|Summary>

  <\question>
    <em|(SH)> Could you summarize the main differences between this note and
    the one you sent me last week?
  </question>

  <\itemize>
    <item>Fact: GEC depends on <math|\<varepsilon\>> and the choice of
    <math|\<varepsilon\>> usually depends on <math|K> and <math|H> (time
    horizon, in MAB example, <math|H=1>).

    <item>Fact: The regret bound is still linear if
    <math|d<around*|(|\<varepsilon\>|)>> grows linear w.r.t. <math|K>.

    <item>We showed that: By choosing <math|\<varepsilon\>=<around*|\||\<cal-H\>|\|>/K>,
    the GEC <math|d<around*|(|\<varepsilon\>|)>=0>. In this case, the regret
    is upper bounded by <math|\<varepsilon\>K=<around*|\||\<cal-H\>|\|>>.
  </itemize>

  <section|Generalized Eluder Dimension>

  Consider a normal-form game defined as <math|<around*|(|2,A<rsub|joint>=<around*|[|N|]><rsup|2>,r<rsub|joint>=<around*|(|V,V|)>|)>>.
  The shared reward function <math|V> is defined as\ 

  <\equation*>
    V<around*|(|a,b|)>=<choice|<tformat|<table|<row|<cell|1>|<cell|if<space|1em>a=b>>|<row|<cell|0>|<cell|if<space|1em>a\<neq\>b>>>>>.
  </equation*>

  In this game, player <math|2> only adopts a pure strategy, i.e.,
  <math|\<cal-H\><rsup|\<ast\>>=<around*|[|N|]>>. The game is played for
  <math|K> episodes, given the partner's real pure strategy
  <math|\<pi\><rsup|\<ast\>>>.\ 

  In episode <math|k>, the AI agent chooses a response
  <math|\<psi\><around*|(|\<pi\><rsup|k>|)>>, where <math|\<psi\>> is a best
  response oracle, and

  <\equation>
    \<pi\><rsup|k>\<in\><below|arg max|\<pi\>\<in\>\<cal-H\>>
    V<around*|(|\<psi\><around*|(|\<pi\>|)>,\<pi\>|)>-\<eta\>
    L<rsup|k><around*|(|\<pi\>|)>.<label|eq:mex>
  </equation>

  The estimation loss <math|L<rsup|k>> at episode <math|k> is defined as\ 

  <\equation*>
    L<rsup|k>=<big|sum><rsub|s=0><rsup|k-1>L<around*|(|\<pi\>,\<psi\><around*|(|\<pi\><rsup|s>|)>,r<rsup|s>|)>.
  </equation*>

  where <math|L<rsup|0><around*|(|\<pi\>|)>\<equiv\>0>, <math|r<rsup|k-1>> is
  the reward of episode <math|k-1>, and <math|L> is defined as

  <\equation*>
    L<around*|(|\<pi\>,a,r|)>=<choice|<tformat|<table|<row|<cell|0>|<cell|if
    V<around*|(|a,\<pi\>|)>=r>>|<row|<cell|1>|<cell|if
    V<around*|(|a,\<pi\>|)>\<neq\>r>>>>>.
  </equation*>

  The regret of the game is defined as

  <\equation*>
    <big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>,
  </equation*>

  which can be decomposed into the sum of\ 

  <\equation>
    <big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)><label|eq:valueerror><active*|<active*|<active*|<active*|<active*|<active*|<active*|>>>>>>>
  </equation>

  and\ 

  <\equation>
    <big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)><label|eq:prederror>.
  </equation>

  In the following, we call <eqref|eq:valueerror> the <em|value guessed
  error> and <eqref|eq:prederror> the <em|prediction error>. We have already
  proved the following result.<inactive*|> The name of GEC refers to the
  generalized eluder coefficient, defined as\ 

  <\def>
    <em|(GEC)> Given <math|\<varepsilon\>\<gtr\>0>, a best response oracle
    <math|\<psi\>><\footnote>
      The oracle <math|\<psi\>> can be non-best response in the original
      definition of GEC. The truth is, the definition of GEC depends on the
      choice of <math|\<psi\>> and the discrepancy function <math|\<ell\>>.
    </footnote> there exist <math|d\<gtr\>0>, such that for any sequence of
    player 2's pure strategy <math|<around*|{|\<pi\><rsup|k>|}><rsub|k\<in\><around*|[|K|]>>\<subset\>\<cal-H\><rsup|\<ast\>>>,
    and <math|<around*|{|\<psi\><around*|(|\<pi\><rsup|k>|)><rsub|k\<in\><around*|[|K|]>>|}>>,

    <\equation>
      <big|sum><rsub|k\<in\><around*|[|K|]>>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>\<leq\><around*|(|d<big|sum><rsub|k=1><rsup|K><big|sum><rsub|s=1><rsup|k-1>\<ell\><around*|(|\<pi\><rsup|k>;\<pi\><rsup|\<ast\>>|)>|)><rsup|1/2>+<sqrt|d
      K>+\<varepsilon\>K,<label|eq:gec-cond>
    </equation>

    where <math|><math|\<ell\><around*|(|\<pi\><rsup|k>;\<pi\><rsup|\<ast\>>|)>=D<rsub|H><around*|(|V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>,V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>|)>>.
    The smallest <math|d> that satisfies the above inequality is called GEC.
  </def>

  Intuitively, the existence of the GEC states that if the training error
  <math|<big|sum><rsub|k=1><rsup|K><big|sum><rsub|s=1><rsup|k-1>\<ell\><around*|(|\<pi\><rsup|k>;\<pi\><rsup|\<ast\>>|)>>
  is small, then the estimation error <math|<big|sum><rsub|k\<in\><around*|[|K|]>>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>>
  is also small.\ 

  In this note, we only consider the realizable case, i.e.,
  <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\>>. The goal of this note is to
  show that in this game

  <\itemize>
    <item>The GEC assumption holds with a GEC <math|d=0>.

    <item>The regret analysis adopted by the MEX paper <cite|liu_one_2023>
    and the GEC paper <cite|zhong_gec_2023> leads to a regret upper bound
    <math|<around*|\||\<cal-H\>|\|>>.
  </itemize>

  <section|Regret analysis>

  Recall that the regret can be decomposed into

  <\equation*>
    <wide*|<big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)><rsub|>|\<wide-underbrace\>><rsub|<em|value<space|1em>guessed<space|1em>
    \ error>>+<wide*|<big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>|\<wide-underbrace\>><rsub|<em|prediction<space|1em>error>>.
  </equation*>

  By <eqref|eq:mex>, the type error is bounded by

  <\equation*>
    <big|sum><rsub|k>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>\<leq\>\<eta\><big|sum><rsub|k\<in\><around*|[|K|]>>L<rsup|k><around*|(|\<pi\><rsup|\<ast\>>|)>-L<rsup|k><around*|(|\<pi\><rsup|k>|)>=-\<eta\><big|sum><rsub|k\<in\><around*|[|K|]>>L<rsup|k><around*|(|\<pi\><rsup|k>|)>.
  </equation*>

  In the original MEX paper, they showed that the term
  <math|-<big|sum><rsub|k\<in\><around*|[|K|]>>L<rsup|k><around*|(|\<pi\><rsup|k>|)>>
  is upper bound by the negative of the training error, which cancels out the
  training error in the upper bound of the GEC term. The fact that
  <math|-<big|sum><rsub|k\<in\><around*|[|K|]>>L<rsup|k><around*|(|\<pi\><rsup|k>|)>>
  is upper bound by <math|-<big|sum><rsub|k=1><rsup|K><big|sum><rsub|s=1><rsup|k-1>\<ell\><around*|(|\<pi\><rsup|k>;\<pi\><rsup|\<ast\>>|)>>
  means that a large training error implies a large
  <math|<big|sum><rsub|k\<in\><around*|[|K|]>>L<rsup|k><around*|(|\<pi\><rsup|k>|)>>.
  This is intuitive since both <math|L<rsup|k><around*|(|\<pi\><rsup|k>|)>>
  and <math|\<ell\><around*|(|\<pi\><rsup|k>;\<pi\><rsup|\<ast\>>|)>> serve
  as a measure that measures the distance between the guess partner's policy
  <math|\<pi\><rsup|k>> and the true partner policy
  <math|\<pi\><rsup|\<ast\>>>. Now, back to our case, the term
  <math|-<big|sum><rsub|k\<in\><around*|[|K|]>>L<rsup|k><around*|(|\<pi\><rsup|k>|)>>
  is\ 

  <\equation*>
    -<big|sum><rsub|k\<in\><around*|[|K|]>>L<rsup|k><around*|(|\<pi\><rsup|k>|)>=-<big|sum><rsub|k\<in\>K><big|sum><rsub|s=1><rsup|k>L<around*|(|\<pi\><rsup|k>,a<rsup|s>,r<rsup|s>|)>=0.
  </equation*>

  \;

  Thus, the regret is entirely upper bounded by the prediction error, i.e.,

  <\equation*>
    Reg<around*|(|K|)>=<wide*|<big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>|\<wide-underbrace\>><rsub|<em|prediction<space|1em>error>>.
  </equation*>

  With the GEC, the GEC term can be upper bounded by the training error.
  Recall that the training error is

  <\equation*>
    <big|sum><rsub|k=1><rsup|K><big|sum><rsub|s=1><rsup|k-1>\<ell\><around*|(|\<pi\><rsup|k>;\<pi\><rsup|\<ast\>>|)>=<big|sum><rsub|k=1><rsup|K><frac|n<around*|(|k-1|)>|<sqrt|2>>,
  </equation*>

  where the Hellinger distance <math|\<ell\><around*|(|\<pi\><rsup|k>;\<pi\><rsup|\<ast\>>|)>>
  always equals <math|1/<sqrt|2>> for all <math|k\<in\><around*|[|K|]>> where
  <math|\<pi\><rsup|k>\<neq\>\<pi\><rsup|\<ast\>>> and
  <math|n<around*|(|K|)>\<triangleq\><around*|\||<around*|{|k\<mid\>k\<in\><around*|[|K|]>,\<pi\><rsup|k>\<neq\>\<pi\><rsup|\<ast\>>|}>|\|>>.
  It is easy to verify that\ 

  <\equation*>
    n<around*|(|k|)>\<leq\><around*|\||\<cal-H\>|\|>
  </equation*>

  in our setting. Thus, the game we created satisfies the <em|optimism> and
  the <em|small in-sample training error> property mentioned on
  <cite|zhong_gec_2023> page 14. Following the same analysis as in
  <cite|zhong_gec_2023> page 14, we have

  <\equation>
    Reg<around*|(|K|)>\<leq\><sqrt|d K<around*|\||\<cal-H\>|\|>>+<sqrt|d
    K>+\<varepsilon\>K.<label|eq:reg-gec>
  </equation>

  To achieve a sublinear regret, we need a <math|d> that grows sublinear
  w.r.t. <math|K>.

  <\remark>
    The GEC depends on <math|\<varepsilon\>>, which further depends on
    <math|K> (See the discussion of burn-in cost after Definition 3.4 in
    <cite|zhong_gec_2023>). Thus, the GEC also depends on <math|K>.
  </remark>

  <section|The existence of GEC>

  First to note that, we have

  <\equation*>
    <around*|(|d<big|sum><rsub|k=1><rsup|K><big|sum><rsub|s=1><rsup|k-1>\<ell\><around*|(|\<pi\><rsup|k>;\<pi\><rsup|\<ast\>>|)>|)><rsup|1/2>=<around*|(|d<big|sum><rsub|k=1><rsup|K><frac|n<around*|(|k-1|)>|<sqrt|2>>|)><rsup|1/2>
  </equation*>

  \;

  Also,

  <\equation*>
    <big|sum><rsub|k\<in\><around*|[|K|]>>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>=K-<around*|(|K-n<around*|(|K|)>|)>.
  </equation*>

  Thus, for every <math|\<varepsilon\>\<gtr\>0>, if we can find <math|d> such
  that\ 

  <\equation*>
    n<around*|(|K|)>\<leq\><around*|(|d<big|sum><rsub|k=1><rsup|K><frac|n<around*|(|k-1|)>|<sqrt|2>>|)><rsup|1/2>+<sqrt|d
    K>+K,
  </equation*>

  then the GEC assumption holds. The above inequality is equivalent to

  <\equation*>
    d\<geq\><around*|(|<frac|n<around*|(|K|)>-\<varepsilon\>K|<sqrt|<big|sum><rsub|k=1><rsup|K><frac|n<around*|(|k-1|)>|<sqrt|2>>>+<sqrt|
    K>>|)><rsup|2>.
  </equation*>

  Recall that <math|n<around*|(|K|)>\<leq\><around*|\||\<cal-H\>|\|>>. Thus,
  an upper bound for GEC is\ 

  <\equation*>
    d<around*|(|\<varepsilon\>|)>=<around*|(|<frac|<around*|\||\<cal-H\>|\|>-\<varepsilon\>K|<sqrt|<big|sum><rsub|k=1><rsup|K><frac|n<around*|(|k-1|)>|<sqrt|2>>>+<sqrt|
    K>>|)><rsup|2>.
  </equation*>

  Choose <math|\<varepsilon\>=<around*|\||\<cal-H\>|\|>/K> implies
  <math|d<around*|(|\<varepsilon\>|)>=0>. Substituting into
  <eqref|eq:reg-gec> gives

  <\equation*>
    Reg<around*|(|K|)>\<leq\><around*|\||\<cal-H\>|\|>.
  </equation*>

  <\bibliography|bib|tm-plain|AHT>
    <\bib-list|2>
      <bibitem*|1><label|bib-liu_one_2023>Zhihan Liu, Miao Lu, Wei Xiong, Han
      Zhong, Hao Hu, Shenao Zhang, Sirui Zheng, Zhuoran Yang<localize|, and
      >Zhaoran Wang. <newblock>One Objective to Rule Them All: A Maximization
      Objective Fusing Estimation and Planning for Exploration. <newblock>may
      2023.<newblock>

      <bibitem*|2><label|bib-zhong_gec_2023>Han Zhong, Wei Xiong, Sirui
      Zheng, Liwei Wang, Zhaoran Wang, Zhuoran Yang<localize|, and >Tong
      Zhang. <newblock>GEC: A Unified Framework for Interactive Decision
      Making in MDP, POMDP, and Beyond. <newblock>jun 2023.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
    <associate|prog-scripts|scheme>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|2>>
    <associate|auto-4|<tuple|4|3>>
    <associate|auto-5|<tuple|4|4>>
    <associate|bib-liu_one_2023|<tuple|1|4>>
    <associate|bib-zhong_gec_2023|<tuple|2|4>>
    <associate|eq:gec-cond|<tuple|4|2>>
    <associate|eq:mex|<tuple|1|1>>
    <associate|eq:prederror|<tuple|3|2>>
    <associate|eq:reg-gec|<tuple|5|3>>
    <associate|eq:valueerror|<tuple|2|2>>
    <associate|footnote-1|<tuple|1|2>>
    <associate|footnr-1|<tuple|1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      liu_one_2023

      zhong_gec_2023

      zhong_gec_2023

      zhong_gec_2023

      zhong_gec_2023
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Summary>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Generalized
      Eluder Dimension> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Regret
      analysis> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>The
      existence of GEC> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>