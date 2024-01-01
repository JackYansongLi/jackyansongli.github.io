<TeXmacs|2.1.2>

<style|generic>

<\body>
  <\hide-preamble>
    <\new-remark|ass>
      Assumption
    </new-remark>
  </hide-preamble>

  <doc-data|<doc-title|Revised Proof Of AAMAS Paper>>

  <section|Analysis with the realizability assumption>

  <\theorem>
    Given an MDP with generalized eluder coefficient
    <math|d<rsub|GEC><around*|(|\<cdot\>|)>> and a hypothesis set
    <math|\<cal-H\>> that the realizability assumption holds, by setting

    <\equation*>
      \<eta\>=<sqrt|<frac|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>|log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>\<cdot\>H
      K>>,
    </equation*>

    the regret of the MEX algorithm, given <math|\<cal-H\>> and oracle
    <math|\<psi\>>, after <math|K> episodes is upper bounded by, with
    probability at least <math|1-\<delta\>>,

    <\equation*>
      Reg<around*|(|K|)>\<lesssim\><sqrt|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>\<cdot\>log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>\<cdot\>H
      K>.
    </equation*>
  </theorem>

  The statement and the proof of Theorem 1 is correct. However, the meaning
  of Theorem 1 should be revised. In our AAMAS paper, we said:

  <with|font-shape|italic|The sole term related to the size of the hypothesis
  set is <math|n<rsup|\<psi\>><around*|(|\<cal-H\>|)>>. Consequently, the
  magnitude of regret is solely influenced by the type number associated with
  a hypothesis set, as opposed to the size of the hypothesis set. This
  phenomenon occurs because policies that are categorized under the same type
  yield identical rewards when selected by the MEX algorithm. Note that the
  analysis does not rely on merging or eliminating the same type of policies
  from the hypothesis set, the MEX algorithm can ignore the same type of
  policies automatically.>

  This should be revised into:

  <\with|font-shape|italic>
    We reduce the regret upper bound from
    <math|<sqrt|d<rsub|GEC><around*|(|1/<sqrt|H K>|)>\<cdot\>log<around*|(|H
    <around*|\||\<cal-H\>|\|>/\<delta\>|)>\<cdot\>H K>> (proved in the
    original MEX paper) into <math|<sqrt|d<rsub|GEC><around*|(|1/<sqrt|H
    K>|)>\<cdot\>log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>\<cdot\>H
    K>>. The size of the hypothesis set <math|<around*|\||\<cal-H\>|\|>> is
    reduced to the type number <math|n<rsup|\<psi\>><around*|(|\<cal-H\>|)>>.
    However, the term <math|d<rsub|GEC><around*|(|1/<sqrt|H K>|)>> may depend
    on <math|<around*|\||\<cal-H\>|\|>> for some hypothesis sets. Eliminating
    these hypothesis sets requires future research on the structure of MDPs,
    which won't be considered in this paper. The reduction of sample
    complexity occurs because policies that are categorized under the same
    type yield identical rewards when selected by the MEX algorithm. Note
    that the analysis does not rely on merging or eliminating the same type
    of policies from the hypothesis set, the reduction is done automatically.
  </with>

  <section|Analysis without the realizability assumption: revised proof>

  <\theorem>
    Given an MDP with generalized eluder coefficient
    <math|d<rsub|GEC><around*|(|\<cdot\>|)>> and a hypothesis set
    <math|\<cal-H\>>, by setting

    <\equation*>
      \<eta\>=<sqrt|<frac|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>|log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>\<cdot\>H
      K>>,
    </equation*>

    the regret of the MEX algorithm, given <math|\<cal-H\>> and oracle
    <math|\<psi\>>, after <math|K> episodes is upper bounded by, with
    probability at least <math|1-\<delta\>>,

    <\equation*>
      Reg<around*|(|K|)>\<lesssim\><sqrt|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>\<cdot\>log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>\<cdot\>H
      K>+\<varepsilon\><rsub|fin>K+<sqrt|<frac|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>\<cdot\>H K|log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>>>\<varepsilon\><rsub|\<bbb-P\>>K,
    </equation*>

    where <math|\<varepsilon\><rsub|fin>=min<rsub|\<pi\>\<in\>\<cal-H\>><around*|\||V<rsup|\<ast\>><around*|(|\<pi\>|)>-V<rsup|\<ast\>><around*|(|\<pi\><rsup|\<ast\>>|)><rsup|*>|\|>>,
    <math|\<pi\><rsup|\<ast\>><rsub|fin>=argmin<rsub|\<pi\>\<in\>\<cal-H\>><around*|\||V<rsup|\<ast\>><around*|(|\<pi\>|)>-V<rsup|\<ast\>><around*|(|\<pi\><rsup|\<ast\>>|)><rsup|*>|\|>>,
    and <math|\<varepsilon\><rsub|\<bbb-P\>>=max<rsub|<around*|(|s,a,s<rprime|'>|)>>
    log<frac|\<bbb-P\><around*|(|s<rprime|'>\<mid\>s,a,\<pi\><rsup|\<ast\>><rsub|fin><around*|(|s|)>|)>|\<bbb-P\><around*|(|s<rprime|'>\<mid\>s,a,\<pi\><rsup|\<ast\>><around*|(|a|)>|)>>>
  </theorem>

  <\proof>
    Follow the same proof in our AAMAS paper gives us

    <\equation*>
      V<around*|(|\<psi\><around*|(|\<pi\><rsup|\<ast\>>|)>,\<pi\><rsup|\<ast\>>|)>-V<around*|(|\<psi\><around*|(|\<pi\><rsup|k>|)>,\<pi\><rsup|k>|)>\<leq\>\<eta\><big|sum><rsub|s=1><rsup|k><big|sum><rsub|h=1><rsup|H-1><around*|(|L<rsub|h><rsup|s-1><around*|(|\<pi\><rsup|\<ast\>><rsub|fin>|)>-L<rsub|h><rsup|s-1><around*|(|\<pi\><rsup|k>|)>|)>+\<varepsilon\><rsub|fin>.
    </equation*>

    Note that <math|L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>><rsub|fin>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>>
    is the sum of\ 

    <\equation*>
      L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>><rsub|fin>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>
    </equation*>

    and <math|L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|k>|)>>.
    In the wrong proof of our AAMAS paper, we ignored the term
    <math|L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>><rsub|fin>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>>.
    Thus, to revise the proof, the only thing we need to do is to add an
    upper bound of\ 

    <\equation>
      \<eta\><big|sum><rsub|k=1><rsup|K-1><big|sum><rsub|s=1><rsup|k><big|sum><rsub|h=1><rsup|H-1>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>><rsub|fin>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>.<label|eq:bound>
    </equation>

    By the definition of <math|L<rsub|h><rsup|k-1>>, we have\ 

    <\equation*>
      L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>><rsub|fin>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>=log<frac|\<bbb-P\><around*|(|s<rsup|k><rsub|h+1>\<mid\>s<rsup|k><rsub|h>,a<rsup|k><rsub|h>,\<pi\><rsup|\<ast\>><rsub|fin><around*|(|s<rsup|k><rsub|h>|)>|)>|\<bbb-P\><around*|(|s<rsup|k><rsub|h+1>\<mid\>s<rsup|k><rsub|h>,a<rsup|k><rsub|h>,\<pi\><rsup|\<ast\>><around*|(|s<rsup|k><rsub|h>|)>|)>>\<leq\>\<varepsilon\><rsub|\<bbb-P\>>
    </equation*>

    Substituting the above equation into <eqref|eq:bound> gives

    <\align>
      <tformat|<table|<row|<cell|\<eta\><big|sum><rsub|k=1><rsup|K-1><big|sum><rsub|s=1><rsup|k><big|sum><rsub|h=1><rsup|H-1>L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>><rsub|fin>|)>-L<rsub|h><rsup|k-1><around*|(|\<pi\><rsup|\<ast\>>|)>\<leq\>>|<cell|<frac|\<eta\>K<rsup|2>
      H\<varepsilon\><rsub|\<bbb-P\>>|2>>>|<row|<cell|=>|<cell|<sqrt|<frac|d<rsub|GEC><around*|(|1/<sqrt|H
      K>|)>\<cdot\>H K|log<around*|(|H n<rsup|\<psi\>><around*|(|\<cal-H\>|)>/\<delta\>|)>>>\<varepsilon\><rsub|\<bbb-P\>>K.>>>>
    </align>

    \;
  </proof>
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
    <associate|auto-3|<tuple|3|?>>
    <associate|eq:bound|<tuple|1|2>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Analysis
      with the realizability assumption> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Analysis
      without the realizability assumption>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>