<TeXmacs|2.1.2>

<style|<tuple|generic|title_li>>

<\body>
  <doc-data|<doc-title|Regret Analysis When Realizability Assumption
  Fails>|<doc-author|<author-data|<author-name|Jack Yansong
  Li>|<author-email|yli340@uic.edu>|<\author-affiliation>
    University of Illinois Chicago
  </author-affiliation>>>>

  We consider the case where <math|\<pi\><rsup|\<ast\>>\<nin\>\<cal-H\>>. We
  denote\ 

  <\equation>
    \<varepsilon\><rsub|\<cal-H\>>\<triangleq\>min<rsub|\<pi\>\<in\>\<cal-H\>><around*|\||V<rsup|\<ast\>><around*|(|\<pi\>|)>-V<rsup|\<ast\>><around*|(|\<pi\><rsup|\<ast\>>|)>|\|><label|eq:app-error>
  </equation>

  and

  <\equation*>
    \<pi\><rsub|\<cal-H\>>\<in\><below|arg
    min|\<pi\>\<in\>\<cal-H\>><around*|\||V<rsup|\<ast\>><around*|(|\<pi\>|)>-V<rsup|\<ast\>><around*|(|\<pi\><rsup|\<ast\>>|)>|\|>.
  </equation*>

  The regret is defined as

  <\equation*>
    <big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>,
  </equation*>

  which can be decomposed into the sum of\ 

  <\equation>
    <big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)><label|eq:tp-term>
  </equation>

  and\ 

  <\equation>
    <big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)><label|eq:gec-term>.
  </equation>

  In the following, we call <eqref|eq:tp-term> the type term and
  <eqref|eq:gec-term> the GEC term. For clarification, we also consider the
  following example:\ 

  <\example>
    <label|ex:mab>Consider a normal-form game defined as
    <math|<around*|(|2,A<rsub|joint>=<around*|[|N|]><rsup|2>,r<rsub|joint>=<around*|(|r,r|)>|)>>.
    The shared reward function <math|r> is defined as\ 

    <\equation*>
      r<around*|(|a,b|)>=<choice|<tformat|<table|<row|<cell|1>|<cell|if<space|1em>a=b>>|<row|<cell|0>|<cell|if<space|1em>a\<neq\>b>>>>>.
    </equation*>

    The player <math|2> only takes pure strategy, i.e.,
    <math|\<cal-H\><rsup|\<ast\>>=<around*|[|N|]>>. We consider the case
    where the hypothesis set is not complete, i.e.,
    <math|\<cal-H\>=<around*|[|N-1|]>> and the true strategy of player
    <math|2> is out of the hypothesis set, i.e.,
    <math|\<pi\><rsup|\<ast\>>=N>.
  </example>

  <section|Analysis of the type term>

  By on the choice of <math|\<pi\><rsup|k>> (based on the MEX algorithm), we
  have\ 

  <\equation*>
    V<around*|(|\<psi\><around*|(|\<pi\><rsub|\<cal-H\>>|)>,\<pi\><rsub|\<cal-H\>>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsub|\<cal-H\>>|)>\<leq\>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-\<eta\><big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>
  </equation*>

  for all <math|k\<in\><around*|[|K|]>>. By <eqref|eq:app-error>,
  <math|V<around*|(|\<psi\><around*|(|\<pi\><rsub|\<cal-H\>>|)>,\<pi\><rsub|\<cal-H\>>|)>\<geq\>V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-\<varepsilon\><rsub|\<cal-H\>>>.
  Thus,

  <\equation*>
    V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>\<leq\>\<eta\><around*|(|<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsub|\<cal-H\>>|)>-<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>|)>+\<varepsilon\><rsub|\<cal-H\>>.
  </equation*>

  The term <math|<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsub|\<cal-H\>>|)>-<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>>
  can be bounded using martingale exponential inequality<\footnote>
    The martingale exponential inequality does not require
    <math|\<pi\><rsup|\<ast\>>> or <math|\<pi\><rsub|\<cal-H\>>> belongs to
    <math|\<cal-H\>>.
  </footnote>.

  <\example>
    Adopt the same setting as in Example <reference|ex:mab>, it is clear that
    <math|\<varepsilon\><rsub|\<cal-H\>>=0> and

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>=1-1=0.
    </equation*>
  </example>

  <section|Analysis of the GEC term>

  <\example>
    Adopt the same setting as in Example <reference|ex:mab>, it is clear that\ 

    <\equation*>
      <big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>=K<around*|(|1-0|)>=K.
    </equation*>
  </example>

  The GEC term is bounded by the GEC assumption, i.e., there exist an
  <math|d<around*|(|\<varepsilon\>|)>\<gtr\>0>, such that for all
  <math|<around*|{|\<pi\><rsup|k>|}>\<subset\>\<cal-H\>>,

  <\equation*>
    <big|sum><rsub|k=1><rsup|K>V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>\<leq\>inf<rsub|\<alpha\>\<gtr\>0><around*|{|<frac|\<alpha\>|2>\<cal-L\><rsub|train><around*|(|\<pi\><rsup|k>|)>+\<varphi\><around*|(|\<alpha\>,\<varepsilon\>,H,K|)>|}>,
  </equation*>

  where <math|\<varphi\><around*|(|\<alpha\>,\<varepsilon\>,H,K|)>=d<around*|(|\<varepsilon\>|)>/<around*|(|2\<alpha\>|)>+<sqrt|d<around*|(|\<varepsilon\>|)>H
  K>+\<varepsilon\>H K> and

  <\equation*>
    \<cal-L\><rsub|train><around*|(|\<pi\><rsup|k>|)>=<big|sum><rsub|h,k><big|sum><rsub|s=1><rsup|k-1>\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><around*|(|\<pi\><rsup|k>;\<xi\><rsub|h>|)>|]>.
  </equation*>

  Given <math|\<xi\><rsub|h>\<triangleq\><around*|(|s<rsub|h>,a<rsub|h>,r<rsub|h>,s<rsub|h+1>|)>>,
  <math|\<ell\>> is defined as

  <\equation*>
    \<ell\><around*|(|\<pi\><rsup|k>;\<xi\><rsub|h>|)>\<triangleq\>D<rsub|H><around*|(|\<bbb-P\><around*|(|\<cdot\>\<mid\>s<rsub|h>,a<rsub|h>,\<pi\><rsup|k><around*|(|s<rsub|h>|)>|)>,\<bbb-P\><around*|(|\<cdot\>\<mid\>s<rsub|h>,a<rsub|h>,\<pi\><rsup|\<ast\>><around*|(|s<rsub|h>|)>|)>|)>,
  </equation*>

  where <math|D<rsub|H><around*|(|\<cdot\>\<mid\>\<cdot\>|)>> denotes the
  Hellinger distance. Intuitively, the low GEC assumption states that, in the
  long run, if the hypothesis <math|<around*|{|\<pi\><rsup|k>|}>> has a small
  in-sample training error, i.e., the term

  <\equation*>
    \<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><around*|(|\<pi\><rsup|k>;\<xi\><rsub|h>|)>|]>
  </equation*>

  is small. Then, the prediction error <math|V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|\<ast\>>|)>>
  will also be small. However, the prediction error can never be small in the
  game defined in Example <reference|ex:mab>. Then, what is going wrong?

  The original wrong proof in our AAMAS paper cancled out the term
  <math|\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><around*|(|\<pi\><rsup|k>;\<xi\><rsub|h>|)>|]>>,
  the term is correct on the upper bound of the GEC term. However, the upper
  bound of the type term does not depends on
  <math|-\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><around*|(|\<pi\><rsup|k>;\<xi\><rsub|h>|)>|]>>
  when <math|\<pi\><rsup|\<ast\>>\<nin\>\<cal-H\>>, thus, cannot cancle out
  <math|\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><around*|(|\<pi\><rsup|k>;\<xi\><rsub|h>|)>|]>>
  part in the upper bound of GEC term. To see this, recall that when
  <math|\<pi\><rsup|\<ast\>>\<nin\>\<cal-H\>>, for the type term, we are
  trying to upper bound

  <\equation*>
    <big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsub|\<cal-H\>>|)>-<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>
  </equation*>

  using martingale exponential inequality. However, when
  <math|\<pi\><rsup|\<ast\>>\<in\>\<cal-H\>>, we are trying to upper bound

  <\equation*>
    <big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>.
  </equation*>

  The upper bound of the later can cancle out the term
  <math|\<bbb-E\><rsub|\<xi\><rsub|h>\<sim\>\<mu\><rsup|s>><around*|[|\<ell\><around*|(|\<pi\><rsup|k>;\<xi\><rsub|h>|)>|]>>
  while the former cannot. One way to fix the proof is decompose
  <math|<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsub|\<cal-H\>>|)>-<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>>
  into the sum of <math|<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>>
  and

  <\equation>
    <big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsub|\<cal-H\>>|)>-<big|sum><rsub|h=1><rsup|H>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>,<label|eq:es-error>
  </equation>

  then, we upper bound the term <eqref|eq:es-error>. To do this, we need to
  introduce a new metric to measure the difference of the model induced by
  these policies.

  <section|Additional Issue>

  In the previous section, we show that a new metric should be introduced to
  upper bound the term <eqref|eq:es-error>. However, the term
  <eqref|eq:es-error> is <math|0> in Example <reference|ex:mab>. This is
  because our current definition of <math|L<rsub|h><rsup|k>> only consider
  difference in the transition kernel while ignoring the difference in the
  reward function. Formally, we need to redefine <math|L> to the form as

  <\equation*>
    L<rsub|h><rsup|k><around*|(|\<pi\>|)>\<triangleq\>-log\<bbb-P\><around*|(|s<rsub|h+1><rsup|k>\<mid\>s<rsub|h><rsup|k>.a<rsub|h><rsup|k>,\<pi\><around*|(|s<rsub|h><rsup|k>|)>|)>+\<lambda\><around*|\||r<around*|(|s<rsub|h+1><rsup|k>\<mid\>s<rsub|h><rsup|k>.a<rsub|h><rsup|k>,\<pi\><around*|(|s<rsub|h><rsup|k>|)>|)>-r<around*|(|s<rsub|h+1><rsup|k>\<mid\>s<rsub|h><rsup|k>.a<rsub|h><rsup|k>,\<pi\><rsup|\<ast\>><around*|(|s<rsub|h><rsup|k>|)>|)>|\|>.
  </equation*>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|2>>
    <associate|auto-3|<tuple|3|3>>
    <associate|eq:app-error|<tuple|1|1>>
    <associate|eq:es-error|<tuple|4|3>>
    <associate|eq:gec-term|<tuple|3|1>>
    <associate|eq:tp-term|<tuple|2|1>>
    <associate|ex:mab|<tuple|1|1>>
    <associate|footnote-1|<tuple|1|2>>
    <associate|footnr-1|<tuple|1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Analysis
      of the type term> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Analysis
      of the GEC term> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Additional
      Issue> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>